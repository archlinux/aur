# Maintainer: Carson Rueter <roachh at proton mail dot com>
# Co-Maintainer: George Sofianos

# Release notes https://rocm.docs.amd.com/en/latest/about/release-notes.html
amdgpu_repo='https://repo.radeon.com/amdgpu/6.2.4/ubuntu'
rocm_repo='https://repo.radeon.com/rocm/apt/6.2.4'
opencl_lib='opt/rocm-6.2.4/opencl/lib'
rocm_lib='opt/rocm-6.2.4/lib'
hip_lib='opt/rocm-6.2.4/hip/lib/'
amdgpu="opt/amdgpu/lib/x86_64-linux-gnu"
amdgpu_pro="opt/amdgpu-pro/lib/x86_64-linux-gnu/"

pkgname=opencl-amd
pkgdesc="ROCm components repackaged from AMD's Ubuntu releases (ROCr runtime, ROCm runtime, HIP runtime) - This package is intended to work along with the free amdgpu stack."
pkgver=6.2.4
pkgrel=1
epoch=1
arch=('x86_64')
url='http://www.amd.com'
license=('custom:AMD')
makedepends=('wget')
depends=('libdrm' 'ocl-icd' 'gcc-libs' 'numactl')
provides=('opencl-driver' 'libdrm-amdgpu-amdgpu1' 'rocm-core' 'comgr' 'hip' 'hipcc' 'hip-dev' 'hip-doc' 'hip-samples' 'hsakmt-roct' 'hsakmt-roct-dev' 'hsa-rocr' 'hsa-rocr-dev' 'rocminfo' 'hip-runtime-amd' 'rocm-device-libs' 'rocm-language-runtime' 
	'rocm-hip-runtime' 'rocdecode' 'rocdecode-dev' 'rocm-ocl-icd' 'rocm-opencl-icd-loader' 'rocm-opencl' 'rocm-opencl-dev' 'rocm-opencl-runtime' 'rocm-clang-ocl' 'rocm-dbgapi' 'rocm-debug-agent' 'rocm-gdb' 'rocprofiler' 'rocprofiler-dev' 'rocprofiler-plugins'
	'rocprofiler-register' 'roctracer' 'roctracer-dev' 'hsa-amd-aqlprofile' 'openmp-extras-runtime' 'rocm-cmake' 'rocm-utils' 'rocm-smi-lib' 'amd-smi-lib')
conflicts=('rocm-opencl-runtime' 'libdrm-amdgpu-amdgpu1' 'rocm-core' 'comgr' 'hip' 'hipcc' 'hip-dev' 'hip-doc' 'hip-samples' 'hsakmt-roct' 'hsakmt-roct-dev' 'hsa-rocr' 'hsa-rocr-dev' 'rocminfo' 'hip-runtime-amd' 'rocm-device-libs' 'rocm-language-runtime' 
	'rocm-hip-runtime' 'rocdecode' 'rocdecode-dev' 'rocm-ocl-icd' 'rocm-opencl-icd-loader' 'rocm-opencl' 'rocm-opencl-dev' 'rocm-opencl-runtime' 'rocm-clang-ocl' 'rocm-dbgapi' 'rocm-debug-agent' 'rocm-gdb' 'rocprofiler' 'rocprofiler-dev' 'rocprofiler-plugins'
	'rocprofiler-register' 'roctracer' 'roctracer-dev' 'hsa-amd-aqlprofile' 'openmp-extras-runtime' 'rocm-cmake' 'rocm-utils' 'rocm-smi-lib' 'amd-smi-lib')
optdepends=('clinfo' 'opencl-amd-dev')

