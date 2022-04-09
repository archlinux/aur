# Maintainer: Carson Rueter <roachh at proton mail dot com>
# Co-Maintainer: George Sofianos

# Release notes https://docs.amd.com/bundle/ROCm-Release-Notes-v5.1/page/About_This_Document.html
amdgpu_install='22.10.1.50101'
amdgpu_version='22.10.1'
rocm_version='50101'
amdgpu_build_id='1401700'
rocm_build_id='48'
amdgpu_repo='https://repo.radeon.com/amdgpu/22.10.1/ubuntu'
rocm_repo='https://repo.radeon.com/rocm/apt/5.1.1'
opencl_lib='opt/rocm-5.1.1/opencl/lib'
rocm_lib='opt/rocm-5.1.1/lib'
hip_lib='opt/rocm-5.1.1/hip/lib/'
amdgpu="opt/amdgpu/lib/x86_64-linux-gnu"
amdgpu_pro="opt/amdgpu-pro/lib/x86_64-linux-gnu/"

pkgname=opencl-amd
pkgdesc="ROCr OpenCL stack, supports Vega 10 and later products - Legacy OpenCL stack (Proprietary), supports legacy products older than Vega 10 - This package is intended to work along with the free amdgpu stack."            
pkgver=${amdgpu_install}
pkgrel=1
arch=('x86_64')
url='http://www.amd.com'
license=('custom:AMD')
makedepends=('wget')
depends=('libdrm' 'ocl-icd' 'gcc-libs' 'numactl' 'ncurses5-compat-libs')
conflicts=('rocm-opencl-runtime')
provides=('opencl-driver' 'rocm-core' 'hsakmt-roct-dev' 'hsa-rocr' 'hsa-rocr-dev' 'rocminfo' 'hip-runtime-amd' 'rocm-device-libs' 'rocm-language-runtime' 
	'rocm-hip-runtime' 'rocm-ocl-icd' 'rocm-opencl' 'rocm-opencl-dev' 'rocm-opencl-runtime')
optdepends=('clinfo' 'opencl-amd-dev')

source=(
# LIBDRM
"https://repo.radeon.com/amdgpu/22.10.1/ubuntu/pool/main/libd/libdrm-amdgpu/libdrm-amdgpu-amdgpu1_2.4.109.50101-1401700_amd64.deb"
# ROCM
"https://repo.radeon.com/rocm/apt/5.1.1/pool/main/r/rocm-core/rocm-core_5.1.1.50101-48_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1.1/pool/main/c/comgr/comgr_2.4.0.50101-48_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1.1/pool/main/h/hip-dev/hip-dev_5.1.20531.50101-48_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1.1/pool/main/h/hip-doc/hip-doc_5.1.20531.50101-48_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1.1/pool/main/h/hip-samples/hip-samples_5.1.20531.50101-48_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1.1/pool/main/h/hsakmt-roct-dev/hsakmt-roct-dev_20220128.1.7.50101-48_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1.1/pool/main/h/hsa-rocr/hsa-rocr_1.5.0.50101-48_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1.1/pool/main/h/hsa-rocr-dev/hsa-rocr-dev_1.5.0.50101-48_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1.1/pool/main/r/rocminfo/rocminfo_1.0.0.50101-48_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1.1/pool/main/h/hip-runtime-amd/hip-runtime-amd_5.1.20531.50101-48_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1.1/pool/main/r/rocm-device-libs/rocm-device-libs_1.0.0.50101-48_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1.1/pool/main/r/rocm-language-runtime/rocm-language-runtime_5.1.1.50101-48_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1.1/pool/main/r/rocm-hip-runtime/rocm-hip-runtime_5.1.1.50101-48_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1.1/pool/main/r/rocm-ocl-icd/rocm-ocl-icd_2.0.0.50101-48_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1.1/pool/main/r/rocm-opencl/rocm-opencl_2.0.0.50101-48_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1.1/pool/main/r/rocm-opencl-dev/rocm-opencl-dev_2.0.0.50101-48_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1.1/pool/main/r/rocm-opencl-runtime/rocm-opencl-runtime_5.1.1.50101-48_amd64.deb"
# ROCM DEV
"https://repo.radeon.com/rocm/apt/5.1.1/pool/main/r/rocm-clang-ocl/rocm-clang-ocl_0.5.0.50101-48_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1.1/pool/main/o/openmp-extras/openmp-extras_13.51.0.50101-48_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1.1/pool/main/r/rocm-smi-lib/rocm-smi-lib_5.0.0.50101-48_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1.1/pool/main/r/rocm-cmake/rocm-cmake_0.7.2.50101-48_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1.1/pool/main/r/rocm-dbgapi/rocm-dbgapi_0.64.0.50101-48_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1.1/pool/main/r/rocm-debug-agent/rocm-debug-agent_2.0.3.50101-48_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1.1/pool/main/r/rocm-gdb/rocm-gdb_11.2.50101-48_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1.1/pool/main/r/rocm-utils/rocm-utils_5.1.1.50101-48_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1.1/pool/main/r/rocprofiler-dev/rocprofiler-dev_1.0.0.50101-48_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1.1/pool/main/r/roctracer-dev/roctracer-dev_1.0.0.50101-48_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1.1/pool/main/r/rocm-dev/rocm-dev_5.1.1.50101-48_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1.1/pool/main/h/hsa-amd-aqlprofile/hsa-amd-aqlprofile_1.0.0.50101-48_amd64.deb"
# Proprietary
"https://repo.radeon.com/amdgpu/22.10.1/ubuntu/pool/proprietary/o/opencl-legacy-amdgpu-pro/opencl-legacy-amdgpu-pro-icd_22.10.1-1401700_amd64.deb"
#"https://repo.radeon.com/amdgpu/22.10.1/ubuntu/pool/proprietary/c/clinfo-amdgpu-pro/clinfo-amdgpu-pro_22.10-1401700_amd64.deb"
#"https://repo.radeon.com/amdgpu/22.10.1/ubuntu/pool/proprietary/o/ocl-icd-amdgpu-pro/ocl-icd-libopencl1-amdgpu-pro_22.10-1401700_amd64.deb"
#"https://repo.radeon.com/amdgpu/22.10.1/ubuntu/pool/proprietary/a/amf-amdgpu-pro/amf-amdgpu-pro_1.4.24-1401700_amd64.deb"
)

