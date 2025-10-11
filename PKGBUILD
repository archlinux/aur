# Maintainer: George Sofianos <george at sofianos dot dev>

# Release notes https://rocm.docs.amd.com/en/latest/about/release-notes.html
_amdgpu_repo='https://repo.radeon.com/amdgpu/7.0.2/ubuntu'
_rocm_repo='https://repo.radeon.com/rocm/apt/7.0.2'
_opencl_lib='opt/rocm-7.0.2/opencl/lib'
_rocm_lib='opt/rocm-7.0.2/lib'
_hip_lib='opt/rocm-7.0.2/hip/lib/'
_amdgpu="opt/amdgpu/lib/x86_64-linux-gnu"
_amdgpu_pro="opt/amdgpu-pro/lib/x86_64-linux-gnu/"

pkgname=opencl-amd
pkgdesc="ROCm components repackaged from AMD's Ubuntu releases (ROCr runtime, OpenCL runtime, HIP runtime) - This package is intended to work along with the free amdgpu stack."
pkgver=7.0.2
pkgrel=1
epoch=1
arch=('x86_64')
url='http://www.amd.com'
license=('custom:AMD')
makedepends=('wget')
depends=('libdrm' 'ocl-icd' 'gcc-libs' 'numactl')
provides=('opencl-driver' 'rocm' 'rocm-core' 'comgr' 'rocm-hip' 'hip' 'hsa-rocr' 'hsa-rocr-dev' 'rocminfo' 'hip-runtime-amd' 'rocm-device-libs' 'rocm-language-runtime' 'rocm-hip-runtime' 'rocm-ocl-icd' 'rocm-opencl-icd-loader' 'rocm-opencl' 'rocm-opencl-dev' 'rocm-opencl-runtime' 'rocm-dbgapi' 'rocm-debug-agent' 'rocm-gdb'
	 'rocprofiler' 'rocprofiler-dev' 'rocprofiler-plugins' 'rocprofiler-register' 'roctracer' 'roctracer-dev' 'hsa-amd-aqlprofile' 'rocm-openmp' 'openmp-extras-runtime' 'rocm-cmake' 'rocm-smi-lib' 'amd-smi-lib')
conflicts=('rocm-opencl-runtime' 'rocm' 'rocm-core' 'comgr' 'rocm-hip' 'hip' 'hsa-rocr' 'hsa-rocr-dev' 'rocminfo' 'hip-runtime-amd' 'rocm-device-libs' 'rocm-language-runtime' 'rocm-hip-runtime' 'rocm-ocl-icd' 'rocm-opencl-icd-loader' 'rocm-opencl' 'rocm-opencl-dev' 'rocm-opencl-runtime' 'rocm-dbgapi' 'rocm-debug-agent' 'rocm-gdb'
	 'rocprofiler' 'rocprofiler-dev' 'rocprofiler-plugins' 'rocprofiler-register' 'roctracer' 'roctracer-dev' 'hsa-amd-aqlprofile' 'rocm-openmp' 'openmp-extras-runtime' 'rocm-cmake' 'rocm-smi-lib' 'amd-smi-lib')
optdepends=('clinfo' 'opencl-amd-dev')

source=(
# ROCm runtime essentials
"https://repo.radeon.com/rocm/apt/7.0.2/pool/main/a/amd-smi-lib/amd-smi-lib_26.0.2.70002-56~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0.2/pool/main/c/comgr/comgr_3.0.0.70002-56~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0.2/pool/main/h/hsa-amd-aqlprofile/hsa-amd-aqlprofile_1.0.0.70002-56~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0.2/pool/main/h/hsa-rocr/hsa-rocr_1.18.0.70002-56~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0.2/pool/main/h/hsa-rocr-dev/hsa-rocr-dev_1.18.0.70002-56~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0.2/pool/main/h/hip-runtime-amd/hip-runtime-amd_7.0.51831.70002-56~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0.2/pool/main/r/rocm-core/rocm-core_7.0.2.70002-56~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0.2/pool/main/r/rocminfo/rocminfo_1.0.0.70002-56~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0.2/pool/main/r/rocm-opencl/rocm-opencl_2.0.0.70002-56~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0.2/pool/main/r/rocm-opencl-dev/rocm-opencl-dev_2.0.0.70002-56~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0.2/pool/main/r/rocm-smi-lib/rocm-smi-lib_7.8.0.70002-56~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0.2/pool/main/r/rocm-device-libs/rocm-device-libs_1.0.0.70002-56~24.04_amd64.deb"
# ROCm runtime other
"https://repo.radeon.com/rocm/apt/7.0.2/pool/main/r/rocprofiler/rocprofiler_2.0.70002.70002-56~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0.2/pool/main/r/rocprofiler-dev/rocprofiler-dev_2.0.70002.70002-56~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0.2/pool/main/r/rocprofiler-plugins/rocprofiler-plugins_2.0.70002.70002-56~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0.2/pool/main/r/rocprofiler-register/rocprofiler-register_0.6.0.70002-56~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0.2/pool/main/r/rocm-dbgapi/rocm-dbgapi_0.77.4.70002-56~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0.2/pool/main/r/rocm-debug-agent/rocm-debug-agent_2.1.0.70002-56~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/7.0.2/pool/main/r/rocm-gdb/rocm-gdb_16.3.70002-56~24.04_amd64.deb"
)

sha256sums=(
"f3c259f0535ec17e4b17c116049f3bdf6322ff28d60e502b79f5c1de3ccd8e30"
"d24fe9eefbb7c7d85c6e18a76ee812c97e82822aeb1d3b8f41002a73d43a8d5f"
"41d01a6dfc83ac8b3f3829c19c13cc835a6295a9d6a29efe3d82f9d9e05338a3"
"5bc03c8f9f823ea1a7546fc7935714ab4d437d707ba54816ad6aa73e10f430e1"
"d053885bd168a5751df8e2e98f841ddf0f665c52cb7b0480006a42bd8f20d559"
"358e6050486237d6388a4eaad66bba2577bf8435c25aa47128af0074a82b74c6"
"32574bb04134a1163408d411e37de693394df937ed4f747faa00b786030fd750"
"7024a953111535b09e167fa48b7bca458c3b154ebd58576055521527f3859611"
"f2757721c692bae4504da6fd63c72a167dc122528f2973e02e5c2703077fd4a5"
"02c412bf32051cec67201161cf3a4cf2d3b5bf3c1584986aff152bdbae215eaf"
"aaf047120210628933c402236fd4263b3baf761710bac21a3699823949dcf089"
"12fc3b0545cc128ae3c9b2451b017b3d82a9b69c526ac52701cd55c172db3500"
"f1a686f89eb0aca808044607192a1039f9b8af63a4bdc78fc3353ae8110fe410"
"96205aabfd906c29ea92873513a1ab7ce91dedb229a0fd27d09424e4f117bccd"
"a31973887e4773024461118292c57557d127fae3d627d7698b283d8243aec063"
"cb2dbe89886241ffb007ff184d2a921c80eadedddcd26ba32d23c227bd2f9e71"
"ce63b345d4512be0d330ed741847a887fba53f4db005d3e0eb6c2b67dbb4d52d"
"847c9d97aea8c260ba4155b4470f6c9ef534c1f228b683c666b875f5346baf5e"
"0d6fc0ccbd2a910e17476c19ee38af462f96ec344e0fcf8756d02509c01d0b12"
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
	mv "${pkgdir}/opt/rocm-7.0.2" "${pkgdir}/opt/rocm"	

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
