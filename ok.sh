#!/bin/bash

folder="photos"

# 切到 photos 文件夹
cd "$folder" || exit

# 找出所有图片文件（按文件名排序）
files=( $(ls | grep -Ei '\.(jpg|jpeg|png|webp)$' | sort) )

i=1

# 先全部重命名成临时名，避免覆盖
for f in "${files[@]}"; do
    mv "$f" "tmp_$i"
    ((i++))
done

# 再按顺序改成 1.jpg、2.jpg ...
i=1
for f in tmp_*; do
    mv "$f" "${i}.jpg"
    ((i++))
done

echo "✅ 已完成重命名！"