sha256sums=(
"9225f5053cc06d67f8e89a5a74ff1b3870dd7105b23bbc1f1db07905de5758e7"

"eaa703e40689d855ec0e9ed9db3e6920152414079d759c8bf60afbf06c299b2e"
"f27dd8c6190c765cfc217a2246c9c4c0cedb9f4d39f2608e5036c34c022f50bc"
"dde596a03c1e26052b4e2f66fb062c4a75874f6ff001ebb267767103f84b4dc8"
"7665e600cb6aaf89895e36cb7fb7c832a84862b3bcc9c722f60e193c75ca3bc7"
"b48bd9dda2f255146c91af727a1f68ea3b10e90b1ea52f3ad517deee7ef2efd1"
"accb7848083edbf68df83b0cc2c425afda8d0f84d735cee99cc9ef455ad2b240"
"37ff6c586921fcb7f55aca284393e9c849fbcc8ae2fde9e1fb6eb284cfbac9ee"
"2695598f051f9bc1898fcb1a8bf77ffde8ba041c1ed05c65f27b0afa28252e54"
"0df3adebe7226e2d264fda62246d41b6de40b04bb18bf89ced6c67ae9a5771f8"
"b128b72cf67bfb1cb5267d25aba0a8e7bdc2a5cb67df28f8cf42298f5f49930d"
"7d854d04dd94f34a401a7ffc9f537df6746fc8df68e464903cc00df9c9cf2681"
"f13b7c15d28fac6b53271eabe00b801a79b435330214b468b06967e598961e8a"
"1cb3b7fb7ee4b55e9f8de8759830ce02a874711e3c95e5d7de870639fc6e90ea"
"e71dacdd80fe0c7d421cbe3be140f1ac661e764d52c5ae57e03e1f2c487fdfaa"
"3a389f5c7cf2836190270e4ccdd27a306c8f159114dd395f19f24eb6f6a848ae"
"be14466727df468a5c6b26189117489c681fc4f35562de64ff74ff0645ecf48f"
"1e6ba4b7535cc7d3b89afd70048105ee2c55b879053c87f07df8b3a41af86b23"

"2bcb0f296421b5c75fc0821b00b2e42da7cb5539946d37adfe312d228dd6ad40"
"2f785b6f823890ce56764e03da73f9eb540bce53ff23970e80927320f8025d0c"
"d45e424007c21aeaaf4d5d72661510ef40cc6dd01a8b4e9a542af2c67124ec40"
"7371f6f391be09eb0d9d0faac1b29900422c7454c64744b5e2ef53f5de311daf"
"134a8556072f91ca54d0deb19775c57f8878beeb3287ba0eef786222e3d85cd6"
"70a9a76961eaa6bdb038a6b08fb91b71e76b02459ca96305a8b96fb7d68a3663"
"337a535c260dabd9b72bb13fd219c9ad7b70495f805d1a387e1052b33d1ffe51"
"0481d6ddeef0c437c3fae431bdb608cb9f9d75e6386a61ce515f6c028f7a030c"
"408bc366b39fa40775781699cbf803742f0dc67b6b410dfb6e3d41cd1d568398"
"3267d29222e63d75fcbe2ea8bc1e5703bb7c922fc963e99e5d798148b550b109"
"4bde3935348240bab11713a2d7aeeb8e02432786adc1bd3f61caf0bd3d01e55e"
"e84b03814fe3a58172b921455aba5a3252b7ab463f0c2eaf0c431d5c305aa872"
"8cd5f008dd4b30c1ba90f1072d740753109666ebbcee53bc83458a5c1afb9cec"
)

