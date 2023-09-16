# Maintainer: Carson Rueter <roachh at proton mail dot com>
# Co-Maintainer: George Sofianos

# Release notes https://rocm.docs.amd.com/en/latest/CHANGELOG.html#rocm-5-7-0
amdgpu_repo='https://repo.radeon.com/amdgpu/5.7/ubuntu'
rocm_repo='https://repo.radeon.com/rocm/apt/5.7'
opencl_lib='opt/rocm-5.7.0/opencl/lib'
rocm_lib='opt/rocm-5.7.0/lib'
hip_lib='opt/rocm-5.7.0/hip/lib/'
amdgpu="opt/amdgpu/lib/x86_64-linux-gnu"
amdgpu_pro="opt/amdgpu-pro/lib/x86_64-linux-gnu/"

pkgname=opencl-amd
pkgdesc="ROCr OpenCL stack, supports Vega 10 and later products - Legacy OpenCL stack (Proprietary), supports legacy products older than Vega 10 - This package is intended to work along with the free amdgpu stack."            
pkgver=5.7.0
pkgrel=1
epoch=1
arch=('x86_64')
url='http://www.amd.com'
license=('custom:AMD')
makedepends=('wget')
depends=('libdrm' 'ocl-icd' 'gcc-libs' 'numactl')
provides=('opencl-driver' 'libdrm-amdgpu-amdgpu1' 'rocm-core' 'comgr' 'hip' 'hipcc' 'hip-dev' 'hip-doc' 'hip-samples' 'hsakmt-roct' 'hsakmt-roct-dev' 'hsa-rocr' 'hsa-rocr-dev' 'rocminfo' 'hip-runtime-amd' 'rocm-device-libs' 'rocm-language-runtime' 
	'rocm-hip-runtime' 'rocm-ocl-icd' 'rocm-opencl' 'rocm-opencl-dev' 'rocm-opencl-runtime' 'rocm-clang-ocl' 'rocm-dbgapi' 'rocm-debug-agent' 'rocm-gdb' 'rocprofiler' 'rocprofiler-dev' 'rocprofiler-plugins' 'roctracer' 'roctracer-dev' 'hsa-amd-aqlprofile' 'openmp-extras-runtime' 'rocm-cmake' 'rocm-utils' 'rocm-smi-lib')
conflicts=('rocm-opencl-runtime' 'libdrm-amdgpu-amdgpu1' 'rocm-core' 'comgr' 'hip' 'hipcc' 'hip-dev' 'hip-doc' 'hip-samples' 'hsakmt-roct' 'hsakmt-roct-dev' 'hsa-rocr' 'hsa-rocr-dev' 'rocminfo' 'hip-runtime-amd' 'rocm-device-libs' 'rocm-language-runtime' 
	'rocm-hip-runtime' 'rocm-ocl-icd' 'rocm-opencl' 'rocm-opencl-dev' 'rocm-opencl-runtime' 'rocm-clang-ocl' 'rocm-dbgapi' 'rocm-debug-agent' 'rocm-gdb' 'rocprofiler' 'rocprofiler-dev' 'rocprofiler-plugins' 'roctracer' 'roctracer-dev' 'hsa-amd-aqlprofile' 'openmp-extras-runtime' 'rocm-cmake' 'rocm-utils' 'rocm-smi-lib')
optdepends=('clinfo' 'opencl-amd-dev')

