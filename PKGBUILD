# Maintainer: Carson Rueter <roachh at proton mail dot com>
# Co-Maintainer: George Sofianos

# Release notes https://docs.amd.com/bundle/ROCm-Release-Notes-v5.3.2/page/About_This_Document.html
amdgpu_install='22.40.0.50302'
amdgpu_version='22.40.0'
rocm_version='50302'
amdgpu_build_id='1502151.22.04'
rocm_build_id='96~22.04'
hip_build_id='22062'
amdgpu_repo='https://repo.radeon.com/amdgpu/5.3.2/ubuntu'
rocm_repo='https://repo.radeon.com/rocm/apt/5.3.2'
opencl_lib='opt/rocm-5.3.2/opencl/lib'
rocm_lib='opt/rocm-5.3.2/lib'
hip_lib='opt/rocm-5.3.2/hip/lib/'
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
provides=('opencl-driver' 'rocm-core' 'hip-dev' 'hip-doc' 'hip-samples' 'hsakmt-roct-dev' 'hsa-rocr' 'hsa-rocr-dev' 'rocminfo' 'hip-runtime-amd' 'rocm-device-libs' 'rocm-language-runtime' 
	'rocm-hip-runtime' 'rocm-ocl-icd' 'rocm-opencl' 'rocm-opencl-dev' 'rocm-opencl-runtime' 'rocm-clang-ocl' 'openmp-extras-runtime' 'rocm-cmake' 'rocm-utils' 'rocm-smi-lib')
optdepends=('clinfo' 'opencl-amd-dev')

source=(
# LIBDRM
"https://repo.radeon.com/amdgpu/5.3.2/ubuntu/pool/main/libd/libdrm-amdgpu/libdrm-amdgpu-amdgpu1_2.4.112.50302-1502151.22.04_amd64.deb"
# ROCM
"https://repo.radeon.com/rocm/apt/5.3.2/pool/main/r/rocm-core/rocm-core_5.3.2.50302-96~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3.2/pool/main/c/comgr/comgr_2.4.0.50302-96~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3.2/pool/main/h/hip-dev/hip-dev_5.3.22062.50302-96~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3.2/pool/main/h/hip-doc/hip-doc_5.3.22062.50302-96~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3.2/pool/main/h/hip-samples/hip-samples_5.3.22062.50302-96~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3.2/pool/main/h/hsakmt-roct-dev/hsakmt-roct-dev_20220803.1.8.50302-96~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3.2/pool/main/h/hsa-rocr/hsa-rocr_1.7.0.50302-96~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3.2/pool/main/h/hsa-rocr-dev/hsa-rocr-dev_1.7.0.50302-96~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3.2/pool/main/r/rocminfo/rocminfo_1.0.0.50302-96~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3.2/pool/main/h/hip-runtime-amd/hip-runtime-amd_5.3.22062.50302-96~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3.2/pool/main/r/rocm-device-libs/rocm-device-libs_1.0.0.50302-96~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3.2/pool/main/r/rocm-language-runtime/rocm-language-runtime_5.3.2.50302-96~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3.2/pool/main/r/rocm-hip-runtime/rocm-hip-runtime_5.3.2.50302-96~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3.2/pool/main/r/rocm-ocl-icd/rocm-ocl-icd_2.0.0.50302-96~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3.2/pool/main/r/rocm-opencl/rocm-opencl_2.0.0.50302-96~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3.2/pool/main/r/rocm-opencl-dev/rocm-opencl-dev_2.0.0.50302-96~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3.2/pool/main/r/rocm-opencl-runtime/rocm-opencl-runtime_5.3.2.50302-96~22.04_amd64.deb"
# ROCM DEV
"https://repo.radeon.com/rocm/apt/5.3.2/pool/main/r/rocm-clang-ocl/rocm-clang-ocl_0.5.0.50302-96~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3.2/pool/main/o/openmp-extras-runtime/openmp-extras-runtime_15.53.0.50302-96~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3.2/pool/main/r/rocm-smi-lib/rocm-smi-lib_5.0.0.50302-96~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3.2/pool/main/r/rocm-cmake/rocm-cmake_0.8.0.50302-96~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3.2/pool/main/r/rocm-dbgapi/rocm-dbgapi_0.67.0.50302-96~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3.2/pool/main/r/rocm-debug-agent/rocm-debug-agent_2.0.3.50302-96~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3.2/pool/main/r/rocm-gdb/rocm-gdb_12.1.50302-96~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3.2/pool/main/r/rocm-utils/rocm-utils_5.3.2.50302-96~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3.2/pool/main/r/rocprofiler-dev/rocprofiler-dev_1.0.0.50302-96~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3.2/pool/main/r/roctracer-dev/roctracer-dev_4.1.0.50302-96~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3.2/pool/main/r/rocm-dev/rocm-dev_5.3.2.50302-96~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3.2/pool/main/h/hsa-amd-aqlprofile/hsa-amd-aqlprofile_1.0.0.50302-96~22.04_amd64.deb"
# Proprietary
#"https://repo.radeon.com/amdgpu/22.20.3/ubuntu/pool/proprietary/o/opencl-legacy-amdgpu-pro/opencl-legacy-amdgpu-pro-icd_22.20-1462318~22.04_amd64.deb"
#"https://repo.radeon.com/amdgpu/22.20.3/ubuntu/pool/proprietary/c/clinfo-amdgpu-pro/clinfo-amdgpu-pro_22.10-1462318~22.04_amd64.deb"
#"https://repo.radeon.com/amdgpu/22.20.3/ubuntu/pool/proprietary/o/ocl-icd-amdgpu-pro/ocl-icd-libopencl1-amdgpu-pro_22.10-1462318~22.04_amd64.deb"
#"https://repo.radeon.com/amdgpu/22.20.3/ubuntu/pool/proprietary/a/amf-amdgpu-pro/amf-amdgpu-pro_1.4.24-1462318~22.04_amd64.deb"
)

