# Maintainer: Carson Rueter <roachh at proton mail dot com>
# Co-Maintainer: George Sofianos

# Release notes https://rocm.docs.amd.com/en/latest/about/release-notes.html
_amdgpu_repo='https://repo.radeon.com/amdgpu/6.4.1/ubuntu'
_rocm_repo='https://repo.radeon.com/rocm/apt/6.4.1'
_opencl_lib='opt/rocm-6.4.1/opencl/lib'
_rocm_lib='opt/rocm-6.4.1/lib'
_hip_lib='opt/rocm-6.4.1/hip/lib/'
_amdgpu="opt/amdgpu/lib/x86_64-linux-gnu"
_amdgpu_pro="opt/amdgpu-pro/lib/x86_64-linux-gnu/"

pkgname=opencl-amd
pkgdesc="ROCm components repackaged from AMD's Ubuntu releases (ROCr runtime, ROCm runtime, HIP runtime) - This package is intended to work along with the free amdgpu stack."
pkgver=6.4.1
pkgrel=1
epoch=1
arch=('x86_64')
url='http://www.amd.com'
license=('custom:AMD')
makedepends=('wget')
depends=('libdrm' 'ocl-icd' 'gcc-libs' 'numactl')
provides=('opencl-driver' 'libdrm-amdgpu-amdgpu1' 'rocm-core' 'comgr' 'hip' 'hipcc' 'hip-dev' 'hip-doc' 'hip-samples' 'hsa-rocr' 'hsa-rocr-dev' 'rocminfo' 'hip-runtime-amd' 'rocm-device-libs' 'rocm-language-runtime' 
	'rocm-hip-runtime' 'rocdecode' 'rocdecode-dev' 'rocjpeg' 'rocjpeg-dev' 'rocm-ocl-icd' 'rocm-opencl-icd-loader' 'rocm-opencl' 'rocm-opencl-dev' 'rocm-opencl-runtime' 'rocm-dbgapi' 'rocm-debug-agent' 'rocm-gdb' 'rocprofiler' 'rocprofiler-dev' 'rocprofiler-plugins'
	'rocprofiler-register' 'roctracer' 'roctracer-dev' 'hsa-amd-aqlprofile' 'openmp-extras-runtime' 'rocm-cmake' 'rocm-utils' 'rocm-smi-lib' 'amd-smi-lib')
conflicts=('rocm-opencl-runtime' 'libdrm-amdgpu-amdgpu1' 'rocm-core' 'comgr' 'hip' 'hipcc' 'hip-dev' 'hip-doc' 'hip-samples' 'hsa-rocr' 'hsa-rocr-dev' 'rocminfo' 'hip-runtime-amd' 'rocm-device-libs' 'rocm-language-runtime' 
	'rocm-hip-runtime' 'rocdecode' 'rocdecode-dev' 'rocjpeg' 'rocjpeg-dev' 'rocm-ocl-icd' 'rocm-opencl-icd-loader' 'rocm-opencl' 'rocm-opencl-dev' 'rocm-opencl-runtime' 'rocm-dbgapi' 'rocm-debug-agent' 'rocm-gdb' 'rocprofiler' 'rocprofiler-dev' 'rocprofiler-plugins'
	'rocprofiler-register' 'roctracer' 'roctracer-dev' 'hsa-amd-aqlprofile' 'openmp-extras-runtime' 'rocm-cmake' 'rocm-utils' 'rocm-smi-lib' 'amd-smi-lib')
optdepends=('clinfo' 'opencl-amd-dev')