source=(
# LIBDRM
"https://repo.radeon.com/amdgpu/6.2.4/ubuntu/pool/main/libd/libdrm-amdgpu/libdrm-amdgpu-amdgpu1_2.4.120.60204-2070768.24.04_amd64.deb"
# ROCM
"https://repo.radeon.com/rocm/apt/6.2.4/pool/main/r/rocm-core/rocm-core_6.2.4.60204-139~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.4/pool/main/c/comgr/comgr_2.8.0.60204-139~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.4/pool/main/h/hipcc/hipcc_1.1.1.60204-139~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.4/pool/main/h/hip-dev/hip-dev_6.2.41134.60204-139~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.4/pool/main/h/hip-doc/hip-doc_6.2.41134.60204-139~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.4/pool/main/h/hip-samples/hip-samples_6.2.41134.60204-139~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.4/pool/main/h/hsakmt-roct-dev/hsakmt-roct-dev_20240607.5.7.60204-139~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.4/pool/main/h/hsa-rocr/hsa-rocr_1.14.0.60204-139~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.4/pool/main/h/hsa-rocr-dev/hsa-rocr-dev_1.14.0.60204-139~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.4/pool/main/r/rocminfo/rocminfo_1.0.0.60204-139~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.4/pool/main/h/hip-runtime-amd/hip-runtime-amd_6.2.41134.60204-139~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.4/pool/main/r/rocm-device-libs/rocm-device-libs_1.0.0.60204-139~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.4/pool/main/r/rocm-language-runtime/rocm-language-runtime_6.2.4.60204-139~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.4/pool/main/r/rocm-hip-runtime/rocm-hip-runtime_6.2.4.60204-139~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.4/pool/main/r/rocdecode/rocdecode_0.6.0.60204-139~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.4/pool/main/r/rocdecode-dev/rocdecode-dev_0.6.0.60204-139~24.04_amd64.deb"
#"https://repo.radeon.com/rocm/apt/6.2.4/pool/main/r/rocm-ocl-icd/rocm-ocl-icd_2.0.0.60204-139~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.4/pool/main/r/rocm-opencl-icd-loader/rocm-opencl-icd-loader_1.2.60204-139~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.4/pool/main/r/rocm-opencl/rocm-opencl_2.0.0.60204-139~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.4/pool/main/r/rocm-opencl-dev/rocm-opencl-dev_2.0.0.60204-139~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.4/pool/main/r/rocm-opencl-runtime/rocm-opencl-runtime_6.2.4.60204-139~24.04_amd64.deb"
# ROCM DEV
#"https://repo.radeon.com/rocm/apt/6.2.4/pool/main/r/rocm-clang-ocl/rocm-clang-ocl_0.5.0.60204-139~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.4/pool/main/o/openmp-extras-runtime/openmp-extras-runtime_18.62.0.60204-139~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.4/pool/main/r/rocm-smi-lib/rocm-smi-lib_7.3.0.60204-139~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.4/pool/main/a/amd-smi-lib/amd-smi-lib_24.6.3.60204-139~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.4/pool/main/r/rocm-cmake/rocm-cmake_0.13.0.60204-139~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.4/pool/main/r/rocm-dbgapi/rocm-dbgapi_0.76.0.60204-139~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.4/pool/main/r/rocm-debug-agent/rocm-debug-agent_2.0.3.60204-139~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.4/pool/main/r/rocm-gdb/rocm-gdb_14.2.60204-139~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.4/pool/main/r/rocm-utils/rocm-utils_6.2.4.60204-139~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.4/pool/main/r/rocprofiler/rocprofiler_2.0.60204.60204-139~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.4/pool/main/r/rocprofiler-dev/rocprofiler-dev_2.0.60204.60204-139~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.4/pool/main/r/rocprofiler-plugins/rocprofiler-plugins_2.0.60204.60204-139~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.4/pool/main/r/rocprofiler-register/rocprofiler-register_0.4.0.60204-139~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.4/pool/main/r/roctracer/roctracer_4.1.60204.60204-139~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.4/pool/main/r/roctracer-dev/roctracer-dev_4.1.60204.60204-139~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.4/pool/main/r/rocm-dev/rocm-dev_6.2.4.60204-139~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.4/pool/main/h/hsa-amd-aqlprofile/hsa-amd-aqlprofile_1.0.0.60204.60204-139~24.04_amd64.deb"
# Proprietary
"https://repo.radeon.com/amdgpu/5.7.1/ubuntu/pool/proprietary/o/opencl-legacy-amdgpu-pro/opencl-legacy-amdgpu-pro-icd_23.20-1664987.22.04_amd64.deb"
)

