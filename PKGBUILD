# Maintainer: George Sofianos <george at sofianos dot dev>

# Release notes https://rocm.docs.amd.com/en/latest/about/release-notes.html
_amdgpu_repo='https://repo.radeon.com/amdgpu/7.2/ubuntu'
_rocm_repo='https://repo.radeon.com/rocm/apt/7.2'
_opencl_lib='opt/rocm-7.2.0/opencl/lib'
_rocm_lib='opt/rocm-7.2.0/lib'
_hip_lib='opt/rocm-7.2.0/hip/lib/'
_amdgpu="opt/amdgpu/lib/x86_64-linux-gnu"
_amdgpu_pro="opt/amdgpu-pro/lib/x86_64-linux-gnu/"

pkgname=opencl-amd
pkgdesc="ROCm components repackaged from AMD's Ubuntu releases (ROCr runtime, OpenCL runtime, HIP runtime) - This package is intended to work along with the free amdgpu stack."
pkgver=7.2.0
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
"https://repo.radeon.com/rocm/apt/7.2/pool/main/a/amd-smi-lib/amd-smi-lib_26.2.1.70200-43~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2/pool/main/c/comgr/comgr_3.0.0.70200-43~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2/pool/main/h/hsa-amd-aqlprofile/hsa-amd-aqlprofile_1.0.0.70200-43~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2/pool/main/h/hsa-rocr/hsa-rocr_1.18.0.70200-43~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2/pool/main/h/hsa-rocr-dev/hsa-rocr-dev_1.18.0.70200-43~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2/pool/main/h/hip-runtime-amd/hip-runtime-amd_7.2.26015.70200-43~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2/pool/main/r/rocm-core/rocm-core_7.2.0.70200-43~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2/pool/main/r/rocminfo/rocminfo_1.0.0.70200-43~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2/pool/main/r/rocm-opencl/rocm-opencl_2.0.0.70200-43~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2/pool/main/r/rocm-opencl-dev/rocm-opencl-dev_2.0.0.70200-43~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2/pool/main/r/rocm-smi-lib/rocm-smi-lib_7.8.0.70200-43~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2/pool/main/r/rocm-device-libs/rocm-device-libs_1.0.0.70200-43~24.04_amd64.deb"
# ROCm runtime other
"https://repo.radeon.com/rocm/apt/7.2/pool/main/r/rocprofiler/rocprofiler_2.0.70200.70200-43~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2/pool/main/r/rocprofiler-dev/rocprofiler-dev_2.0.70200.70200-43~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2/pool/main/r/rocprofiler-plugins/rocprofiler-plugins_2.0.70200.70200-43~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2/pool/main/r/rocprofiler-register/rocprofiler-register_0.6.0.70200-43~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2/pool/main/r/rocm-dbgapi/rocm-dbgapi_0.77.4.70200-43~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2/pool/main/r/rocm-debug-agent/rocm-debug-agent_2.1.0.70200-43~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.2/pool/main/r/rocm-gdb/rocm-gdb_16.3.70200-43~24.04_amd64.deb"
)

sha256sums=(
"0ff4bff13b72ee4d7d4915831e3d8d024c69e4b931f162b2c4ff3335386d636a"
"fbb1719379fff8b5a8013b3b88a179fe0598d75ff75cf33daa237c78711df3a9"
"ebc34ebabebbcb1c378dee3d5d063af12a82a131ffd2ffc336d0924b427cd0c9"
"4741b1d34698a426ad9736a675bf9c8456e7239bce5cc03d6a33dbe9dc50776b"
"f48f974a5df1930591e6bcc153c4e6430509f8363dff56829e48b64ac97aab98"
"6c84126532d302ecc40ab837cc3042e9dd5f72b319f08772127bed7ca6275037"
"2e00e742653cc2ae271113793e0a1106e6a23d229a2a6f596dc90f5820ac4f46"
"3ae0dea128f27545e423a0c86101282e487d9e94f7dbb09d7220dd844713de05"
"fe8eb19cc43d19f629391d65f8724a0144db7ca3d8325ce6b30605a58f4e90b7"
"695ee31beef06397673108bf48edbcd0080c9aff2fb97315ef8bcbc26422a97d"
"cb3a3abb61a0803e67027599b4e7b214c845dc0428b5a0f247f00f87a548955f"
"cfcb24438de2d181f16ce568d0dfac877164c2dab3784007d5a159fbac708e29"
"64ecb04f59e4d0a51517c224e358e6f336f5b585ef8a7622d02b8d0916032310"
"d5513d0b42d763d782da0c108fa11db7d1d6dbf499bc57682fc1f4f84ad67cf5"
"4f2044c5c6e46102e9545f1365374aad9431e94c4ef3dbcba036708d96002cd9"
"3f2bb2f8af06d06f730f8acaea746b05433e9b1c3bc5f0d6dba085b9c469bd1b"
"4608f1a295eaa48c352db8a9c2245fe8ecab77120969a18c708dd46a5e1341b4"
"8201d2b8350e1f40024ba97f1190504dbfdc4086c5439ca11f20eded0750795e"
"66b640408d8908488fd90718e9881f463381a02e5cd2cb65ae05ad4bc33af9ff"
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
	mv "${pkgdir}/opt/rocm-7.2.0" "${pkgdir}/opt/rocm"	

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