source=(
# LIBDRM
"https://repo.radeon.com/amdgpu/6.4.1/ubuntu/pool/main/libd/libdrm-amdgpu/libdrm-amdgpu-amdgpu1_2.4.124.60401-2164967.24.04_amd64.deb"
# ROCM
"https://repo.radeon.com/rocm/apt/6.4.1/pool/main/r/rocm-core/rocm-core_6.4.1.60401-83~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4.1/pool/main/c/comgr/comgr_3.0.0.60401-83~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4.1/pool/main/h/hipcc/hipcc_1.1.1.60401-83~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4.1/pool/main/h/hip-dev/hip-dev_6.4.43483.60401-83~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4.1/pool/main/h/hip-doc/hip-doc_6.4.43483.60401-83~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4.1/pool/main/h/hip-samples/hip-samples_6.4.43483.60401-83~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4.1/pool/main/h/hsa-rocr/hsa-rocr_1.15.0.60401-83~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4.1/pool/main/h/hsa-rocr-dev/hsa-rocr-dev_1.15.0.60401-83~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4.1/pool/main/r/rocminfo/rocminfo_1.0.0.60401-83~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4.1/pool/main/h/hip-runtime-amd/hip-runtime-amd_6.4.43483.60401-83~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4.1/pool/main/r/rocm-device-libs/rocm-device-libs_1.0.0.60401-83~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4.1/pool/main/r/rocm-language-runtime/rocm-language-runtime_6.4.1.60401-83~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4.1/pool/main/r/rocm-hip-runtime/rocm-hip-runtime_6.4.1.60401-83~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4.1/pool/main/r/rocdecode/rocdecode_0.10.0.60401-83~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4.1/pool/main/r/rocdecode-dev/rocdecode-dev_0.10.0.60401-83~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4.1/pool/main/r/rocjpeg/rocjpeg_0.8.0.60401-83~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4.1/pool/main/r/rocjpeg-dev/rocjpeg-dev_0.8.0.60401-83~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4.1/pool/main/r/rocm-opencl/rocm-opencl_2.0.0.60401-83~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4.1/pool/main/r/rocm-opencl-dev/rocm-opencl-dev_2.0.0.60401-83~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4.1/pool/main/r/rocm-opencl-runtime/rocm-opencl-runtime_6.4.1.60401-83~24.04_amd64.deb"
# ROCM DEV
"https://repo.radeon.com/rocm/apt/6.4.1/pool/main/o/openmp-extras-runtime/openmp-extras-runtime_18.63.0.60401-83~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4.1/pool/main/r/rocm-smi-lib/rocm-smi-lib_7.5.0.60401-83~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4.1/pool/main/a/amd-smi-lib/amd-smi-lib_25.4.2.60401-83~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4.1/pool/main/r/rocm-cmake/rocm-cmake_0.14.0.60401-83~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4.1/pool/main/r/rocm-dbgapi/rocm-dbgapi_0.77.2.60401-83~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4.1/pool/main/r/rocm-debug-agent/rocm-debug-agent_2.0.4.60401-83~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4.1/pool/main/r/rocm-gdb/rocm-gdb_15.2.60401-83~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4.1/pool/main/r/rocm-utils/rocm-utils_6.4.1.60401-83~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4.1/pool/main/r/rocprofiler/rocprofiler_2.0.60401.60401-83~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4.1/pool/main/r/rocprofiler-dev/rocprofiler-dev_2.0.60401.60401-83~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4.1/pool/main/r/rocprofiler-plugins/rocprofiler-plugins_2.0.60401.60401-83~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4.1/pool/main/r/rocprofiler-register/rocprofiler-register_0.4.0.60401-83~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4.1/pool/main/r/roctracer/roctracer_4.1.60401.60401-83~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4.1/pool/main/r/roctracer-dev/roctracer-dev_4.1.60401.60401-83~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4.1/pool/main/r/rocm-dev/rocm-dev_6.4.1.60401-83~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4.1/pool/main/h/hsa-amd-aqlprofile/hsa-amd-aqlprofile_1.0.0.60401-83~24.04_amd64.deb"
# Proprietary
"https://repo.radeon.com/amdgpu/5.7.1/ubuntu/pool/proprietary/o/opencl-legacy-amdgpu-pro/opencl-legacy-amdgpu-pro-icd_23.20-1664987.22.04_amd64.deb"
)

