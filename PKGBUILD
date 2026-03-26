# Maintainer: George Sofianos <george at sofianos dot dev>

# Release notes https://rocm.docs.amd.com/en/latest/about/release-notes.html
_amdgpu_repo='https://repo.radeon.com/amdgpu/7.2.1/ubuntu'
_rocm_repo='https://repo.radeon.com/rocm/apt/7.2.1'
_opencl_lib='opt/rocm-7.2.1/opencl/lib'
_rocm_lib='opt/rocm-7.2.1/lib'
_hip_lib='opt/rocm-7.2.1/hip/lib/'
_amdgpu="opt/amdgpu/lib/x86_64-linux-gnu"
_amdgpu_pro="opt/amdgpu-pro/lib/x86_64-linux-gnu/"

pkgname=opencl-amd
pkgdesc="ROCm components repackaged from AMD's Ubuntu releases (ROCr runtime, OpenCL runtime, HIP runtime) - This package is intended to work along with the free amdgpu stack."
pkgver=7.2.1
pkgrel=1
epoch=1
arch=('x86_64')
url='http://www.amd.com'
license=('custom:AMD')
makedepends=('wget')
depends=('libdrm' 'ocl-icd' 'gcc-libs' 'numactl')
provides=('opencl-driver' 'rocm' 'rocm-core' 'comgr' 'rocm-hip' 'hip' 'hsa-rocr' 'rocminfo' 'hip-runtime-amd' 'rocm-device-libs' 'rocm-language-runtime' 'rocm-hip-runtime' 'rocm-ocl-icd' 'rocm-opencl-icd-loader' 'rocm-opencl' 'rocm-opencl-runtime' 'rocm-dbgapi' 'rocm-debug-agent' 'rocm-gdb'
'rocprofiler' 'rocprofiler-plugins' 'rocprofiler-register' 'roctracer' 'hsa-amd-aqlprofile' 'rocm-openmp' 'openmp-extras-runtime' 'rocm-cmake' 'rocm-smi-lib' 'amdsmi' 'amd-smi-lib')
conflicts=('rocm-opencl-runtime' 'rocm' 'rocm-core' 'comgr' 'rocm-hip' 'hip' 'hsa-rocr' 'rocminfo' 'hip-runtime-amd' 'rocm-device-libs' 'rocm-language-runtime' 'rocm-hip-runtime' 'rocm-ocl-icd' 'rocm-opencl-icd-loader' 'rocm-opencl' 'rocm-opencl-runtime' 'rocm-dbgapi' 'rocm-debug-agent' 'rocm-gdb'
'rocprofiler' 'rocprofiler-plugins' 'rocprofiler-register' 'roctracer' 'hsa-amd-aqlprofile' 'rocm-openmp' 'openmp-extras-runtime' 'rocm-cmake' 'rocm-smi-lib' 'amdsmi' 'amd-smi-lib')
optdepends=('clinfo' 'opencl-amd-dev')

source=(
# ROCm runtime essentials
"https://repo.radeon.com/rocm/apt/7.2.1/pool/main/a/amd-smi-lib/amd-smi-lib_26.2.2.70201-81~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.1/pool/main/c/comgr/comgr_3.0.0.70201-81~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.1/pool/main/h/hsa-amd-aqlprofile/hsa-amd-aqlprofile_1.0.0.70201-81~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.1/pool/main/h/hsa-rocr/hsa-rocr_1.18.0.70201-81~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.1/pool/main/h/hsa-rocr-dev/hsa-rocr-dev_1.18.0.70201-81~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.1/pool/main/h/hip-runtime-amd/hip-runtime-amd_7.2.53211.70201-81~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.1/pool/main/r/rocm-core/rocm-core_7.2.1.70201-81~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.1/pool/main/r/rocminfo/rocminfo_1.0.0.70201-81~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.1/pool/main/r/rocm-opencl/rocm-opencl_2.0.0.70201-81~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.1/pool/main/r/rocm-opencl-dev/rocm-opencl-dev_2.0.0.70201-81~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.1/pool/main/r/rocm-smi-lib/rocm-smi-lib_7.8.0.70201-81~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.1/pool/main/r/rocm-device-libs/rocm-device-libs_1.0.0.70201-81~24.04_amd64.deb"
# ROCm runtime other
"https://repo.radeon.com/rocm/apt/7.2.1/pool/main/r/rocprofiler/rocprofiler_2.0.70201.70201-81~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.1/pool/main/r/rocprofiler-dev/rocprofiler-dev_2.0.70201.70201-81~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.1/pool/main/r/rocprofiler-plugins/rocprofiler-plugins_2.0.70201.70201-81~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.1/pool/main/r/rocprofiler-register/rocprofiler-register_0.6.0.70201-81~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.1/pool/main/r/rocm-dbgapi/rocm-dbgapi_0.77.4.70201-81~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.1/pool/main/r/rocm-debug-agent/rocm-debug-agent_2.1.0.70201-81~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.1/pool/main/r/rocm-gdb/rocm-gdb_16.3.70201-81~24.04_amd64.deb"
)

