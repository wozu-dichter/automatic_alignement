#! /bin/bash

# this is the install file for MsMrDTW_for_SonicVisualiser 
# it should 
# 1. detect where this folder lives and save that in $HERE
# -> this should be $0 
MY_NAME=$0
echo $MY_NAME

MY_DIRECTORY=$(dirname $MY_NAME)
echo $MY_DIRECTORY

# 2. replace [YOUR_PATH] in various files 
cp -f "${MY_DIRECTORY}"/MrMsDTW_for_sv_bash.sh_ "${MY_DIRECTORY}"/MrMsDTW_for_sv_bash.sh

#MY_DIRECTORY_SED=$(echo "${MY_DIRECTORY}" | sed -e 's/\/\_[]$.*[\^]/\\&/g' )
#echo sed -i "s/\[YOUR\_PATH\]/${MY_DIRECTORY_SED}/g" MrMsDTW_for_sv_bash.sh
echo sed -i "s|[YOUR_PATH]|${MY_DIRECTORY}|" "${MY_DIRECTORY}"/MrMsDTW_for_sv_bash.sh
sed -i 's|\[YOUR_PATH\]|'${MY_DIRECTORY}'|g' "${MY_DIRECTORY}"/MrMsDTW_for_sv_bash.sh

# 3. edit sonic visualiser config file
SV_CONFIG="~/.config/sonic-visualiser/Sonic Visualiser.conf"
sed -i "/\[Alignment\]/d" "${SV_CONFIG}"
sed -i "/alignment\-program/d" "${SV_CONFIG}"
sed -i "/alignment\-type/d" "${SV_CONFIG}"
echo '[Alignment]
alignment-program='"${MY_DIRECTORY}"'/mrmsdtw_for_sv.py
alignment-type=external-program-alignment' >> "${SV_CONFIG}"

# # 4. install anaconda
# source '~/miniconda3/etc/profile.d/conda.sh'
# conda create -n mrmsdtw2 python=3.7

# # 5. install requirements 
# conda deactivate
# conda activate mrmsdtw2
# pip install -r ${MY_DIRECTORY}/requirement_mrmsdtw.txt


# # 6. chmod the align shell file to be executable
# chmod +x ${MY_DIRECTORY}/mrmsdtw_for_sv.py
# chmod +x ${MY_DIRECTORY}/MrMsDTW_for_sv_bash.sh