sha256sums=(
"ebe998cd3ac45024cc4cdaaeaf49da132662978c4f3dcd3353b43668eb281603"

"68805dbab3719821fc80ae37ae7a09cae16551703830a3ea23bd2107550a4e7c"
"7f012f4cdf7ec71817deaf8a598d4476748bdfd3cd1d92fd72fa39d3831b4352"
"993ef7f8c9241a66eb5bb2f2a8bf531c25bb25e948a346f15a213d55538256bc"
"f5c6a2ebbc7a8b04f810544b91ab4b8518c7570dd54253892921fec6fda76447"
"8ff69b9e825a4f9f61ca9db77e3c78e379a927259711421975352284ce19899d"
"99e937dd3edf0d49102efca1423d0e8506c7aaede8071fab8b497967c94273df"
"2f1db180b8cfc8f4fd8ad799195c590ec9e140cccf1d8665b46d143b70d8cc04"
"4af984c88656c2060bcd2aedda442cae5b139317e22ab64ad721f1b4dbe360b8"
"2f33e892a4a948f75a6d033252b3a39514fa2eb31de063e1022736b4ca966116"
"c1d116c0aec99d02ed1a3af82305835be31ebf4c36094e3899ecf99d22e4a528"
"e065c365e5890099609a9f552aff58ff101065b73b6d7350a86828ef73c9dbc2"
"ca536b58a3d0289ca6a1435355e8de907ae8a8fa10ebb0cb4361ed4ce8c73d80"
"941d5a7042eb49ef6b4ffd778b50011d12ba640abb2fbc5f043636da84dda627"
"695e996313c11bc481d737e5ba67ee307cf44b19db9c801d47c5df067391891f"
"3305178c039b6ca683ac4517a82d9cc5a9de090f00e8b270e1bb049b35125526"
"882b66cdadee846b83d456da3a63d0ef07358c5c809169d8c6005311eaf0d2f7"
"cee4162d9544cc5f002d90bfde6bc3b9bda89e2a7509485368e0092f07107a80"
"a4c23fcabcc20d3b6bc696b0be0575403218705e74fdfe7060d8120d5da83abd"
"c9ba79e78a0422484ff17926c6e017502f49d54825b21676e893d54c9a8c8125"
"251fb550b0122d5d0f5ece2cdbddd0b66b046f280435e783eec91357c7bef2c1"

#"c2716b32f35eb79d3d1f2d2ade4fcdefdef57437593c130f3e552532e041f077"
"dcdfe05b0a5f84e73f6ee898403f6a802eb3adac145bf01ac450a0aa0e898c22"
"4c7625ca7008952922b590471b9059524c12f80bbfdc49409a794c0543ba43ea"
"4cbd7b6d02b13b4af461fa664842ad3ed922de087f7ab209245993ab4746e5b7"
"1001c868c95dc79b31282e87e397cb6ae96590c8151e05539c138b19bec98644"
"6314f86ce6b3969c9f92ee516e9abb2e60013ee80138fd5f56858c95eb71430a"
"8db032647e7bd451cdb3769c101824d0d59af7f95835cd106e166bd2623285a6"
"8a503255058c017b44e240a97fcffb56457f9167e683b238135d9e3009a3914c"
"4a4eb7051c228d230b2b47b3946c87e3afdf0cba1ded14dbd54de8eea54236e3"
"3017a060736e9347c9bf5a2663f9e15c5eb757ebd0b3b137c8282d59f7495ee0"
"4e0c8d5bf7d91e795d971f68e8b60fbaede296bc20ecaa7b8344609aa0f4974f"
"dd1e3c48d36030b10853bd70441277b008b5727567aab5c4c83de479143b4318"
"eaadc40399d49afa407b5c694c3e68ef9decbeecbd4fbcf536a681f8ea02b996"
"44e694365a0583baa92f373c3f2e61709e61ecd54b0a45ea22590edafcd3999e"
"05f8128a56ca4b285aee1900e89529f0955bd5bd43a46c8c5ecffad2d8e4066e"
"857fc854e0fd89199656342af38c70a8b6c0f48411e376b6b7b117ad9fee0619"
"226c821aa69a45c747fb9689502de0f549bdb2e88e0837ceeca7c8f76214a50f"
# Proprietary
"194bf41a21b40f8305f532818a5d2491dca0f6f0750b3d2b538c54f57dbb2dfd"
)