sha256sums=(
"56c4199720b8fa5efbf1aa0a927d4eda5b485852a964b5a51ebea43997200771"
"7aec222a4cfdaeafd8689ad9739688f74d1d7a1227d7f6db3237736f3fa2fec2"
"c93b312c5f4fb94176881670005ec11ece2276ab96e2d72511b6e19d18303000"
"680cf1dec896732a7a3324eb5650ec9ffdca95f152bbb891dea7799206a9adc5"
"03a9277d715bd0c97a73d2dc7455ab2edfe1bf5b9ee63a6a0356c2fa14d9d395"
"1a1be2e7d8e5658922084533216c6a079138f5ca5af3247181db617bff2a5e0d"
"a298fc25c8256d7efe0f6ed91e3eb31898c19562304b129ed80f4dac3b1844f6"
"416c4cd6e96c7b99007c9f0f5dd20a2c6ab4afe2ee1a7266c09d958b90266418"
"4b778d1db13846078cd165bbbab5e5faf0e4c7f5639beebeb5891c76976d46ce"
"b6eeccb8b18c0cc141f872815ef8a8ff31c66875ee8e1799f5d7ca7a72589172"
"9aaef95bd85dbc8131fbc019c9c57246cc39d8a617b5832a212a277f19bfd87a"
"5cdbb764a564c9749c026314aa376ead100bec3419c96bc676577896bbf52827"
"c50417ac51f54340a4ed3cace06a98dd0a423089aaa833f8f1693e71c369af69"
"61db67e7a5934144418f0a931a1d5c332f678cd305c79b19f328f8b607a02f25"
"5b3b9a8e20773186031a3b2feb8db54c4eb94c0ebbc6a81c909d8f8c9fc53d72"
"027f3ba3fff5f226cb9e4ec8b9fe4d5c2bc5b55db6ad292efc2d77cbcaad8d81"
"fe73180d2d8b7b1c62aba9fa192e2b47fd469b0bf03da2e344aba0859b500a5d"
"5b6970e4fe77313d40bb0a193631efd44073627a53f379958615284802c4547c"
"992684f92b13a8f835eaa8463c52514cb9ccf32ccd07eb2a4d858e044592b959"
)

package() {
    for p in *.deb; do
        ar x "${p}"
        if [[ -f data.tar.gz ]]; then
            # echo gz: "${srcdir}/${p}"
            tar xfx data.tar.gz
            rm data.tar.gz
        elif [[ -f data.tar.xz ]]; then
            # echo xz: "${srcdir}/${p}"
            tar xJf data.tar.xz
            rm data.tar.xz
        fi
    done

    mv "${srcdir}/opt/" "${pkgdir}/"
    mv "${pkgdir}/opt/rocm-7.2.1" "${pkgdir}/opt/rocm"

    mkdir -p "${pkgdir}/opt/amdgpu/share/libdrm"
    cd "${pkgdir}/opt/amdgpu/share/libdrm"
    ln -s /usr/share/libdrm/amdgpu.ids amdgpu.ids

    mkdir -p "${pkgdir}/etc/OpenCL/vendors"
    echo libamdocl64.so > "${pkgdir}/etc/OpenCL/vendors/amdocl64.icd"

    mkdir -p "${pkgdir}/etc/ld.so.conf.d"
    echo /opt/rocm/lib >> "$pkgdir/etc/ld.so.conf.d/opencl-amd.conf"
    echo /opt/rocm/hip/lib >> "$pkgdir/etc/ld.so.conf.d/opencl-amd.conf"

    mkdir -p "${pkgdir}/etc/profile.d"
    echo export PATH="\${PATH}:/opt/rocm/bin:/opt/rocm/hip/bin" > "$pkgdir/etc/profile.d/opencl-amd.sh"
}
