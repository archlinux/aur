# Maintainer: Carson Rueter <roachh at proton mail dot com>
# Co-Maintainer: George Sofianos

# Release notes https://rocm.docs.amd.com/en/latest/about/release-notes.html
_amdgpu_repo='https://repo.radeon.com/amdgpu/6.4.2/ubuntu'
_rocm_repo='https://repo.radeon.com/rocm/apt/6.4.2'
_opencl_lib='opt/rocm-6.4.2/opencl/lib'
_rocm_lib='opt/rocm-6.4.2/lib'
_hip_lib='opt/rocm-6.4.2/hip/lib/'
_amdgpu="opt/amdgpu/lib/x86_64-linux-gnu"
_amdgpu_pro="opt/amdgpu-pro/lib/x86_64-linux-gnu/"

pkgname=opencl-amd
pkgdesc="ROCm components repackaged from AMD's Ubuntu releases (ROCr runtime, ROCm runtime, HIP runtime) - This package is intended to work along with the free amdgpu stack."
pkgver=6.4.2
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
"https://repo.radeon.com/amdgpu/6.4.2/ubuntu/pool/main/libd/libdrm-amdgpu/libdrm-amdgpu-amdgpu1_2.4.124.60402-2187269.24.04_amd64.deb"
# ROCM
"https://repo.radeon.com/rocm/apt/6.4.2/pool/main/r/rocm-core/rocm-core_6.4.2.60402-120~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4.2/pool/main/c/comgr/comgr_3.0.0.60402-120~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4.2/pool/main/h/hipcc/hipcc_1.1.1.60402-120~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4.2/pool/main/h/hip-dev/hip-dev_6.4.43484.60402-120~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4.2/pool/main/h/hip-doc/hip-doc_6.4.43484.60402-120~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4.2/pool/main/h/hip-samples/hip-samples_6.4.43484.60402-120~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4.2/pool/main/h/hsa-rocr/hsa-rocr_1.15.0.60402-120~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4.2/pool/main/h/hsa-rocr-dev/hsa-rocr-dev_1.15.0.60402-120~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4.2/pool/main/r/rocminfo/rocminfo_1.0.0.60402-120~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4.2/pool/main/h/hip-runtime-amd/hip-runtime-amd_6.4.43484.60402-120~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4.2/pool/main/r/rocm-device-libs/rocm-device-libs_1.0.0.60402-120~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4.2/pool/main/r/rocm-language-runtime/rocm-language-runtime_6.4.2.60402-120~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4.2/pool/main/r/rocm-hip-runtime/rocm-hip-runtime_6.4.2.60402-120~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4.2/pool/main/r/rocdecode/rocdecode_0.10.0.60402-120~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4.2/pool/main/r/rocdecode-dev/rocdecode-dev_0.10.0.60402-120~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4.2/pool/main/r/rocjpeg/rocjpeg_0.8.0.60402-120~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4.2/pool/main/r/rocjpeg-dev/rocjpeg-dev_0.8.0.60402-120~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4.2/pool/main/r/rocm-opencl/rocm-opencl_2.0.0.60402-120~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4.2/pool/main/r/rocm-opencl-dev/rocm-opencl-dev_2.0.0.60402-120~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4.2/pool/main/r/rocm-opencl-runtime/rocm-opencl-runtime_6.4.2.60402-120~24.04_amd64.deb"
# ROCM DEV
"https://repo.radeon.com/rocm/apt/6.4.2/pool/main/o/openmp-extras-runtime/openmp-extras-runtime_18.63.0.60402-120~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4.2/pool/main/r/rocm-smi-lib/rocm-smi-lib_7.5.0.60402-120~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4.2/pool/main/a/amd-smi-lib/amd-smi-lib_25.5.1.60402-120~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4.2/pool/main/r/rocm-cmake/rocm-cmake_0.14.0.60402-120~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4.2/pool/main/r/rocm-dbgapi/rocm-dbgapi_0.77.2.60402-120~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4.2/pool/main/r/rocm-debug-agent/rocm-debug-agent_2.0.4.60402-120~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4.2/pool/main/r/rocm-gdb/rocm-gdb_15.2.60402-120~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4.2/pool/main/r/rocm-utils/rocm-utils_6.4.2.60402-120~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4.2/pool/main/r/rocprofiler/rocprofiler_2.0.60402.60402-120~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4.2/pool/main/r/rocprofiler-dev/rocprofiler-dev_2.0.60402.60402-120~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4.2/pool/main/r/rocprofiler-plugins/rocprofiler-plugins_2.0.60402.60402-120~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4.2/pool/main/r/rocprofiler-register/rocprofiler-register_0.4.0.60402-120~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4.2/pool/main/r/roctracer/roctracer_4.1.60402.60402-120~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4.2/pool/main/r/roctracer-dev/roctracer-dev_4.1.60402.60402-120~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4.2/pool/main/r/rocm-dev/rocm-dev_6.4.2.60402-120~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4.2/pool/main/h/hsa-amd-aqlprofile/hsa-amd-aqlprofile_1.0.0.60402-120~24.04_amd64.deb"
# Proprietary
#"https://repo.radeon.com/amdgpu/5.7.1/ubuntu/pool/proprietary/o/opencl-legacy-amdgpu-pro/opencl-legacy-amdgpu-pro-icd_23.20-1664987.22.04_amd64.deb"
)