#Extract .xz files
exz() {
	ar x $1
	tar xJf data.tar.xz
	rm data.tar.xz
}
#Extract .gz files
egz() {
	ar x $1
	tar xfx data.tar.gz
	rm data.tar.gz
}

package() {
	egz "${srcdir}/rocm-core_5.1.1.50101-48_amd64.deb"
	egz "${srcdir}/comgr_2.4.0.50101-48_amd64.deb"
	egz "${srcdir}/hip-dev_5.1.20531.50101-48_amd64.deb"
	egz "${srcdir}/hip-doc_5.1.20531.50101-48_amd64.deb"
	egz "${srcdir}/hip-samples_5.1.20531.50101-48_amd64.deb"
	egz "${srcdir}/hsakmt-roct-dev_20220128.1.7.50101-48_amd64.deb"
	egz "${srcdir}/hsa-rocr_1.5.0.50101-48_amd64.deb"
	egz "${srcdir}/hsa-rocr-dev_1.5.0.50101-48_amd64.deb"
	egz "${srcdir}/rocminfo_1.0.0.50101-48_amd64.deb"
	egz "${srcdir}/hip-runtime-amd_5.1.20531.50101-48_amd64.deb"
	egz "${srcdir}/rocm-device-libs_1.0.0.50101-48_amd64.deb"
	egz "${srcdir}/rocm-language-runtime_5.1.1.50101-48_amd64.deb"
	egz "${srcdir}/rocm-hip-runtime_5.1.1.50101-48_amd64.deb"
	egz "${srcdir}/rocm-ocl-icd_2.0.0.50101-48_amd64.deb"
	egz "${srcdir}/rocm-opencl_2.0.0.50101-48_amd64.deb"
	egz "${srcdir}/rocm-opencl-dev_2.0.0.50101-48_amd64.deb"
	egz "${srcdir}/rocm-opencl-runtime_5.1.1.50101-48_amd64.deb"
	egz "${srcdir}/rocm-clang-ocl_0.5.0.50101-48_amd64.deb"
	egz "${srcdir}/rocm-smi-lib_5.0.0.50101-48_amd64.deb"
	egz "${srcdir}/rocm-cmake_0.7.2.50101-48_amd64.deb"
	egz "${srcdir}/rocm-dbgapi_0.64.0.50101-48_amd64.deb"
	egz "${srcdir}/rocm-debug-agent_2.0.3.50101-48_amd64.deb"
	egz "${srcdir}/rocm-utils_5.1.1.50101-48_amd64.deb"
	egz "${srcdir}/rocprofiler-dev_1.0.0.50101-48_amd64.deb"
	egz "${srcdir}/roctracer-dev_1.0.0.50101-48_amd64.deb"
	egz "${srcdir}/rocm-dev_5.1.1.50101-48_amd64.deb"
	egz "${srcdir}/hsa-amd-aqlprofile_1.0.0.50101-48_amd64.deb"
	exz "${srcdir}/libdrm-amdgpu-amdgpu1_2.4.109.50101-1401700_amd64.deb"
	exz "${srcdir}/openmp-extras_13.51.0.50101-48_amd64.deb"
	exz "${srcdir}/rocm-gdb_11.2.50101-48_amd64.deb"
	exz "${srcdir}/opencl-legacy-amdgpu-pro-icd_22.10.1-1401700_amd64.deb"

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
	ln -s "/opt/rocm-5.1.1" "$pkgdir/opt/rocm"
	ln -s "/opt/rocm-5.1.1/hip/bin/.hipVersion" "$pkgdir/opt/rocm-5.1.1/bin/.hipVersion"

	mkdir -p "${pkgdir}/opt/amdgpu/share/libdrm"
	cd "${pkgdir}/opt/amdgpu/share/libdrm"
	ln -s /usr/share/libdrm/amdgpu.ids amdgpu.ids		

	mkdir -p ${pkgdir}/etc/OpenCL/vendors	
	echo libamdocl64.so > "${pkgdir}/etc/OpenCL/vendors/amdocl64.icd"
	echo libamdocl-orca64.so > "${pkgdir}/etc/OpenCL/vendors/amdocl-orca64.icd"

	mkdir -p ${pkgdir}/etc/ld.so.conf.d
	echo /opt/rocm-5.1.1/opencl/lib > "$pkgdir/etc/ld.so.conf.d/opencl-amd.conf"
	echo /opt/rocm-5.1.1/lib >> "$pkgdir/etc/ld.so.conf.d/opencl-amd.conf"
	echo /opt/rocm-5.1.1/hip/lib >> "$pkgdir/etc/ld.so.conf.d/opencl-amd.conf"

	mkdir -p ${pkgdir}/etc/profile.d
	echo export PATH="\${PATH}:/opt/rocm-5.1.1/bin:/opt/rocm-5.1.1/hip/bin" > "$pkgdir/etc/profile.d/opencl-amd.sh"
}
