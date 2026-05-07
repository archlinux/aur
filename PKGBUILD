# Maintainer: George Sofianos <george at sofianos dot dev>

# Release notes https://rocm.docs.amd.com/en/latest/about/release-notes.html
_amdgpu_repo='https://repo.radeon.com/amdgpu/7.2.3/ubuntu'
_rocm_repo='https://repo.radeon.com/rocm/apt/7.2.3'
_opencl_lib='opt/rocm-7.2.3/opencl/lib'
_rocm_lib='opt/rocm-7.2.3/lib'
_hip_lib='opt/rocm-7.2.3/hip/lib/'
_amdgpu="opt/amdgpu/lib/x86_64-linux-gnu"
_amdgpu_pro="opt/amdgpu-pro/lib/x86_64-linux-gnu/"

pkgname=opencl-amd
pkgdesc="ROCm components repackaged from AMD's Ubuntu releases (ROCr runtime, OpenCL runtime, HIP runtime) - This package is intended to work along with the free amdgpu stack."
pkgver=7.2.3
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
"https://repo.radeon.com/rocm/apt/7.2.3/pool/main/a/amd-smi-lib/amd-smi-lib_26.2.2.70203-90~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.3/pool/main/c/comgr/comgr_3.0.0.70203-90~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.3/pool/main/h/hsa-amd-aqlprofile/hsa-amd-aqlprofile_1.0.0.70203-90~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.3/pool/main/h/hsa-rocr/hsa-rocr_1.18.0.70203-90~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.3/pool/main/h/hsa-rocr-dev/hsa-rocr-dev_1.18.0.70203-90~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.3/pool/main/h/hip-runtime-amd/hip-runtime-amd_7.2.53211.70203-90~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.3/pool/main/r/rocm-core/rocm-core_7.2.3.70203-90~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.3/pool/main/r/rocminfo/rocminfo_1.0.0.70203-90~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.3/pool/main/r/rocm-opencl/rocm-opencl_2.0.0.70203-90~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.3/pool/main/r/rocm-opencl-dev/rocm-opencl-dev_2.0.0.70203-90~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.3/pool/main/r/rocm-smi-lib/rocm-smi-lib_7.8.0.70203-90~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.3/pool/main/r/rocm-device-libs/rocm-device-libs_1.0.0.70203-90~24.04_amd64.deb"
# ROCm runtime other
"https://repo.radeon.com/rocm/apt/7.2.3/pool/main/r/rocprofiler/rocprofiler_2.0.70203.70203-90~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.3/pool/main/r/rocprofiler-dev/rocprofiler-dev_2.0.70203.70203-90~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.3/pool/main/r/rocprofiler-plugins/rocprofiler-plugins_2.0.70203.70203-90~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.3/pool/main/r/rocprofiler-register/rocprofiler-register_0.6.0.70203-90~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.3/pool/main/r/rocm-dbgapi/rocm-dbgapi_0.77.4.70203-90~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.3/pool/main/r/rocm-debug-agent/rocm-debug-agent_2.1.0.70203-90~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2.3/pool/main/r/rocm-gdb/rocm-gdb_16.3.70203-90~24.04_amd64.deb"
)

sha256sums=(
"3148f477df52f1c02e20b76d450090a357b9d1d28d463b23acfd9adf433aaef0"
"8b06233cf94891404a1485f435045edafa842441e3d6358b1fa5f9783ea540c2"
"bef36b3785c2687cf3a8692a4337adcd2907fad1441e861985689fbf159a6b2f"
"6c8ac83309637e162ed26eb8c97fdf347e6fc6d9700914d75650e85397c1821e"
"c609150ac4e1a3fa281110c6bc66cf425956599dae84f375fd693d7104b11378"
"a23c99e2f0ebf7c1287417a6dca63643670d54fd94380122674fba80686edeea"
"372cce4b73ba244a1b93147f1e3fde111e41506e59ea0d04a23d284666f6d0e2"
"4e06521d158ed07775239ec684d8e3c9cb59edb406891c9a18358ec7bc3247c0"
"a741d6b2465153b965afca82d2a2d95894790f392c8354d5152c83613d4da4af"
"9b7745d0d4ee7013cbcd6a269b1fa1862cb4ae346abe10184fc28a0834dc90a4"
"2997c3db8b5871861371fa61bd4380fed4ed8c9df095d08375694d562aa4e0a9"
"a650e69a9fdd4e658217bea3bebeb477cade8107f3cf6e921cf821e592cc8035"
"dbf225f1438bab3e6ab2f2b960307d9fdf4269836dd9b86125a4bdadd2c5cdb9"
"4dc709135b9ab3febb57a93ce57a1533b5c6059902ed278512a0d8139f1a7d9b"
"b9651471e7d14f53d8a91ec16aa55656e0cb141f3637a9b4677c04d01d63628e"
"ebb06aec60237fd853ca42b2c2fceab2739db8f1ba9c08afc625dc9d1a4f91ef"
"53dcabcc2aeafefcaeaa1148b08b041a35791d78626061cfa4252743fc12ad58"
"27b8273d43a9bb696f6c0e4fecef043a80a1e2a9d9e62b3132ec36ce5b35df2e"
"29cc9ea655ade19c0b5fd31eea42f2e6c0ca07acb77edc3ecd5e158118cd729d"
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
    mv "${pkgdir}/opt/rocm-7.2.3" "${pkgdir}/opt/rocm"

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
