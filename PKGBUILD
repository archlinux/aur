# Maintainer: Carson Rueter <roachh at proton mail dot com>
# Co-Maintainer: George Sofianos

# Release notes https://docs.amd.com/bundle/ROCm-Release-Notes-v5.4.1/page/About_This_Document.html
amdgpu_repo='https://repo.radeon.com/amdgpu/5.4.1/ubuntu'
rocm_repo='https://repo.radeon.com/rocm/apt/5.4.1'
opencl_lib='opt/rocm-5.4.1/opencl/lib'
rocm_lib='opt/rocm-5.4.1/lib'
hip_lib='opt/rocm-5.4.1/hip/lib/'
amdgpu="opt/amdgpu/lib/x86_64-linux-gnu"
amdgpu_pro="opt/amdgpu-pro/lib/x86_64-linux-gnu/"

pkgname=opencl-amd
pkgdesc="ROCr OpenCL stack, supports Vega 10 and later products - Legacy OpenCL stack (Proprietary), supports legacy products older than Vega 10 - This package is intended to work along with the free amdgpu stack."            
pkgver=5.4.1
pkgrel=1
epoch=1
arch=('x86_64')
url='http://www.amd.com'
license=('custom:AMD')
makedepends=('wget')
depends=('libdrm' 'ocl-icd' 'gcc-libs' 'numactl' 'ncurses5-compat-libs')
conflicts=('rocm-opencl-runtime')
provides=('opencl-driver' 'rocm-core' 'hip' 'hip-dev' 'hip-doc' 'hip-samples' 'hsakmt-roct-dev' 'hsa-rocr' 'hsa-rocr-dev' 'rocminfo' 'hip-runtime-amd' 'rocm-device-libs' 'rocm-language-runtime' 
	'rocm-hip-runtime' 'rocm-ocl-icd' 'rocm-opencl' 'rocm-opencl-dev' 'rocm-opencl-runtime' 'rocm-clang-ocl' 'rocprofiler' 'roctracer' 'hsa-amd-aqlprofile' 'openmp-extras-runtime' 'rocm-cmake' 'rocm-utils' 'rocm-smi-lib')
optdepends=('clinfo' 'opencl-amd-dev')

source=(
# LIBDRM
"https://repo.radeon.com/amdgpu/5.4.1/ubuntu/pool/main/libd/libdrm-amdgpu/libdrm-amdgpu-amdgpu1_2.4.113.50401-1518338.22.04_amd64.deb"
# ROCM
"https://repo.radeon.com/rocm/apt/5.4.1/pool/main/r/rocm-core/rocm-core_5.4.1.50401-84~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4.1/pool/main/c/comgr/comgr_2.4.0.50401-84~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4.1/pool/main/h/hip-dev/hip-dev_5.4.22802.50401-84~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4.1/pool/main/h/hip-doc/hip-doc_5.4.22802.50401-84~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4.1/pool/main/h/hip-samples/hip-samples_5.4.22802.50401-84~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4.1/pool/main/h/hsakmt-roct-dev/hsakmt-roct-dev_20221020.0.2.50401-84~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4.1/pool/main/h/hsa-rocr/hsa-rocr_1.7.0.50401-84~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4.1/pool/main/h/hsa-rocr-dev/hsa-rocr-dev_1.7.0.50401-84~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4.1/pool/main/r/rocminfo/rocminfo_1.0.0.50401-84~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4.1/pool/main/h/hip-runtime-amd/hip-runtime-amd_5.4.22802.50401-84~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4.1/pool/main/r/rocm-device-libs/rocm-device-libs_1.0.0.50401-84~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4.1/pool/main/r/rocm-language-runtime/rocm-language-runtime_5.4.1.50401-84~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4.1/pool/main/r/rocm-hip-runtime/rocm-hip-runtime_5.4.1.50401-84~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4.1/pool/main/r/rocm-ocl-icd/rocm-ocl-icd_2.0.0.50401-84~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4.1/pool/main/r/rocm-opencl/rocm-opencl_2.0.0.50401-84~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4.1/pool/main/r/rocm-opencl-dev/rocm-opencl-dev_2.0.0.50401-84~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4.1/pool/main/r/rocm-opencl-runtime/rocm-opencl-runtime_5.4.1.50401-84~22.04_amd64.deb"
# ROCM DEV
"https://repo.radeon.com/rocm/apt/5.4.1/pool/main/r/rocm-clang-ocl/rocm-clang-ocl_0.5.0.50401-84~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4.1/pool/main/o/openmp-extras-runtime/openmp-extras-runtime_15.54.0.50401-84~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4.1/pool/main/r/rocm-smi-lib/rocm-smi-lib_5.0.0.50401-84~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4.1/pool/main/r/rocm-cmake/rocm-cmake_0.8.0.50401-84~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4.1/pool/main/r/rocm-dbgapi/rocm-dbgapi_0.68.0.50401-84~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4.1/pool/main/r/rocm-debug-agent/rocm-debug-agent_2.0.3.50401-84~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4.1/pool/main/r/rocm-gdb/rocm-gdb_12.1.50401-84~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4.1/pool/main/r/rocm-utils/rocm-utils_5.4.1.50401-84~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4.1/pool/main/r/rocprofiler-dev/rocprofiler-dev_1.0.0.50401-84~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4.1/pool/main/r/roctracer-dev/roctracer-dev_4.1.0.50401-84~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4.1/pool/main/r/rocm-dev/rocm-dev_5.4.1.50401-84~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4.1/pool/main/h/hsa-amd-aqlprofile/hsa-amd-aqlprofile_1.0.0.50401-84~22.04_amd64.deb"
# Proprietary
"https://repo.radeon.com/amdgpu/5.4.1/ubuntu/pool/proprietary/o/opencl-legacy-amdgpu-pro/opencl-legacy-amdgpu-pro-icd_22.40-1518373.22.04_amd64.deb"
#"https://repo.radeon.com/amdgpu/22.20.3/ubuntu/pool/proprietary/c/clinfo-amdgpu-pro/clinfo-amdgpu-pro_22.10-1462318~22.04_amd64.deb"
#"https://repo.radeon.com/amdgpu/22.20.3/ubuntu/pool/proprietary/o/ocl-icd-amdgpu-pro/ocl-icd-libopencl1-amdgpu-pro_22.10-1462318~22.04_amd64.deb"
#"https://repo.radeon.com/amdgpu/22.20.3/ubuntu/pool/proprietary/a/amf-amdgpu-pro/amf-amdgpu-pro_1.4.24-1462318~22.04_amd64.deb"
)

