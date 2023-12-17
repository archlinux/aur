# Maintainer: Carson Rueter <roachh at proton mail dot com>
# Co-Maintainer: George Sofianos

# Release notes https://rocm.docs.amd.com/en/latest/about/CHANGELOG.html#rocm-6-0-0
amdgpu_repo='https://repo.radeon.com/amdgpu/6.0/ubuntu'
rocm_repo='https://repo.radeon.com/rocm/apt/6.0'
opencl_lib='opt/rocm-6.0.0/opencl/lib'
rocm_lib='opt/rocm-6.0.0/lib'
hip_lib='opt/rocm-6.0.0/hip/lib/'
amdgpu="opt/amdgpu/lib/x86_64-linux-gnu"
amdgpu_pro="opt/amdgpu-pro/lib/x86_64-linux-gnu/"

pkgname=opencl-amd
pkgdesc="ROCr OpenCL stack, supports Vega 10 and later products - Legacy OpenCL stack (Proprietary), supports legacy products older than Vega 10 - This package is intended to work along with the free amdgpu stack."            
pkgver=6.0.0
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
"https://repo.radeon.com/amdgpu/6.0/ubuntu/pool/main/libd/libdrm-amdgpu/libdrm-amdgpu-amdgpu1_2.4.116.60000-1697589.22.04_amd64.deb"
# ROCM
"https://repo.radeon.com/rocm/apt/6.0/pool/main/r/rocm-core/rocm-core_6.0.0.60000-91~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.0/pool/main/c/comgr/comgr_2.6.0.60000-91~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.0/pool/main/h/hipcc/hipcc_1.0.0.60000-91~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.0/pool/main/h/hip-dev/hip-dev_6.0.32830.60000-91~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.0/pool/main/h/hip-doc/hip-doc_6.0.32830.60000-91~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.0/pool/main/h/hip-samples/hip-samples_6.0.32830.60000-91~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.0/pool/main/h/hsakmt-roct-dev/hsakmt-roct-dev_20231016.2.245.60000-91~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.0/pool/main/h/hsa-rocr/hsa-rocr_1.12.0.60000-91~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.0/pool/main/h/hsa-rocr-dev/hsa-rocr-dev_1.12.0.60000-91~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.0/pool/main/r/rocminfo/rocminfo_1.0.0.60000-91~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.0/pool/main/h/hip-runtime-amd/hip-runtime-amd_6.0.32830.60000-91~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.0/pool/main/r/rocm-device-libs/rocm-device-libs_1.0.0.60000-91~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.0/pool/main/r/rocm-language-runtime/rocm-language-runtime_6.0.0.60000-91~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.0/pool/main/r/rocm-hip-runtime/rocm-hip-runtime_6.0.0.60000-91~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.0/pool/main/r/rocm-ocl-icd/rocm-ocl-icd_2.0.0.60000-91~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.0/pool/main/r/rocm-opencl/rocm-opencl_2.0.0.60000-91~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.0/pool/main/r/rocm-opencl-dev/rocm-opencl-dev_2.0.0.60000-91~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.0/pool/main/r/rocm-opencl-runtime/rocm-opencl-runtime_6.0.0.60000-91~22.04_amd64.deb"
# ROCM DEV
"https://repo.radeon.com/rocm/apt/6.0/pool/main/r/rocm-clang-ocl/rocm-clang-ocl_0.5.0.60000-91~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.0/pool/main/o/openmp-extras-runtime/openmp-extras-runtime_17.60.0.60000-91~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.0/pool/main/r/rocm-smi-lib/rocm-smi-lib_6.0.0.60000-91~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.0/pool/main/r/rocm-cmake/rocm-cmake_0.11.0.60000-91~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.0/pool/main/r/rocm-dbgapi/rocm-dbgapi_0.71.0.60000-91~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.0/pool/main/r/rocm-debug-agent/rocm-debug-agent_2.0.3.60000-91~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.0/pool/main/r/rocm-gdb/rocm-gdb_13.2.60000-91~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.0/pool/main/r/rocm-utils/rocm-utils_6.0.0.60000-91~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.0/pool/main/r/rocprofiler/rocprofiler_2.0.60000.60000-91~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.0/pool/main/r/rocprofiler-dev/rocprofiler-dev_2.0.60000.60000-91~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.0/pool/main/r/rocprofiler-plugins/rocprofiler-plugins_2.0.60000.60000-91~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.0/pool/main/r/roctracer/roctracer_4.1.60000.60000-91~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.0/pool/main/r/roctracer-dev/roctracer-dev_4.1.60000.60000-91~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.0/pool/main/r/rocm-dev/rocm-dev_6.0.0.60000-91~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.0/pool/main/h/hsa-amd-aqlprofile/hsa-amd-aqlprofile_1.0.0.60000.60000-91~22.04_amd64.deb"
# Proprietary
"https://repo.radeon.com/amdgpu/5.7.1/ubuntu/pool/proprietary/o/opencl-legacy-amdgpu-pro/opencl-legacy-amdgpu-pro-icd_23.20-1664987.22.04_amd64.deb"
)

