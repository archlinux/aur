# Maintainer: George Sofianos <george at sofianos dot dev>

# Release notes https://rocm.docs.amd.com/en/latest/about/release-notes.html
_amdgpu_repo='https://repo.radeon.com/amdgpu/7.1/ubuntu'
_rocm_repo='https://repo.radeon.com/rocm/apt/7.1'
_opencl_lib='opt/rocm-7.1.0/opencl/lib'
_rocm_lib='opt/rocm-7.1.0/lib'
_hip_lib='opt/rocm-7.1.0/hip/lib/'
_amdgpu="opt/amdgpu/lib/x86_64-linux-gnu"
_amdgpu_pro="opt/amdgpu-pro/lib/x86_64-linux-gnu/"

pkgname=opencl-amd
pkgdesc="ROCm components repackaged from AMD's Ubuntu releases (ROCr runtime, OpenCL runtime, HIP runtime) - This package is intended to work along with the free amdgpu stack."
pkgver=7.1.0
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
"https://repo.radeon.com/rocm/apt/7.1/pool/main/a/amd-smi-lib/amd-smi-lib_26.1.0.70100-20~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.1/pool/main/c/comgr/comgr_3.0.0.70100-20~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.1/pool/main/h/hsa-amd-aqlprofile/hsa-amd-aqlprofile_1.0.0.70100-20~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.1/pool/main/h/hsa-rocr/hsa-rocr_1.18.0.70100-20~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.1/pool/main/h/hsa-rocr-dev/hsa-rocr-dev_1.18.0.70100-20~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.1/pool/main/h/hip-runtime-amd/hip-runtime-amd_7.1.25424.70100-20~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.1/pool/main/r/rocm-core/rocm-core_7.1.0.70100-20~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.1/pool/main/r/rocminfo/rocminfo_1.0.0.70100-20~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.1/pool/main/r/rocm-opencl/rocm-opencl_2.0.0.70100-20~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.1/pool/main/r/rocm-opencl-dev/rocm-opencl-dev_2.0.0.70100-20~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.1/pool/main/r/rocm-smi-lib/rocm-smi-lib_7.8.0.70100-20~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.1/pool/main/r/rocm-device-libs/rocm-device-libs_1.0.0.70100-20~24.04_amd64.deb"
# ROCm runtime other
"https://repo.radeon.com/rocm/apt/7.1/pool/main/r/rocprofiler/rocprofiler_2.0.70100.70100-20~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.1/pool/main/r/rocprofiler-dev/rocprofiler-dev_2.0.70100.70100-20~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.1/pool/main/r/rocprofiler-plugins/rocprofiler-plugins_2.0.70100.70100-20~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.1/pool/main/r/rocprofiler-register/rocprofiler-register_0.6.0.70100-20~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.1/pool/main/r/rocm-dbgapi/rocm-dbgapi_0.77.4.70100-20~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.1/pool/main/r/rocm-debug-agent/rocm-debug-agent_2.1.0.70100-20~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.1/pool/main/r/rocm-gdb/rocm-gdb_16.3.70100-20~24.04_amd64.deb"
)

sha256sums=(
"64dd00d15c81b77b69c5be5083b441d5e2b451bb5c592685875e57cc0fc47732"
"c52aa27638f3a40edb9db3136912c574670848befd20d671a5c017832d6a1378"
"c2d9ec8b786995c3464b89aadc19c2b8ac3594d811514309b4baef03f0631e56"
"635de96e14e6b70d4a2dbed9427b86e5c36c88a20bcc873d3f7d620ca711e18c"
"dcd460b579c9d073e9d4ab85a5a07a78913f90a5c7df2f3ce77e0d7eb2de065e"
"c5bab8b4b588656acdacf96ec9970cb54e859b50da79a5a9b1cbac942dd38223"
"afbb518300fa51b21795c1d27828af13369699046b5b3034455d4c581c314fc4"
"3152a17a552c6cc7f2f50c0dfeea1464e2856c8f000ccc289c1d4f8bd349bd78"
"d5c465305933aa9c68ebbb1fcac19b708756cd345880468fe13dc8b915510f9b"
"3c793b617a5c6f59117954017d18998cb93135711ff45f18e2fc445dd9f5649e"
"4c98b6833eafa2b39afce2eae5c10d092aabda0e2e45eb983857a278dc812181"
"f935d843dcf54db67072056e9fdfbd702464cfa6a36a0fccb4b5eaed3d70c4d2"
"c20201d45438dbd7239d6bf0f03e8d4452c8a38ef048851db3ed01afa309db65"
"33c022b1e3c1e5f14b73c8358638e084d6bd1004fc11540a2a364e4d8ace650d"
"505574fcf595de3a9a9f2efc7037b60e334e5a19cddef2b24f2abbb2d1c84779"
"df3f016d466c28934aaace47c3194af30b40019d0c03e26acadbd095ffde6f94"
"02cedc8cfa1383bb3be4a5962635d041a12ecc8a37ac03e61f26bf2bab81ea36"
"8ef3f62aea31210aea848c64a800ca4e126c3f4116bad09a1d902541d46aca45"
"f8972a11c4171ca5598d677caec496692c89243029705601a392a47b7b81c355"
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
	mv "${pkgdir}/opt/rocm-7.1.0" "${pkgdir}/opt/rocm"	

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