source=(
# LIBDRM
"https://repo.radeon.com/amdgpu/5.7/ubuntu/pool/main/libd/libdrm-amdgpu/libdrm-amdgpu-amdgpu1_2.4.115.50700-1652687.22.04_amd64.deb"
# ROCM
"https://repo.radeon.com/rocm/apt/5.7/pool/main/r/rocm-core/rocm-core_5.7.0.50700-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.7/pool/main/c/comgr/comgr_2.5.0.50700-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.7/pool/main/h/hipcc/hipcc_1.0.0.50700-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.7/pool/main/h/hip-dev/hip-dev_5.7.31921.50700-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.7/pool/main/h/hip-doc/hip-doc_5.7.31921.50700-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.7/pool/main/h/hip-samples/hip-samples_5.7.31921.50700-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.7/pool/main/h/hsakmt-roct-dev/hsakmt-roct-dev_20230704.2.5268.50700-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.7/pool/main/h/hsa-rocr/hsa-rocr_1.11.0.50700-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.7/pool/main/h/hsa-rocr-dev/hsa-rocr-dev_1.11.0.50700-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.7/pool/main/r/rocminfo/rocminfo_1.0.0.50700-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.7/pool/main/h/hip-runtime-amd/hip-runtime-amd_5.7.31921.50700-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.7/pool/main/r/rocm-device-libs/rocm-device-libs_1.0.0.50700-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.7/pool/main/r/rocm-language-runtime/rocm-language-runtime_5.7.0.50700-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.7/pool/main/r/rocm-hip-runtime/rocm-hip-runtime_5.7.0.50700-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.7/pool/main/r/rocm-ocl-icd/rocm-ocl-icd_2.0.0.50700-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.7/pool/main/r/rocm-opencl/rocm-opencl_2.0.0.50700-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.7/pool/main/r/rocm-opencl-dev/rocm-opencl-dev_2.0.0.50700-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.7/pool/main/r/rocm-opencl-runtime/rocm-opencl-runtime_5.7.0.50700-63~22.04_amd64.deb"
# ROCM DEV
"https://repo.radeon.com/rocm/apt/5.7/pool/main/r/rocm-clang-ocl/rocm-clang-ocl_0.5.0.50700-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.7/pool/main/o/openmp-extras-runtime/openmp-extras-runtime_17.57.0.50700-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.7/pool/main/r/rocm-smi-lib/rocm-smi-lib_5.0.0.50700-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.7/pool/main/r/rocm-cmake/rocm-cmake_0.10.0.50700-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.7/pool/main/r/rocm-dbgapi/rocm-dbgapi_0.70.1.50700-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.7/pool/main/r/rocm-debug-agent/rocm-debug-agent_2.0.3.50700-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.7/pool/main/r/rocm-gdb/rocm-gdb_13.2.50700-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.7/pool/main/r/rocm-utils/rocm-utils_5.7.0.50700-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.7/pool/main/r/rocprofiler/rocprofiler_2.0.0.50700-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.7/pool/main/r/rocprofiler-dev/rocprofiler-dev_2.0.0.50700-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.7/pool/main/r/rocprofiler-plugins/rocprofiler-plugins_2.0.0.50700-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.7/pool/main/r/roctracer/roctracer_4.1.0.50700-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.7/pool/main/r/roctracer-dev/roctracer-dev_4.1.0.50700-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.7/pool/main/r/rocm-dev/rocm-dev_5.7.0.50700-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.7/pool/main/h/hsa-amd-aqlprofile/hsa-amd-aqlprofile_1.0.0.50700.50700-63~22.04_amd64.deb"
# Proprietary
"https://repo.radeon.com/amdgpu/5.7/ubuntu/pool/proprietary/o/opencl-legacy-amdgpu-pro/opencl-legacy-amdgpu-pro-icd_23.20-1654522.22.04_amd64.deb"
)