#Extract .xz files
exz() {
	#echo $1
	ar x $1 data.tar.xz
	tar xJf data.tar.xz
	rm data.tar.xz
}
#Extract .gz files
egz() {
	#echo $1
	ar x $1 data.tar.gz
	tar xfx data.tar.gz
	rm data.tar.gz
}

package() {
	egz "${srcdir}/rocm-core_6.2.4.60204-139~24.04_amd64.deb"
	egz "${srcdir}/comgr_2.8.0.60204-139~24.04_amd64.deb"
	egz "${srcdir}/hipcc_1.1.1.60204-139~24.04_amd64.deb"
	egz "${srcdir}/hip-dev_6.2.41134.60204-139~24.04_amd64.deb"
	egz "${srcdir}/hip-doc_6.2.41134.60204-139~24.04_amd64.deb"
	egz "${srcdir}/hip-samples_6.2.41134.60204-139~24.04_amd64.deb"
	egz "${srcdir}/hsakmt-roct-dev_20240607.5.7.60204-139~24.04_amd64.deb"
	egz "${srcdir}/hsa-rocr_1.14.0.60204-139~24.04_amd64.deb"
	egz "${srcdir}/hsa-rocr-dev_1.14.0.60204-139~24.04_amd64.deb"
	egz "${srcdir}/rocminfo_1.0.0.60204-139~24.04_amd64.deb"
	egz "${srcdir}/hip-runtime-amd_6.2.41134.60204-139~24.04_amd64.deb"
	egz "${srcdir}/rocm-device-libs_1.0.0.60204-139~24.04_amd64.deb"
	egz "${srcdir}/rocm-language-runtime_6.2.4.60204-139~24.04_amd64.deb"
	egz "${srcdir}/rocm-hip-runtime_6.2.4.60204-139~24.04_amd64.deb"
	egz "${srcdir}/rocdecode_0.6.0.60204-139~24.04_amd64.deb"
	egz "${srcdir}/rocdecode-dev_0.6.0.60204-139~24.04_amd64.deb"
	#egz "${srcdir}/rocm-ocl-icd_2.0.0.60204-139~24.04_amd64.deb"
	egz "${srcdir}/rocm-opencl-icd-loader_1.2.60204-139~24.04_amd64.deb"
	egz "${srcdir}/rocm-opencl_2.0.0.60204-139~24.04_amd64.deb"
	egz "${srcdir}/rocm-opencl-dev_2.0.0.60204-139~24.04_amd64.deb"
	egz "${srcdir}/rocm-opencl-runtime_6.2.4.60204-139~24.04_amd64.deb"
	#exz "${srcdir}/rocm-clang-ocl_0.5.0.60204-139~24.04_amd64.deb"
	egz "${srcdir}/rocm-smi-lib_7.3.0.60204-139~24.04_amd64.deb"
	egz "${srcdir}/amd-smi-lib_24.6.3.60204-139~24.04_amd64.deb"
	exz "${srcdir}/rocm-cmake_0.13.0.60204-139~24.04_amd64.deb"
	egz "${srcdir}/rocm-dbgapi_0.76.0.60204-139~24.04_amd64.deb"
	egz "${srcdir}/rocm-debug-agent_2.0.3.60204-139~24.04_amd64.deb"
	egz "${srcdir}/rocm-utils_6.2.4.60204-139~24.04_amd64.deb"
	egz "${srcdir}/rocprofiler_2.0.60204.60204-139~24.04_amd64.deb"
	egz "${srcdir}/rocprofiler-dev_2.0.60204.60204-139~24.04_amd64.deb"
	egz "${srcdir}/rocprofiler-plugins_2.0.60204.60204-139~24.04_amd64.deb"
	egz "${srcdir}/rocprofiler-register_0.4.0.60204-139~24.04_amd64.deb"
	egz "${srcdir}/roctracer_4.1.60204.60204-139~24.04_amd64.deb"
	egz "${srcdir}/roctracer-dev_4.1.60204.60204-139~24.04_amd64.deb"
	egz "${srcdir}/rocm-dev_6.2.4.60204-139~24.04_amd64.deb"
	egz "${srcdir}/hsa-amd-aqlprofile_1.0.0.60204.60204-139~24.04_amd64.deb"
	exz "${srcdir}/libdrm-amdgpu-amdgpu1_2.4.120.60204-2070768.24.04_amd64.deb"
	egz "${srcdir}/openmp-extras-runtime_18.62.0.60204-139~24.04_amd64.deb"
	egz "${srcdir}/rocm-gdb_14.2.60204-139~24.04_amd64.deb"
	exz "${srcdir}/opencl-legacy-amdgpu-pro-icd_23.20-1664987.22.04_amd64.deb"	

	cd ${srcdir}/${amdgpu_pro}
	sed -i "s|libdrm_amdgpu|libdrm_amdgpo|g" libamdocl-orca64.so

	cd ${srcdir}/${amdgpu}
	rm "libdrm_amdgpu.so.1"
	mv "libdrm_amdgpu.so.1.0.0" "libdrm_amdgpo.so.1.0.0"
	ln -s "libdrm_amdgpo.so.1.0.0" "libdrm_amdgpo.so.1"	

	# legacy
	mkdir -p ${pkgdir}/usr/lib
	mv "${srcdir}/${amdgpu_pro}/libamdocl-orca64.so" "${pkgdir}/usr/lib/"
	mv "${srcdir}/${amdgpu}/libdrm_amdgpo.so.1.0.0" "${pkgdir}/usr/lib/"
	mv "${srcdir}/${amdgpu}/libdrm_amdgpo.so.1" "${pkgdir}/usr/lib/"

	mv "${srcdir}/opt/" "${pkgdir}/"
	ln -s "/opt/rocm-6.2.4" "$pkgdir/opt/rocm"
	#ln -s "/opt/rocm-6.2.4/hip/bin/.hipVersion" "$pkgdir/opt/rocm-6.2.4/bin/.hipVersion"

	mkdir -p "${pkgdir}/opt/amdgpu/share/libdrm"
	cd "${pkgdir}/opt/amdgpu/share/libdrm"
	ln -s /usr/share/libdrm/amdgpu.ids amdgpu.ids		

	mkdir -p ${pkgdir}/etc/OpenCL/vendors	
	echo libamdocl64.so > "${pkgdir}/etc/OpenCL/vendors/amdocl64.icd"
	echo libamdocl-orca64.so > "${pkgdir}/etc/OpenCL/vendors/amdocl-orca64.icd"

	mkdir -p ${pkgdir}/etc/ld.so.conf.d
	echo /opt/rocm-6.2.4/opencl/lib > "$pkgdir/etc/ld.so.conf.d/opencl-amd.conf"
	echo /opt/rocm-6.2.4/lib >> "$pkgdir/etc/ld.so.conf.d/opencl-amd.conf"
	echo /opt/rocm-6.2.4/hip/lib >> "$pkgdir/etc/ld.so.conf.d/opencl-amd.conf"

	mkdir -p ${pkgdir}/etc/profile.d
	echo export PATH="\${PATH}:/opt/rocm-6.2.4/bin:/opt/rocm-6.2.4/hip/bin" > "$pkgdir/etc/profile.d/opencl-amd.sh"
}