sha256sums=(
"84353123370372934be3e3a51d19e2af98080af2a44c7efadb3a65d377dbc895"

"79a0c87d5f52648f60e3808da6fd3f4ebcdf8f1fa24355f2ae1975052872afaf"
"667163f00488475b2a902b6fed1d05c9c9202b361693b2d97cdb97e7d9e997ba"
"89be3390bf03998154dc03dab4a47e6584491b3ebb15d4d26932f1a4136d10a7"
"d9a60e541ff6862c684f7a7c6f4b9a37f44afda06bc4d972f64c32d8d838d9e6"
"7cc2703a9f30030a587d77c024a02827af1c35b2282d9db0746828c63ef2e371"
"925648c3799ae5935973883c2dfd98c5215423c5b036ab680e038241340036a9"
"3e49792082f32e7d9fd808461fcc2df04b12910824caac29097dea550df48824"
"eb63dfa66564fc3d2ff73aaa763c4f7a61c0308187f62a1ac246bb739a31333e"
"793327ecf73b398509cbe13e653ba2691c3a27a24cf434bc64d889ccbfad8fe7"
"848a2b5533bc3715c2f2944b97ff1ea300d54490352f8820574a4baa6772258e"
"4e9478f6d2ed407fa64ff285a8fba4326e2cee1518aa59919e4e275841a86fd0"
"9e6d4417a6105ef38fe3365f89ae8e9cafa29c398eaa3ce11fbaf30455895a43"
"aaa92c7b8c17df8f03a45cf6b7f3d49bc2786f44b02ef0f7a854c40d2b210e9d"
"13b3d6da92e1f86edbeb60d1b6d1f10a1fa2a87eae52b27da0eeaf6d1806169b"
"4f77e53679866823cadee4823866fb45b926c52e184dbfed93c80861309f69fd"
"6cf9b58698eda51e522fc90342a482e1274a935f12b2ef04404bbf939cb8b604"
"beb62b287c9eb9b22b79f20bc32a40af097682f391dca7b8c60847ec97af3e8b"
"6f93291d673f722af73a4d350efcb632d6e86e7d93f58aae8caffe9493e65dd3"
"495e7fc2c9d1f22586c5578d49975a193dab5ee3230e4e02cea79243f654ff78"
"a3b9e9de9ba41cc84058a52ffa5862cd60e0b9338f5bf0ebaae5fb9c2b564144"
# ROCM DEV
"ab01cc7aee0b1d585acfe4ee5b129f9fe607c0b832b55ca780a762e775744343"
"c4cc156891dd15a2f9bc7a2c7094d0802ff570f421dc7e4b76bd974a2902cb0d"
"a5c3aa1dcbda9b0f487f15830164c52bcdc89792ac0c604360346976077d38ac"
"704eb56130ccb9ce017efc3bc5f83b84bd130f18ec921a334fd89f4bfcb6b916"
"6f88ff0637126fcae8f9d8a36c9f6c761c6d84cf74ead5240d03f9a1b6b3c2a3"
"6cf3810c5187f0de078bf52e51d764a95fbe16bdd3c6f679711b397932e3388d"
"5a2918f3ff1379a00c0fc6718378d310db3bc174b1cafeb8aa0f881a1c1b0106"
"d6f561bcf4e8042c557ad03c1038170715e66db4485e2912b25db9f69c619a13"
"1b524c9a50c7b0193dfb9050afca38018ff2e37eaea3b36d7e51f1af937a6b8f"
"d6882eb395b00b0e8a255a9af3d1372c0c3d870c75b2636b0a9d7f21ceaffa0e"
"ff8f71b4b87289f53de9d47a1d77e5b45e488552c2b500e4b5c4ffa2953d87eb"
"b0d459cf9deaab61c199c629c9298d50a7f50f538c6f08fc9a99c420290c6e04"
"79089e3b27240c848c540756ece1aea9efd968625790d5e46f48858b29a7cd69"
"dbf8faa8afa56ce3459dd1f9b5b5551b4e2d118c17a31527bccf8ce501b63a43"
"f32005405d1c8b0458dfbf9bd073e424f8940008a24113a133b91ed167dd1458"
"a5727a2ca2c22f8f028a8cd764cb0bead7324c1de2e44e21ec9cd12be669bece"
# Proprietary
"194bf41a21b40f8305f532818a5d2491dca0f6f0750b3d2b538c54f57dbb2dfd"
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

	cd "${srcdir}/${_amdgpu_pro}"
	sed -i "s|libdrm_amdgpu|libdrm_amdgpo|g" libamdocl-orca64.so

	cd "${srcdir}/${_amdgpu}"
	rm "libdrm_amdgpu.so.1"
	mv "libdrm_amdgpu.so.1.124.0" "libdrm_amdgpo.so.1.0.0"
	ln -s "libdrm_amdgpo.so.1.0.0" "libdrm_amdgpo.so.1"	

	# legacy
	mkdir -p "${pkgdir}/usr/lib"
	mv "${srcdir}/${_amdgpu_pro}/libamdocl-orca64.so" "${pkgdir}/usr/lib/"
	mv "${srcdir}/${_amdgpu}/libdrm_amdgpo.so.1.0.0" "${pkgdir}/usr/lib/"
	mv "${srcdir}/${_amdgpu}/libdrm_amdgpo.so.1" "${pkgdir}/usr/lib/"

	mv "${srcdir}/opt/" "${pkgdir}/"
	mv "${pkgdir}/opt/rocm-6.4.1" "${pkgdir}/opt/rocm"	

	mkdir -p "${pkgdir}/opt/amdgpu/share/libdrm"
	cd "${pkgdir}/opt/amdgpu/share/libdrm"
	ln -s /usr/share/libdrm/amdgpu.ids amdgpu.ids		

	mkdir -p "${pkgdir}/etc/OpenCL/vendors"
	echo libamdocl64.so > "${pkgdir}/etc/OpenCL/vendors/amdocl64.icd"
	echo libamdocl-orca64.so > "${pkgdir}/etc/OpenCL/vendors/amdocl-orca64.icd"

	mkdir -p "${pkgdir}/etc/ld.so.conf.d"
	# echo /opt/rocm/opencl/lib > "$pkgdir/etc/ld.so.conf.d/opencl-amd.conf"
	echo /opt/rocm/lib >> "$pkgdir/etc/ld.so.conf.d/opencl-amd.conf"
	echo /opt/rocm/hip/lib >> "$pkgdir/etc/ld.so.conf.d/opencl-amd.conf"

	mkdir -p "${pkgdir}/etc/profile.d"
	echo export PATH="\${PATH}:/opt/rocm/bin:/opt/rocm/hip/bin" > "$pkgdir/etc/profile.d/opencl-amd.sh"
}