sha256sums=(
"a4883f1d8af696f749ab4eb903667dfdf6c75b2712cd8b37c717cc969ad6987e"

"303b12c6aeb0ecc5fb218fb5f7cb452896f414df84982b00bc26e181902435a9"
"611c062be7fb2746bfce25a424919cc8c6eaf3b85ff6ace63b11720413bb3052"
"d8db41580cbe42c329ca5759eca9063ccccb9adec7d20fff94534cc1611e7dcc"
"50e0b5971b700f416fe590fa3ba02b196ddc255fcc9c07275925843a54241c74"
"183eccbfed72b6d2db2555a2a67cf17604c46de691e1e4c653ea463df840a78e"
"6770f2ea83e7e026d1d020600ac3d0997fc95cdbc5546d4760a98c77aa84b724"
"66ac1cd54b37c681b0aa4743e87cd6ddc618a1a2f5969ae61c2fac8b349e59dc"
"987fec0426cb77fbf45a89e641ce3e16cb7e255c948691f345f918068ec58997"
"9a226859a9bc878fa45a53f0e8e74fd9ec3bb07364f1e538019a4593fa5ecac3"
"9e62dc35c3a1274c5a5cbff20f33ca5879d1dbd47db353e7819cb1d5f03189d8"
"2a07f4fa85ef5d3eb716a9185885fe91ee43af30d40d3cd275c508e13f8fdad2"
"1cb0aa477a65a6126061428ed05863421aaf7c5edb65849212e22f76a4b3ddc0"
"489ee30ebb2ec1edb310d5b89af304d94241b1fa8339b39584e2ad97eef15008"
"7fd3a1f37d8e502eb8257b3ce563cc7b06cf7e4c784f730629cd21865b9fa114"
"efafdf1f51dc68799f58810e096b8132d7aa1a528b45cbe7196acbb04f2f072b"
"93720bed0f39af39ef80821cbfd276a8c40bd864e85ff516161be2053ce98a65"
"576f7c7de7bb2ff68f4a6033c24c0eac233cf05751091d2b8b64a0d8a6e3f971"
"d583a41cdedf66bddad84828f539d6dff56cdd332a0386e8fd7ef37004260c59"

"8e7f50f6e7e21cba294ca647a9feec5cb5176ff41598d008f2cb66800afce010"
"beeb007ee0096bed4ade2bf62c0cc72e5d97519a521b57713d2ebe46fb72f22d"
"09c6ec1b9370dd0c5ce1fb712f26b597eb7fdb0cec890737e8fc4de07e777acf"
"4053b407ac31c6f466f04c1ebf1d7eef1ef6dca75eeff49d471d0bbbd1be9bf6"
"3138e574d87adc27af7d714a9c2e2d733b0ad2d4a68559fc7213948fbaaa67ac"
"92b1e1f0ad195f37fef15ad2237bcae306f377653428e0bdacd5eabe7d8e8824"
"b01ed1967c3eb12b9b53961da5dd0e5a20169ce2c81d1358e49a7f3e7c860e97"
"3042c9c5b7f5b0eae1669f88a547440a1754681e742f4d11f77bdde15c799abd"
"bad0e0f64f1461471cd4b2e7a5b88bd5118053749f908ab8e8cf977ee500ca78"
"86ac79ca5aaf9d23d30e382d7a01ed88e4ef2f7a6fc3eb417fed8491a1b6bf39"
"4d6c20e7678d8d928a98b449340fb235baa477275b9d41359cdb4a537114c0dc"
"cbf5c84a29fda2df0769d7e2dc106954d3412ade65b42888355ee722a79e5d31"
"69c7eed01c03fad212ab65722f8b6217a5ac76b4eeaeb292192ae0afcdb3bc7e"
"3a73c200a21a108192364488dd7833588dad4d4f77cf3f977529f18c963229cd"
"150db97979219ef3a671fd2c196dc662ef64663ebd6d5bd9ae1d23571fc6fe42"
# Proprietary
"bace2ef86be1dc823894e242e5077a70898062cc5b4db40962c19ca5bb6cf234"
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
	egz "${srcdir}/rocm-core_5.7.0.50700-63~22.04_amd64.deb"
	egz "${srcdir}/comgr_2.5.0.50700-63~22.04_amd64.deb"
	egz "${srcdir}/hipcc_1.0.0.50700-63~22.04_amd64.deb"
	egz "${srcdir}/hip-dev_5.7.31921.50700-63~22.04_amd64.deb"
	egz "${srcdir}/hip-doc_5.7.31921.50700-63~22.04_amd64.deb"
	egz "${srcdir}/hip-samples_5.7.31921.50700-63~22.04_amd64.deb"
	egz "${srcdir}/hsakmt-roct-dev_20230704.2.5268.50700-63~22.04_amd64.deb"
	egz "${srcdir}/hsa-rocr_1.11.0.50700-63~22.04_amd64.deb"
	egz "${srcdir}/hsa-rocr-dev_1.11.0.50700-63~22.04_amd64.deb"
	egz "${srcdir}/rocminfo_1.0.0.50700-63~22.04_amd64.deb"
	egz "${srcdir}/hip-runtime-amd_5.7.31921.50700-63~22.04_amd64.deb"
	egz "${srcdir}/rocm-device-libs_1.0.0.50700-63~22.04_amd64.deb"
	egz "${srcdir}/rocm-language-runtime_5.7.0.50700-63~22.04_amd64.deb"
	egz "${srcdir}/rocm-hip-runtime_5.7.0.50700-63~22.04_amd64.deb"
	egz "${srcdir}/rocm-ocl-icd_2.0.0.50700-63~22.04_amd64.deb"
	egz "${srcdir}/rocm-opencl_2.0.0.50700-63~22.04_amd64.deb"
	egz "${srcdir}/rocm-opencl-dev_2.0.0.50700-63~22.04_amd64.deb"
	egz "${srcdir}/rocm-opencl-runtime_5.7.0.50700-63~22.04_amd64.deb"
	exz "${srcdir}/rocm-clang-ocl_0.5.0.50700-63~22.04_amd64.deb"
	egz "${srcdir}/rocm-smi-lib_5.0.0.50700-63~22.04_amd64.deb"
	exz "${srcdir}/rocm-cmake_0.10.0.50700-63~22.04_amd64.deb"
	egz "${srcdir}/rocm-dbgapi_0.70.1.50700-63~22.04_amd64.deb"
	egz "${srcdir}/rocm-debug-agent_2.0.3.50700-63~22.04_amd64.deb"
	egz "${srcdir}/rocm-utils_5.7.0.50700-63~22.04_amd64.deb"
	egz "${srcdir}/rocprofiler_2.0.0.50700-63~22.04_amd64.deb"
	egz "${srcdir}/rocprofiler-dev_2.0.0.50700-63~22.04_amd64.deb"
	egz "${srcdir}/rocprofiler-plugins_2.0.0.50700-63~22.04_amd64.deb"
	egz "${srcdir}/roctracer_4.1.0.50700-63~22.04_amd64.deb"
	egz "${srcdir}/roctracer-dev_4.1.0.50700-63~22.04_amd64.deb"
	egz "${srcdir}/rocm-dev_5.7.0.50700-63~22.04_amd64.deb"
	egz "${srcdir}/hsa-amd-aqlprofile_1.0.0.50700.50700-63~22.04_amd64.deb"
	exz "${srcdir}/libdrm-amdgpu-amdgpu1_2.4.115.50700-1652687.22.04_amd64.deb"
	egz "${srcdir}/openmp-extras-runtime_17.57.0.50700-63~22.04_amd64.deb"
	egz "${srcdir}/rocm-gdb_13.2.50700-63~22.04_amd64.deb"
	exz "${srcdir}/opencl-legacy-amdgpu-pro-icd_23.20-1654522.22.04_amd64.deb"

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
	ln -s "/opt/rocm-5.7.0" "$pkgdir/opt/rocm"
	#ln -s "/opt/rocm-5.7.0/hip/bin/.hipVersion" "$pkgdir/opt/rocm-5.7.0/bin/.hipVersion"

	mkdir -p "${pkgdir}/opt/amdgpu/share/libdrm"
	cd "${pkgdir}/opt/amdgpu/share/libdrm"
	ln -s /usr/share/libdrm/amdgpu.ids amdgpu.ids		

	mkdir -p ${pkgdir}/etc/OpenCL/vendors	
	echo libamdocl64.so > "${pkgdir}/etc/OpenCL/vendors/amdocl64.icd"
	echo libamdocl-orca64.so > "${pkgdir}/etc/OpenCL/vendors/amdocl-orca64.icd"

	mkdir -p ${pkgdir}/etc/ld.so.conf.d
	echo /opt/rocm-5.7.0/opencl/lib > "$pkgdir/etc/ld.so.conf.d/opencl-amd.conf"
	echo /opt/rocm-5.7.0/lib >> "$pkgdir/etc/ld.so.conf.d/opencl-amd.conf"
	echo /opt/rocm-5.7.0/hip/lib >> "$pkgdir/etc/ld.so.conf.d/opencl-amd.conf"

	mkdir -p ${pkgdir}/etc/profile.d
	echo export PATH="\${PATH}:/opt/rocm-5.7.0/bin:/opt/rocm-5.7.0/hip/bin" > "$pkgdir/etc/profile.d/opencl-amd.sh"
}