sha256sums=(
"21279801adcad0170508ea9cd5d3fc65fbb3cd6420330f4163d27de2128ee51e"

"26322736eef16606887a3d43027a4a913c12107d59eb9d9f713379e25bdfed30"
"a727c9d8cd6d83c9b8a71edd3bdb6d7caa325ecefdcbaa575f8cb24e40fe0fe4"
"315edde3742ab2c69839c0f6f230ba04cfa81f8a0cb9e628d173b17726480020"
"925d79be33bef5e6c0bb90a59c575193e2f62af0dc0a1d2c4309d07ac576bb66"
"fe394ac5efc4e2ce72a2e1ab98cafdabf954a12e06c1a376d1434bf9284361c2"
"06bfa78fd5d6898e11383a098431dc9db8f8bbc0fb9e884761099859652c3f83"
"b56bb0b5068f64c2a2cce6ae9d47bf6f93c9f8f88082b41bd6c98565d62feb68"
"904abb6ed0e7bcd24913309308670baf68325d0c7369c78ac357a458e6b2d453"
"06b0334e7dff3e71f6229d8a7ad3f64739ce462da6781cc54130fbafd82b0f3a"
"d6865e062de479c774b88e3ac3199c11b12c8ac23bfeb5a6c89cdff40cb66ae2"
"cc117d33620d8e2653c1f02eb8eb382207ef105fe87187395c436bd0f1cc0a46"
"1947d3e295e5c82ae60e6ee894e51157ee67290adab98a87d9350cbd25d2d4a0"
"9f509fccc657dce827e61445992da4aaa10a0d44b24e972d6ca631890377f33c"
"5336fe79cbe24c5a72c80e1d5515bcab987d22c5fcf3914923c2500d2fe394c2"
"772b2feb750566c970e8e37320f39f0360be265df69acaa53ecd1adff148bc66"
"32b880d77207af577e28ac596c9fc17954f605a117c22d78bb1d2caed0e586af"
"2788cbb1020b411e832f97dfa4795aca40f78920035d20ef4ebb3734284409a9"
"bcd9b44a18c6aeb2794039ee69863c3cda867979d59ee142b95c82dabb417586"

"481dc4c536ccaa99f25cf40b55f13fb3d764ceffd4dddb846051922187e9741b"
"a681b7926110da7baafecae5a70021a896154b22e3338bf71dddcc68e0a14d34"
"0add3bb71ef904543b6d7d9674a756012ec283b0a18ddaab0b8bf57c8104e2b7"
"0f76c48a8cdbdcfe99e209a1344ec49832d915e27ebaa19a877df3a32172ec10"
"1026d34b0065b0c00a91245e701a05a19887a8018424744682a11cd9560891b7"
"aba6ba261dd9fe2994ed6495239e7c40db8dc175188e1f9d7fc5c9def8189584"
"18f557ff80b90b19d2407856da92d9645908b5612941d51d93ede5b92e7c25c9"
"1435560d87a7484de3c473f950c668bec171d86647126875ff0d8aa01ff28daf"
"6a8ee026510a9362b17c009fb91b716a6f6e46332c1adf2e73ce6b4d3be1999e"
"b9da02103d1fa0c105a97c614e9bc9c564e31cdf1780b2dc41fd941b57bc4155"
"afabac223a4c3b686752fb7992585e5337e38422b153bbc8dbecfd81c3a766dc"
"1480da06d05b6f22d5faa2dd9840c161a8a3696b56a0f9b95ef3c7e84c7e6533"
"ceec56d6bdab640ec6700bda8e0958cc9b06e5e5ee8382a875ee286fdc4a49e9"
"e162b6d763044f7760adf3fce5ac00c72a5d71144596cfcd1bb4d1bcea0a2dab"
"ebd8cbce379c95b59df32f3037726b4128c77f3b7b4779467620b24ffc48e438"
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
	egz "${srcdir}/rocm-core_6.0.0.60000-91~22.04_amd64.deb"
	egz "${srcdir}/comgr_2.6.0.60000-91~22.04_amd64.deb"
	egz "${srcdir}/hipcc_1.0.0.60000-91~22.04_amd64.deb"
	egz "${srcdir}/hip-dev_6.0.32830.60000-91~22.04_amd64.deb"
	egz "${srcdir}/hip-doc_6.0.32830.60000-91~22.04_amd64.deb"
	egz "${srcdir}/hip-samples_6.0.32830.60000-91~22.04_amd64.deb"
	egz "${srcdir}/hsakmt-roct-dev_20231016.2.245.60000-91~22.04_amd64.deb"
	egz "${srcdir}/hsa-rocr_1.12.0.60000-91~22.04_amd64.deb"
	egz "${srcdir}/hsa-rocr-dev_1.12.0.60000-91~22.04_amd64.deb"
	egz "${srcdir}/rocminfo_1.0.0.60000-91~22.04_amd64.deb"
	egz "${srcdir}/hip-runtime-amd_6.0.32830.60000-91~22.04_amd64.deb"
	egz "${srcdir}/rocm-device-libs_1.0.0.60000-91~22.04_amd64.deb"
	egz "${srcdir}/rocm-language-runtime_6.0.0.60000-91~22.04_amd64.deb"
	egz "${srcdir}/rocm-hip-runtime_6.0.0.60000-91~22.04_amd64.deb"
	egz "${srcdir}/rocm-ocl-icd_2.0.0.60000-91~22.04_amd64.deb"
	egz "${srcdir}/rocm-opencl_2.0.0.60000-91~22.04_amd64.deb"
	egz "${srcdir}/rocm-opencl-dev_2.0.0.60000-91~22.04_amd64.deb"
	egz "${srcdir}/rocm-opencl-runtime_6.0.0.60000-91~22.04_amd64.deb"
	exz "${srcdir}/rocm-clang-ocl_0.5.0.60000-91~22.04_amd64.deb"
	egz "${srcdir}/rocm-smi-lib_6.0.0.60000-91~22.04_amd64.deb"
	exz "${srcdir}/rocm-cmake_0.11.0.60000-91~22.04_amd64.deb"
	egz "${srcdir}/rocm-dbgapi_0.71.0.60000-91~22.04_amd64.deb"
	egz "${srcdir}/rocm-debug-agent_2.0.3.60000-91~22.04_amd64.deb"
	egz "${srcdir}/rocm-utils_6.0.0.60000-91~22.04_amd64.deb"
	egz "${srcdir}/rocprofiler_2.0.60000.60000-91~22.04_amd64.deb"
	egz "${srcdir}/rocprofiler-dev_2.0.60000.60000-91~22.04_amd64.deb"
	egz "${srcdir}/rocprofiler-plugins_2.0.60000.60000-91~22.04_amd64.deb"
	egz "${srcdir}/roctracer_4.1.60000.60000-91~22.04_amd64.deb"
	egz "${srcdir}/roctracer-dev_4.1.60000.60000-91~22.04_amd64.deb"
	egz "${srcdir}/rocm-dev_6.0.0.60000-91~22.04_amd64.deb"
	egz "${srcdir}/hsa-amd-aqlprofile_1.0.0.60000.60000-91~22.04_amd64.deb"
	exz "${srcdir}/libdrm-amdgpu-amdgpu1_2.4.116.60000-1697589.22.04_amd64.deb"
	egz "${srcdir}/openmp-extras-runtime_17.60.0.60000-91~22.04_amd64.deb"
	egz "${srcdir}/rocm-gdb_13.2.60000-91~22.04_amd64.deb"
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
	ln -s "/opt/rocm-6.0.0" "$pkgdir/opt/rocm"
	#ln -s "/opt/rocm-6.0.0/hip/bin/.hipVersion" "$pkgdir/opt/rocm-6.0.0/bin/.hipVersion"

	mkdir -p "${pkgdir}/opt/amdgpu/share/libdrm"
	cd "${pkgdir}/opt/amdgpu/share/libdrm"
	ln -s /usr/share/libdrm/amdgpu.ids amdgpu.ids		

	mkdir -p ${pkgdir}/etc/OpenCL/vendors	
	echo libamdocl64.so > "${pkgdir}/etc/OpenCL/vendors/amdocl64.icd"
	echo libamdocl-orca64.so > "${pkgdir}/etc/OpenCL/vendors/amdocl-orca64.icd"

	mkdir -p ${pkgdir}/etc/ld.so.conf.d
	echo /opt/rocm-6.0.0/opencl/lib > "$pkgdir/etc/ld.so.conf.d/opencl-amd.conf"
	echo /opt/rocm-6.0.0/lib >> "$pkgdir/etc/ld.so.conf.d/opencl-amd.conf"
	echo /opt/rocm-6.0.0/hip/lib >> "$pkgdir/etc/ld.so.conf.d/opencl-amd.conf"

	mkdir -p ${pkgdir}/etc/profile.d
	echo export PATH="\${PATH}:/opt/rocm-6.0.0/bin:/opt/rocm-6.0.0/hip/bin" > "$pkgdir/etc/profile.d/opencl-amd.sh"
}
