# Maintainer: George Sofianos <george at sofianos dot dev>

# Release notes https://rocm.docs.amd.com/en/latest/about/release-notes.html
_amdgpu_repo='https://repo.radeon.com/amdgpu/7.1.1/ubuntu'
_rocm_repo='https://repo.radeon.com/rocm/apt/7.1.1'
_opencl_lib='opt/rocm-7.1.1/opencl/lib'
_rocm_lib='opt/rocm-7.1.1/lib'
_hip_lib='opt/rocm-7.1.1/hip/lib/'
_amdgpu="opt/amdgpu/lib/x86_64-linux-gnu"
_amdgpu_pro="opt/amdgpu-pro/lib/x86_64-linux-gnu/"

pkgname=opencl-amd
pkgdesc="ROCm components repackaged from AMD's Ubuntu releases (ROCr runtime, OpenCL runtime, HIP runtime) - This package is intended to work along with the free amdgpu stack."
pkgver=7.1.1
pkgrel=1
epoch=1
arch=('x86_64')
url='http://www.amd.com'
license=('custom:AMD')
makedepends=('wget')
depends=('libdrm' 'ocl-icd' 'gcc-libs' 'numactl')
provides=('opencl-driver' 'rocm' 'rocm-core' 'comgr' 'rocm-hip' 'hip' 'hsa-rocr' 'hsa-rocr-dev' 'rocminfo' 'hip-runtime-amd' 'rocm-device-libs' 'rocm-language-runtime' 'rocm-hip-runtime' 'rocm-ocl-icd' 'rocm-opencl-icd-loader' 'rocm-opencl' 'rocm-opencl-dev' 'rocm-opencl-runtime' 'rocm-dbgapi' 'rocm-debug-agent' 'rocm-gdb'
	 'rocprofiler' 'rocprofiler-dev' 'rocprofiler-plugins' 'rocprofiler-register' 'roctracer' 'roctracer-dev' 'hsa-amd-aqlprofile' 'rocm-openmp' 'openmp-extras-runtime' 'rocm-cmake' 'rocm-smi-lib' 'amdsmi' 'amd-smi-lib')
conflicts=('rocm-opencl-runtime' 'rocm' 'rocm-core' 'comgr' 'rocm-hip' 'hip' 'hsa-rocr' 'hsa-rocr-dev' 'rocminfo' 'hip-runtime-amd' 'rocm-device-libs' 'rocm-language-runtime' 'rocm-hip-runtime' 'rocm-ocl-icd' 'rocm-opencl-icd-loader' 'rocm-opencl' 'rocm-opencl-dev' 'rocm-opencl-runtime' 'rocm-dbgapi' 'rocm-debug-agent' 'rocm-gdb'
	 'rocprofiler' 'rocprofiler-dev' 'rocprofiler-plugins' 'rocprofiler-register' 'roctracer' 'roctracer-dev' 'hsa-amd-aqlprofile' 'rocm-openmp' 'openmp-extras-runtime' 'rocm-cmake' 'rocm-smi-lib' 'amdsmi' 'amd-smi-lib')
optdepends=('clinfo' 'opencl-amd-dev')

source=(
# ROCm runtime essentials
"https://repo.radeon.com/rocm/apt/7.1.1/pool/main/a/amd-smi-lib/amd-smi-lib_26.2.0.70101-38~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.1.1/pool/main/c/comgr/comgr_3.0.0.70101-38~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.1.1/pool/main/h/hsa-amd-aqlprofile/hsa-amd-aqlprofile_1.0.0.70101-38~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.1.1/pool/main/h/hsa-rocr/hsa-rocr_1.18.0.70101-38~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.1.1/pool/main/h/hsa-rocr-dev/hsa-rocr-dev_1.18.0.70101-38~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.1.1/pool/main/h/hip-runtime-amd/hip-runtime-amd_7.1.52802.70101-38~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.1.1/pool/main/r/rocm-core/rocm-core_7.1.1.70101-38~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.1.1/pool/main/r/rocminfo/rocminfo_1.0.0.70101-38~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.1.1/pool/main/r/rocm-opencl/rocm-opencl_2.0.0.70101-38~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.1.1/pool/main/r/rocm-opencl-dev/rocm-opencl-dev_2.0.0.70101-38~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.1.1/pool/main/r/rocm-smi-lib/rocm-smi-lib_7.8.0.70101-38~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.1.1/pool/main/r/rocm-device-libs/rocm-device-libs_1.0.0.70101-38~24.04_amd64.deb"
# ROCm runtime other
"https://repo.radeon.com/rocm/apt/7.1.1/pool/main/r/rocprofiler/rocprofiler_2.0.70101.70101-38~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.1.1/pool/main/r/rocprofiler-dev/rocprofiler-dev_2.0.70101.70101-38~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.1.1/pool/main/r/rocprofiler-plugins/rocprofiler-plugins_2.0.70101.70101-38~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.1.1/pool/main/r/rocprofiler-register/rocprofiler-register_0.6.0.70101-38~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.1.1/pool/main/r/rocm-dbgapi/rocm-dbgapi_0.77.4.70101-38~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.1.1/pool/main/r/rocm-debug-agent/rocm-debug-agent_2.1.0.70101-38~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.1.1/pool/main/r/rocm-gdb/rocm-gdb_16.3.70101-38~24.04_amd64.deb"
)

sha256sums=(
"58580c1e9a32090273bfa7b74974649ada0a0a6118f6e1b159f4a35664ac0cda"
"0bf2d4ba3c0ff7a1a1818916f05ee164acb1151ea8685ae11e2c2aae7710eaf7"
"357ff34fbce9c006596cc5c29816a7bd7bd18146d49327ef82bfe659469383b7"
"0c2cc838d3cef73fa405a02e72c2bad1f24ef041a7d46bafa19d7dc0620230d8"
"e5a23a8ad94614a5178943b4e26c49a2bf5c70cd9a66d653f6ec17910157948f"
"b5d86645329574b89d57a8cc836153ec4bf3488a7b12df25e70117404c1da451"
"4098bbfea0e37c23d593d626a6472d6b9d5484bf6c87bc47b4f33d7939cc3161"
"3c5d9f908c0c3b03cec68b71feb40c27bf06161b06e9d0cbbca10836a806322e"
"44abc9a826dbef1d2ab2915e5e642b3cf8872ab7cba806b6181631e75f97b11b"
"fca577ebbaefd6f59664e7e4fafb2b7bb00a75738b5d2fbbf08b3eae99d12216"
"090855a6f74931d9eb8f31e1040cf07d1482bc153ee2621ecdf6d0a57f7307a8"
"d5e97c155473486e8ba7b2ba6b49c666301cd7accfe30f8afba6bf3aa8fb0083"
"ac4aca006af2f88dcc775381146aff2c69924e8d1e3da2884585a07df5232fdc"
"e9a5bf895137fa52b72fcf29caaa0792b5681a9b7c47abd9cd06c557400bc216"
"43abba44e7b3ee0c306229c8f43142d0edf8932f2ae738b8c320ebd493cb5b5b"
"dd1078b96457d92c0e81eccfe4ed61e341f3334ba39b3f468cfb1337fd52ab3f"
"de91f519472c058b617d4fe53ef512e2c9fc89927114003803c01386ba707112"
"c2c324b41082132751115c9b58c5674230daf9117013a9842e432e8961c18206"
"b5730fb34f854cc785fdaf671e32bb2709f31f6eed8497352c106ab27f8ed370"
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
	mv "${pkgdir}/opt/rocm-7.1.1" "${pkgdir}/opt/rocm"	

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