sha256sums=(
"2397386a81212c3465aac6b96110ed9634d98d2eb124b1cfa5dbfc1942221a5b"

"5cb6ecf4d7c85f3fb2875a3bf83a0631b49871b285bb9af1ba553e5e5efdc75f"
"3465a9e01df07a1beafca8683d9e6bbcd475b25c27f8df3d8eb87bad608a2aba"
"ee3bf45c44baa94f0097adc149c096074d58438a1c13287b40813055f61792fe"
"75a4956bf3cdb558b690a31d618c3bedc710b182de4a4b4f997e5723753e095a"
"1cd16a57b7938c641e073d0591850334109666c24d239224e91b66bdb5c4c12e"
"bf5a9c3d9d379921802935b3b363d24869e13319ff7d4ebc97ed6dd522a18a26"
"044555e1aa8fef90436ee316a7da295befbaa9e70e888c4deed24b4a7014071e"
"8d324b0e29643499802183e22be1037c3ca5cdd3465bcd6f97499659575f7b5c"
"c0a42ebe478d9f0b245c6c0f2fc4422bbc79a941a0f252c775762a5b803d04e0"
"e6ee5e6a61801afa8f88f50118361e75dabcf91952a13e300660ef318f2be382"
"efe067ec7e6d3d6e836210eca2d580dfc19a2a5a608f5268273b633aeb5e7ce1"
"def06511df5935f374ceb91e38049c942aebdcb44d55c8fa34218b10b788ba87"
"54e8391ff9662855845d77c74ba9612fe260c959d2c7a0a535ee73659c564988"
"ab49ede35d8e06c5c641e6ee08a54e16e7bd6e8cc3cdfa0be4ae5b79fce3af4b"
"a19c4ea0137f49c205538c120f7a29174db8f01ea15acaf6c3d4fb6e7996aa22"
"7606d8e3d1ca157773abe0fe444ba773adf67590c274e3cb872034fafc1be003"
"9448e38c65757ded65824d6e3a592894ebf1ae6472c17e7e6fe2141f93b78c5d"
"be45bb6108b1a24d7721a60fd426c4f888d86475e00c1eda175e113c9d2a894b"
"f65cb9a4298d2a5e3819218020df0b1fbcb0a71e6e8869032842068138515f6b"
"43c3063843a7a7633d195475ffaf21eb7cb05634b7e43942d1ffdf0f71d5e7b3"
# ROCM DEV
"f41c4d1eaaead80bdd79dfb5c1a051f2591a7dea2e05b49166f005db488aa266"
"6457c87cc992a85580f874cd9b7fe169b44b31a628c278d4da7c71ea0cabccbc"
"e3a8f3100302017a3febd0008d5717159d62cf2ed19c2f6b3d9b85bceaae7df6"
"673332216a12c1c85c7f40d451bf8a23bde7767fc18a3569c3b5f0cd203fc676"
"37e5817aae59ac384e0ac7202854bc408c95928af3dae54111a4e91dc938ef76"
"4fa7f8b237b792aa0940b89feecb60a623f8f0070d604e27e185a3d2b65036e4"
"801fe8334a90cb4a589684372fa2b0125d51eb5a275b84be0a5afdef966e90b9"
"bb62fa4ab14261c0010dea30eedd84e8dc49021a805a44853c85e7d2413b2444"
"c09b514c6352fba2579d91ade278cec41912f7e18913019a1b9f466f1681fbf1"
"3103e32457a3031f43e5df171b6d26fc418f525b498c9a04c4a772a563e826f1"
"63bd13066677c38aa0618179b5c24d3ff01266b3e853ce4d2ff661f881183744"
"30249a0a1f3384a1034122df8e1994a6780a1ac64c15145961a77a38ee1137db"
"dd23c587b181da8bcde394a86e9b04cd02cde0cf77affd4606ffccc20de36b1a"
"eef5f7e1b1c52ad625334f5befa4e84b4df90033d71f0399683ab7c41a40a868"
"06215bc429b257e5483ada81586acaf5c824e57833a8b6ad9c1deed90f55660e"
"56546da7653ce17429b41a2e53a33d6c47428d7da621ec74e2a3eb1f49c95192"
# Proprietary
#"194bf41a21b40f8305f532818a5d2491dca0f6f0750b3d2b538c54f57dbb2dfd"
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

	#cd "${srcdir}/${_amdgpu_pro}"
	#sed -i "s|libdrm_amdgpu|libdrm_amdgpo|g" libamdocl-orca64.so

	cd "${srcdir}/${_amdgpu}"
	rm "libdrm_amdgpu.so.1"
	mv "libdrm_amdgpu.so.1.124.0" "libdrm_amdgpo.so.1.0.0"
	ln -s "libdrm_amdgpo.so.1.0.0" "libdrm_amdgpo.so.1"	

	# legacy
	mkdir -p "${pkgdir}/usr/lib"
	#mv "${srcdir}/${_amdgpu_pro}/libamdocl-orca64.so" "${pkgdir}/usr/lib/"
	mv "${srcdir}/${_amdgpu}/libdrm_amdgpo.so.1.0.0" "${pkgdir}/usr/lib/"
	mv "${srcdir}/${_amdgpu}/libdrm_amdgpo.so.1" "${pkgdir}/usr/lib/"

	mv "${srcdir}/opt/" "${pkgdir}/"
	mv "${pkgdir}/opt/rocm-6.4.2" "${pkgdir}/opt/rocm"	

	mkdir -p "${pkgdir}/opt/amdgpu/share/libdrm"
	cd "${pkgdir}/opt/amdgpu/share/libdrm"
	ln -s /usr/share/libdrm/amdgpu.ids amdgpu.ids		

	mkdir -p "${pkgdir}/etc/OpenCL/vendors"
	echo libamdocl64.so > "${pkgdir}/etc/OpenCL/vendors/amdocl64.icd"
	#echo libamdocl-orca64.so > "${pkgdir}/etc/OpenCL/vendors/amdocl-orca64.icd"

	mkdir -p "${pkgdir}/etc/ld.so.conf.d"
	# echo /opt/rocm/opencl/lib > "$pkgdir/etc/ld.so.conf.d/opencl-amd.conf"
	echo /opt/rocm/lib >> "$pkgdir/etc/ld.so.conf.d/opencl-amd.conf"
	echo /opt/rocm/hip/lib >> "$pkgdir/etc/ld.so.conf.d/opencl-amd.conf"

	mkdir -p "${pkgdir}/etc/profile.d"
	echo export PATH="\${PATH}:/opt/rocm/bin:/opt/rocm/hip/bin" > "$pkgdir/etc/profile.d/opencl-amd.sh"
}