sha256sums=(
"4d72c4c9394defc85d235071d38718266577edbfc33899ef71b879b93811660b"

"7a79e38693c0c93b853166571d7f187e2bfb9a02ad5fb0075a44e49d72013f15"
"8f3bc86a14926a5f8e6c33511b59f84027f90b044e9a7a879fd9796db892a756"
"4f9a5bc8aa6dd906a1c0aaa6aa3672aa2fd4ed60006e64724300ed75c814762f"
"438e3e21c6616400a736610d459a5df0eccf1291b3b1a872325a64b769ff6c3c"
"d83462a4c752a7afb0589201f1f490a98b586d1ecca7630adb9901a3e3c6ce4c"
"94aa9d7744523a910eeb7771f79395cfaf94d9f135e512625268cc909437ed9b"
"44dcabc5e4d1d5d76508888dc8c2f633d8eaf251006cebd9bf2880252285a3e0"
"16c860eb34d8301828e72b1f5aba69537aee8b9ed5d6fe4ac8be1e9ade290f95"
"e08dd24687bdaf679fbf06c10f2b8eb5142b5a12d262156c9cd2f468f7bd4752"
"cad897e8be11bee2288f7aedd1aa0d056a29a672eb03d66595ae213e460e5e30"
"7f3a187d10395522be5468f481064d166a771f3d1c36809c95fe930116ca3564"
"f26ed969851c370aeb6e16e8387a93fbb18c98e51c4944f8839bc793ccfb991e"
"0f14e1bc045ce41874612653264a4d465f2cd4f6a2f993b0992df788716d7b07"
"096ef41d76e39569dc016e0cf9c220e97d926cfb8aab9b4fdbbc4e6ae7f11ac0"
"77607c23cb298dd7156a97db4bb9ce07100ae4135be38f95d3bd543ea60a631a"
"5dce637c7532ab4a2975055d39f13b42c5156a129da61a05e7d2e3576c6da156"
"14bea98476c7761cd2cdcd2be0d1d8ee77d751b0569cc75226d1decbc871ed84"

"fb6c8ef7a2a41d532d6a7bbf2c9c09ddc508cb5ecda81fef990f41cc34e20dc1"
"79c2633da5d5c0c375097d3e60910631ca66deace4a2b3e65885176607bc5351"
"617c6fcef4205780b10ba5b1c541e1cebb5e879c4af46fd16e45e68d43fa9425"
"4a1292edf1a58f12f2b170ec23b7666a38e6d5a0d80899c6133e72ddd4848d5d"
"e9640e7c75257362ce7225d8fab9207c7983b3a48f36bf0c2a69b4a4f979ea91"
"337a4bb5a01e73441734df108ceb226de9cc36c8cdad541532a6e02f0a53dd56"
"b7adb16f9f772c8c306c5dbb4f3b1e6fbff107509d160fafd59c400e3acc5493"
"7abacdfcf45a6d63ad6db3191d9d026aca0c6eb4c517861b790768e6b96507ad"
"59fddb60f1f72b0091fcefd1ee72b967592edfd7e99d92786b7a8d6a86bb5f64"
"a7efbecf3d90a4aa16deff4eddc91a9c000999a7d6951230e662ce512c508c39"
"df99d45ad043e5c9cf7b27dc9471d364f6f7b7f31cb6016c3100000cab00ed74"
"18a8279347137cd23e73d376501ec3e49502443817087aaf48fe5e7b51d6c9d5"
#"ac94ead24a5ecfc9462b09ef647ac036333c856391571e9071e3263f1232dd71"
#"d9d0182d372345a9e0b7df1e18da29aed6420edc9f948e7ffc2e8e66200db513"
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
	egz "${srcdir}/rocm-core_5.3.2.50302-96~22.04_amd64.deb"
	egz "${srcdir}/comgr_2.4.0.50302-96~22.04_amd64.deb"
	egz "${srcdir}/hip-dev_5.3.22062.50302-96~22.04_amd64.deb"
	egz "${srcdir}/hip-doc_5.3.22062.50302-96~22.04_amd64.deb"
	egz "${srcdir}/hip-samples_5.3.22062.50302-96~22.04_amd64.deb"
	egz "${srcdir}/hsakmt-roct-dev_20220803.1.8.50302-96~22.04_amd64.deb"
	egz "${srcdir}/hsa-rocr_1.7.0.50302-96~22.04_amd64.deb"
	egz "${srcdir}/hsa-rocr-dev_1.7.0.50302-96~22.04_amd64.deb"
	egz "${srcdir}/rocminfo_1.0.0.50302-96~22.04_amd64.deb"
	egz "${srcdir}/hip-runtime-amd_5.3.22062.50302-96~22.04_amd64.deb"
	egz "${srcdir}/rocm-device-libs_1.0.0.50302-96~22.04_amd64.deb"
	egz "${srcdir}/rocm-language-runtime_5.3.2.50302-96~22.04_amd64.deb"
	egz "${srcdir}/rocm-hip-runtime_5.3.2.50302-96~22.04_amd64.deb"
	egz "${srcdir}/rocm-ocl-icd_2.0.0.50302-96~22.04_amd64.deb"
	egz "${srcdir}/rocm-opencl_2.0.0.50302-96~22.04_amd64.deb"
	egz "${srcdir}/rocm-opencl-dev_2.0.0.50302-96~22.04_amd64.deb"
	egz "${srcdir}/rocm-opencl-runtime_5.3.2.50302-96~22.04_amd64.deb"
	exz "${srcdir}/rocm-clang-ocl_0.5.0.50302-96~22.04_amd64.deb"
	egz "${srcdir}/rocm-smi-lib_5.0.0.50302-96~22.04_amd64.deb"
	exz "${srcdir}/rocm-cmake_0.8.0.50302-96~22.04_amd64.deb"
	egz "${srcdir}/rocm-dbgapi_0.67.0.50302-96~22.04_amd64.deb"
	egz "${srcdir}/rocm-debug-agent_2.0.3.50302-96~22.04_amd64.deb"
	egz "${srcdir}/rocm-utils_5.3.2.50302-96~22.04_amd64.deb"
	egz "${srcdir}/rocprofiler-dev_1.0.0.50302-96~22.04_amd64.deb"
	egz "${srcdir}/roctracer-dev_4.1.0.50302-96~22.04_amd64.deb"
	egz "${srcdir}/rocm-dev_5.3.2.50302-96~22.04_amd64.deb"
	egz "${srcdir}/hsa-amd-aqlprofile_1.0.0.50302-96~22.04_amd64.deb"
	exz "${srcdir}/libdrm-amdgpu-amdgpu1_2.4.112.50302-1502151.22.04_amd64.deb"
	egz "${srcdir}/openmp-extras-runtime_15.53.0.50302-96~22.04_amd64.deb"
	egz "${srcdir}/rocm-gdb_12.1.50302-96~22.04_amd64.deb"
	# exz "${srcdir}/opencl-legacy-amdgpu-pro-icd_22.20-1462318~22.04_amd64.deb"

	#cd ${srcdir}/${amdgpu_pro}
	#sed -i "s|libdrm_amdgpu|libdrm_amdgpo|g" libamdocl-orca64.so

	cd ${srcdir}/${amdgpu}
	rm "libdrm_amdgpu.so.1"
	mv "libdrm_amdgpu.so.1.0.0" "libdrm_amdgpo.so.1.0.0"
	ln -s "libdrm_amdgpo.so.1.0.0" "libdrm_amdgpo.so.1"	

	# legacy
	mkdir -p ${pkgdir}/usr/lib
	#mv "${srcdir}/${amdgpu_pro}/libamdocl-orca64.so" "${pkgdir}/usr/lib/"
	mv "${srcdir}/${amdgpu}/libdrm_amdgpo.so.1.0.0" "${pkgdir}/usr/lib/"
	mv "${srcdir}/${amdgpu}/libdrm_amdgpo.so.1" "${pkgdir}/usr/lib/"

	mv "${srcdir}/opt/" "${pkgdir}/"
	ln -s "/opt/rocm-5.3.2" "$pkgdir/opt/rocm"
	#ln -s "/opt/rocm-5.3.2/hip/bin/.hipVersion" "$pkgdir/opt/rocm-5.3.2/bin/.hipVersion"

	mkdir -p "${pkgdir}/opt/amdgpu/share/libdrm"
	cd "${pkgdir}/opt/amdgpu/share/libdrm"
	ln -s /usr/share/libdrm/amdgpu.ids amdgpu.ids		

	mkdir -p ${pkgdir}/etc/OpenCL/vendors	
	echo libamdocl64.so > "${pkgdir}/etc/OpenCL/vendors/amdocl64.icd"
	echo libamdocl-orca64.so > "${pkgdir}/etc/OpenCL/vendors/amdocl-orca64.icd"

	mkdir -p ${pkgdir}/etc/ld.so.conf.d
	echo /opt/rocm-5.3.2/opencl/lib > "$pkgdir/etc/ld.so.conf.d/opencl-amd.conf"
	echo /opt/rocm-5.3.2/lib >> "$pkgdir/etc/ld.so.conf.d/opencl-amd.conf"
	echo /opt/rocm-5.3.2/hip/lib >> "$pkgdir/etc/ld.so.conf.d/opencl-amd.conf"

	mkdir -p ${pkgdir}/etc/profile.d
	echo export PATH="\${PATH}:/opt/rocm-5.3.2/bin:/opt/rocm-5.3.2/hip/bin" > "$pkgdir/etc/profile.d/opencl-amd.sh"
}