sha256sums=(
"2fc5ccec231ed3e0a04edc78ca0b4a2c361f96ff53d02dfe65cc3931daebe0eb"

"defcebb79d409e9898c715750875d003a3dcd8f1ef303a802538c9ca73948e0e"
"c649170bae7e0dd26d86415a5c07031c1d8a3412253860df326467eb7af10c62"
"6ff9cdf86ce4df46664b3fb6fc6bbea5b72afcf435cb3db547c52bd9d7ad2e7b"
"fb9f40f2666ade19b231ebe0b7e36561f773673ef428348b2e3d455589716226"
"114bb73a2b00c8dd4fe423a7ef2c571da3eff49f40106892b68d3abc7640c1e6"
"7210f4a1c2ba26eab1ca1e49ce0b077f3057c8ebf117b3f6b22b848098b2af73"
"21e6c1717607ce5d1977d4db87892c08a4c98af77fcf64a8fcddbfeb081ec965"
"68dbcdaadcacecb6ad0ccf53d6f2d3698db20bb03e92e12c453002cacf1e279c"
"c7e81cb1892eeaf846acb2fa55e9d0c38b871557acaf3633726ddb880c8effc3"
"07ec38d5ca51f605fc5609b2e5decead3f73526a256af3b187a2d184db6d3fd1"
"13682803a5930b3661c4404deaef133eb63fbf019f1d51083f514a5c1d1f8f8f"
"ac607ea96c481fcbc3011048efd8012794651ce29188f25e34b3172f4b131453"
"2178a1fd1c6710ade6c40b51904725fbda65e987f21593cfcd12e3e512f3518a"
"874a47dd60aefd9de3b486af3d8db021eb088b9343b2e45655e34b9f8f97cdd7"
"997a99ce571a0802df2884f8ed47284bdec7881b2ccaa10d1406cc039db2018b"
"72ce6c5ae2899450fd26c38199e1a20fab88928733fc6e6012e8d009ef0d2a37"
"8579e7cdb77f594204deded08ff89cb9df845e8b849524c6db39df6d55006ab9"

"301149cf72634539f4a716f090dbd7f56b2a7888ba2c784d7782828cf304a3e1"
"58f5105c3aa4025271e819f95b06fe30dbab554980b3f3404710dc32137f10d7"
"7982a28143f813effc25be15ed56b177f4e956dfa7a69b98fd65ca6411fc1ae4"
"9da7a12146d6e90043f8bdf73b8baef374d11a7aa9e306de3d59ffda7dc2f4fb"
"e77f30db5e7bb663b79adbd8bec74c422b0d8a47545708eeea50a47c46f56b4e"
"35b8381849635e16ed30ca5858b4197310dc0ee85246156e5f02109d9867381e"
"d96d859542389a7891c8d1b26ee5cdb2e7aeb9779d00ad268cfb837e0bc44a14"
"5efc36166740822869609bb28d48920d2ef8a540056a8da1d123aeb560bcdc6f"
"4c899ab5cc324ba8b7092b6edd1b65d96a476c02ee7d64790b445cfbf3cffd3e"
"9c22151dd7fe755e7ed0ad4e66da9972e95b3e881b7a000372170b9efec4ca7c"
"c670afe925d10106263a3f20d3b7c7d3c6a804f4045a62fb9bad22a48ce39f90"
"3531b7f6d33040dad1d4221f43c25606719e2d39444766d148a66a29c46af18b"
"a72318ba004c92211e190f574e2bca509fb8d9c785055063c450c5ae4b748b4a"
#"d9d0182d372345a9e0b7df1e18da29aed6420edc9f948e7ffc2e8e66200db513"
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
	egz "${srcdir}/rocm-core_5.4.1.50401-84~22.04_amd64.deb"
	egz "${srcdir}/comgr_2.4.0.50401-84~22.04_amd64.deb"
	egz "${srcdir}/hip-dev_5.4.22802.50401-84~22.04_amd64.deb"
	egz "${srcdir}/hip-doc_5.4.22802.50401-84~22.04_amd64.deb"
	egz "${srcdir}/hip-samples_5.4.22802.50401-84~22.04_amd64.deb"
	egz "${srcdir}/hsakmt-roct-dev_20221020.0.2.50401-84~22.04_amd64.deb"
	egz "${srcdir}/hsa-rocr_1.7.0.50401-84~22.04_amd64.deb"
	egz "${srcdir}/hsa-rocr-dev_1.7.0.50401-84~22.04_amd64.deb"
	egz "${srcdir}/rocminfo_1.0.0.50401-84~22.04_amd64.deb"
	egz "${srcdir}/hip-runtime-amd_5.4.22802.50401-84~22.04_amd64.deb"
	egz "${srcdir}/rocm-device-libs_1.0.0.50401-84~22.04_amd64.deb"
	egz "${srcdir}/rocm-language-runtime_5.4.1.50401-84~22.04_amd64.deb"
	egz "${srcdir}/rocm-hip-runtime_5.4.1.50401-84~22.04_amd64.deb"
	egz "${srcdir}/rocm-ocl-icd_2.0.0.50401-84~22.04_amd64.deb"
	egz "${srcdir}/rocm-opencl_2.0.0.50401-84~22.04_amd64.deb"
	egz "${srcdir}/rocm-opencl-dev_2.0.0.50401-84~22.04_amd64.deb"
	egz "${srcdir}/rocm-opencl-runtime_5.4.1.50401-84~22.04_amd64.deb"
	exz "${srcdir}/rocm-clang-ocl_0.5.0.50401-84~22.04_amd64.deb"
	egz "${srcdir}/rocm-smi-lib_5.0.0.50401-84~22.04_amd64.deb"
	exz "${srcdir}/rocm-cmake_0.8.0.50401-84~22.04_amd64.deb"
	egz "${srcdir}/rocm-dbgapi_0.68.0.50401-84~22.04_amd64.deb"
	egz "${srcdir}/rocm-debug-agent_2.0.3.50401-84~22.04_amd64.deb"
	egz "${srcdir}/rocm-utils_5.4.1.50401-84~22.04_amd64.deb"
	egz "${srcdir}/rocprofiler-dev_1.0.0.50401-84~22.04_amd64.deb"
	egz "${srcdir}/roctracer-dev_4.1.0.50401-84~22.04_amd64.deb"
	egz "${srcdir}/rocm-dev_5.4.1.50401-84~22.04_amd64.deb"
	egz "${srcdir}/hsa-amd-aqlprofile_1.0.0.50401-84~22.04_amd64.deb"
	exz "${srcdir}/libdrm-amdgpu-amdgpu1_2.4.113.50401-1518338.22.04_amd64.deb"
	egz "${srcdir}/openmp-extras-runtime_15.54.0.50401-84~22.04_amd64.deb"
	egz "${srcdir}/rocm-gdb_12.1.50401-84~22.04_amd64.deb"
	exz "${srcdir}/opencl-legacy-amdgpu-pro-icd_22.40-1518373.22.04_amd64.deb"

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
	ln -s "/opt/rocm-5.4.1" "$pkgdir/opt/rocm"
	#ln -s "/opt/rocm-5.4.1/hip/bin/.hipVersion" "$pkgdir/opt/rocm-5.4.1/bin/.hipVersion"

	mkdir -p "${pkgdir}/opt/amdgpu/share/libdrm"
	cd "${pkgdir}/opt/amdgpu/share/libdrm"
	ln -s /usr/share/libdrm/amdgpu.ids amdgpu.ids		

	mkdir -p ${pkgdir}/etc/OpenCL/vendors	
	echo libamdocl64.so > "${pkgdir}/etc/OpenCL/vendors/amdocl64.icd"
	echo libamdocl-orca64.so > "${pkgdir}/etc/OpenCL/vendors/amdocl-orca64.icd"

	mkdir -p ${pkgdir}/etc/ld.so.conf.d
	echo /opt/rocm-5.4.1/opencl/lib > "$pkgdir/etc/ld.so.conf.d/opencl-amd.conf"
	echo /opt/rocm-5.4.1/lib >> "$pkgdir/etc/ld.so.conf.d/opencl-amd.conf"
	echo /opt/rocm-5.4.1/hip/lib >> "$pkgdir/etc/ld.so.conf.d/opencl-amd.conf"

	mkdir -p ${pkgdir}/etc/profile.d
	echo export PATH="\${PATH}:/opt/rocm-5.4.1/bin:/opt/rocm-5.4.1/hip/bin" > "$pkgdir/etc/profile.d/opencl-amd.sh"
}
