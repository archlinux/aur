# Maintainer: Carson Rueter <roachh at proton mail dot com>
# Co-Maintainer: George Sofianos

# Release notes https://docs.amd.com/bundle/ROCm-Release-Notes-v5.4.3/page/About_This_Document.html
amdgpu_repo='https://repo.radeon.com/amdgpu/5.4.3/ubuntu'
rocm_repo='https://repo.radeon.com/rocm/apt/5.4.3'
opencl_lib='opt/rocm-5.4.3/opencl/lib'
rocm_lib='opt/rocm-5.4.3/lib'
hip_lib='opt/rocm-5.4.3/hip/lib/'
amdgpu="opt/amdgpu/lib/x86_64-linux-gnu"
amdgpu_pro="opt/amdgpu-pro/lib/x86_64-linux-gnu/"

pkgname=opencl-amd
pkgdesc="ROCr OpenCL stack, supports Vega 10 and later products - Legacy OpenCL stack (Proprietary), supports legacy products older than Vega 10 - This package is intended to work along with the free amdgpu stack."            
pkgver=5.4.3
pkgrel=3
epoch=1
arch=('x86_64')
url='http://www.amd.com'
license=('custom:AMD')
makedepends=('wget')
depends=('libdrm' 'ocl-icd' 'gcc-libs' 'numactl' 'ncurses5-compat-libs')
provides=('opencl-driver' 'rocm-core' 'hip' 'hip-dev' 'hip-doc' 'hip-samples' 'hsakmt-roct-dev' 'hsa-rocr' 'hsa-rocr-dev' 'rocminfo' 'hip-runtime-amd' 'rocm-device-libs' 'rocm-language-runtime' 
	'rocm-hip-runtime' 'rocm-ocl-icd' 'rocm-opencl' 'rocm-opencl-dev' 'rocm-opencl-runtime' 'rocm-clang-ocl' 'rocprofiler' 'roctracer' 'hsa-amd-aqlprofile' 'openmp-extras-runtime' 'rocm-cmake' 'rocm-utils' 'rocm-smi-lib')
conflicts=('rocm-opencl-runtime' 'rocm-core' 'hip' 'hip-dev' 'hip-doc' 'hip-samples' 'hsakmt-roct-dev' 'hsa-rocr' 'hsa-rocr-dev' 'rocminfo' 'hip-runtime-amd' 'rocm-device-libs' 'rocm-language-runtime' 
	'rocm-hip-runtime' 'rocm-ocl-icd' 'rocm-opencl' 'rocm-opencl-dev' 'rocm-opencl-runtime' 'rocm-clang-ocl' 'rocprofiler' 'roctracer' 'hsa-amd-aqlprofile' 'openmp-extras-runtime' 'rocm-cmake' 'rocm-utils' 'rocm-smi-lib')
optdepends=('clinfo' 'opencl-amd-dev')

source=(
# LIBDRM
"https://repo.radeon.com/amdgpu/5.4.3/ubuntu/pool/main/libd/libdrm-amdgpu/libdrm-amdgpu-amdgpu1_2.4.113.50403-1538762.22.04_amd64.deb"
# ROCM
"https://repo.radeon.com/rocm/apt/5.4.3/pool/main/r/rocm-core/rocm-core_5.4.3.50403-121~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4.3/pool/main/c/comgr/comgr_2.4.0.50403-121~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4.3/pool/main/h/hip-dev/hip-dev_5.4.22804.50403-121~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4.3/pool/main/h/hip-doc/hip-doc_5.4.22804.50403-121~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4.3/pool/main/h/hip-samples/hip-samples_5.4.22804.50403-121~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4.3/pool/main/h/hsakmt-roct-dev/hsakmt-roct-dev_20221020.0.2.50403-121~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4.3/pool/main/h/hsa-rocr/hsa-rocr_1.7.0.50403-121~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4.3/pool/main/h/hsa-rocr-dev/hsa-rocr-dev_1.7.0.50403-121~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4.3/pool/main/r/rocminfo/rocminfo_1.0.0.50403-121~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4.3/pool/main/h/hip-runtime-amd/hip-runtime-amd_5.4.22804.50403-121~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4.3/pool/main/r/rocm-device-libs/rocm-device-libs_1.0.0.50403-121~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4.3/pool/main/r/rocm-language-runtime/rocm-language-runtime_5.4.3.50403-121~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4.3/pool/main/r/rocm-hip-runtime/rocm-hip-runtime_5.4.3.50403-121~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4.3/pool/main/r/rocm-ocl-icd/rocm-ocl-icd_2.0.0.50403-121~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4.3/pool/main/r/rocm-opencl/rocm-opencl_2.0.0.50403-121~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4.3/pool/main/r/rocm-opencl-dev/rocm-opencl-dev_2.0.0.50403-121~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4.3/pool/main/r/rocm-opencl-runtime/rocm-opencl-runtime_5.4.3.50403-121~22.04_amd64.deb"
# ROCM DEV
"https://repo.radeon.com/rocm/apt/5.4.3/pool/main/r/rocm-clang-ocl/rocm-clang-ocl_0.5.0.50403-121~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4.3/pool/main/o/openmp-extras-runtime/openmp-extras-runtime_15.54.0.50403-121~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4.3/pool/main/r/rocm-smi-lib/rocm-smi-lib_5.0.0.50403-121~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4.3/pool/main/r/rocm-cmake/rocm-cmake_0.8.0.50403-121~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4.3/pool/main/r/rocm-dbgapi/rocm-dbgapi_0.68.0.50403-121~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4.3/pool/main/r/rocm-debug-agent/rocm-debug-agent_2.0.3.50403-121~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4.3/pool/main/r/rocm-gdb/rocm-gdb_12.1.50403-121~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4.3/pool/main/r/rocm-utils/rocm-utils_5.4.3.50403-121~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4.3/pool/main/r/rocprofiler-dev/rocprofiler-dev_1.0.0.50403-121~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4.3/pool/main/r/roctracer-dev/roctracer-dev_4.1.0.50403-121~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4.3/pool/main/r/rocm-dev/rocm-dev_5.4.3.50403-121~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4.3/pool/main/h/hsa-amd-aqlprofile/hsa-amd-aqlprofile_1.0.0.50403-121~22.04_amd64.deb"
# Proprietary
"https://repo.radeon.com/amdgpu/5.4.3/ubuntu/pool/proprietary/o/opencl-legacy-amdgpu-pro/opencl-legacy-amdgpu-pro-icd_22.40-1538781.22.04_amd64.deb"
#"https://repo.radeon.com/amdgpu/22.20.3/ubuntu/pool/proprietary/c/clinfo-amdgpu-pro/clinfo-amdgpu-pro_22.10-1462318~22.04_amd64.deb"
#"https://repo.radeon.com/amdgpu/22.20.3/ubuntu/pool/proprietary/o/ocl-icd-amdgpu-pro/ocl-icd-libopencl1-amdgpu-pro_22.10-1462318~22.04_amd64.deb"
#"https://repo.radeon.com/amdgpu/22.20.3/ubuntu/pool/proprietary/a/amf-amdgpu-pro/amf-amdgpu-pro_1.4.24-1462318~22.04_amd64.deb"
)

sha256sums=(
"00bdf8491f90e08875b7b5990a18793908acf725ea244930a3f89fd26efd0ac1"

"f16677575d146e5b7b5194deaf6be7fb0ab57bb5b92065e5d3b2533bc32c473b"
"b966685a075d15b50d9d68f053e72b23cfcb627802fb507fdd24357a84fa48dc"
"4c2021e7820dea4e6d064bdd3066770ce95202b56c58629625a85f1b78d3b43d"
"fdf887abad46fd9b4cd386067da0886005fdf77fee3b2ed12dceb0afd8bf0730"
"d114f258b5d696a74aa457f9aa653d52ef5afde6ef04b723f62fcda9c0ccfb46"
"20278f31d37f9e155f77305004d6bdc6f4f5c3a8dc67073bad3d54e5addb11fc"
"c3e340563e7f2a8789652f2e7ddb52d47a5bf267f85d930208be3d71da970102"
"902ebb03ea6dd500170d7c4709b70d3b313218c260934085d19d73dd5dec5d09"
"df6723c34165f0f067e725654d37fcb9b4365230d5342fef10271c19edf2b6aa"
"82062667f98027bbd2ac8007bec75f4f06fe11946706922f5aa216d93e42cc30"
"4007016d604907c83ae999b82f012913f068b35e89cbdb81ae55461d0c6a11bd"
"cb8d8025b1dd40fc00678d600080174ada0c11ff5845b3aefb41248b3d52a9cf"
"e0347514be88d8a064dcd1789e426a9d0199a6024b5c16359964e5053818c2fd"
"1457c69a3b11eba803f340fcc958394c03860cbed788cc936d7e017f61e11c8a"
"c77907c7ac874a86e20b32d5d86c649ce84abfec88679263892c5ff508722580"
"1e88bb3d0be13283f81e9baa111343e68909f908a4184c319a12a2614c4927d2"
"5d48de32129a390218f07ebfd6b2c67d72d5a1bdaa220e9c2cbab31a6464f80c"

"b17da12f31c85890768c31da5f40ac93663a1b6f489c45dd32422d1345d8e3c4"
"154fdaf26f820749f718ad29b99317b69d3287c00f7e83b9d8c4cffde870679d"
"ec16693774969df26896c49dade298b0a36db890de5d38d3bfd4934528fbd324"
"b6a76abe01ea7c12faf0d57344195e0fd0638da19dcc6ccc5829d6dc32dcb227"
"30a4d66a78c3501c2f5e50be57a4fb60a13da4618fa4c6e99dfec9392f5d0a55"
"222b167d0f1b93c27474c22f9a086f1286faa7ad8693e6fe234230105085566a"
"c26c1019fa27df68d36548890fc488c6a9a522e2ef73cc6c1ac9180c0d0e8faf"
"ae82ea5ca5377d9ecac37998ee0db8316e24a0ed29da03a9e62d350038f84681"
"4f3391d1b4123fe4cacb337fe2a2c892c1222664fa54c3488ef4b628ac952ec1"
"bc1ce0d99a03200b94dc6dd05a888b56a7c3d42eed5107197362acbe96dd07b0"
"67162af945c85baaa53fe16459e2d843fe0e725a96c807ad2ab79f41e3fb0bec"
"8fa8910f2cb8ef443459bf99890c213824dc925cb1219a412e48cea9fbbc34f7"

"ecd6fc900fe8d8b1c57e57c6e141230d9ea0584fe9a41234595c1eff850bfd14"
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
	egz "${srcdir}/rocm-core_5.4.3.50403-121~22.04_amd64.deb"
	egz "${srcdir}/comgr_2.4.0.50403-121~22.04_amd64.deb"
	egz "${srcdir}/hip-dev_5.4.22804.50403-121~22.04_amd64.deb"
	egz "${srcdir}/hip-doc_5.4.22804.50403-121~22.04_amd64.deb"
	egz "${srcdir}/hip-samples_5.4.22804.50403-121~22.04_amd64.deb"
	egz "${srcdir}/hsakmt-roct-dev_20221020.0.2.50403-121~22.04_amd64.deb"
	egz "${srcdir}/hsa-rocr_1.7.0.50403-121~22.04_amd64.deb"
	egz "${srcdir}/hsa-rocr-dev_1.7.0.50403-121~22.04_amd64.deb"
	egz "${srcdir}/rocminfo_1.0.0.50403-121~22.04_amd64.deb"
	egz "${srcdir}/hip-runtime-amd_5.4.22804.50403-121~22.04_amd64.deb"
	egz "${srcdir}/rocm-device-libs_1.0.0.50403-121~22.04_amd64.deb"
	egz "${srcdir}/rocm-language-runtime_5.4.3.50403-121~22.04_amd64.deb"
	egz "${srcdir}/rocm-hip-runtime_5.4.3.50403-121~22.04_amd64.deb"
	egz "${srcdir}/rocm-ocl-icd_2.0.0.50403-121~22.04_amd64.deb"
	egz "${srcdir}/rocm-opencl_2.0.0.50403-121~22.04_amd64.deb"
	egz "${srcdir}/rocm-opencl-dev_2.0.0.50403-121~22.04_amd64.deb"
	egz "${srcdir}/rocm-opencl-runtime_5.4.3.50403-121~22.04_amd64.deb"
	exz "${srcdir}/rocm-clang-ocl_0.5.0.50403-121~22.04_amd64.deb"
	egz "${srcdir}/rocm-smi-lib_5.0.0.50403-121~22.04_amd64.deb"
	exz "${srcdir}/rocm-cmake_0.8.0.50403-121~22.04_amd64.deb"
	egz "${srcdir}/rocm-dbgapi_0.68.0.50403-121~22.04_amd64.deb"
	egz "${srcdir}/rocm-debug-agent_2.0.3.50403-121~22.04_amd64.deb"
	egz "${srcdir}/rocm-utils_5.4.3.50403-121~22.04_amd64.deb"
	egz "${srcdir}/rocprofiler-dev_1.0.0.50403-121~22.04_amd64.deb"
	egz "${srcdir}/roctracer-dev_4.1.0.50403-121~22.04_amd64.deb"
	egz "${srcdir}/rocm-dev_5.4.3.50403-121~22.04_amd64.deb"
	egz "${srcdir}/hsa-amd-aqlprofile_1.0.0.50403-121~22.04_amd64.deb"
	exz "${srcdir}/libdrm-amdgpu-amdgpu1_2.4.113.50403-1538762.22.04_amd64.deb"
	egz "${srcdir}/openmp-extras-runtime_15.54.0.50403-121~22.04_amd64.deb"
	egz "${srcdir}/rocm-gdb_12.1.50403-121~22.04_amd64.deb"
	exz "${srcdir}/opencl-legacy-amdgpu-pro-icd_22.40-1538781.22.04_amd64.deb"

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
	ln -s "/opt/rocm-5.4.3" "$pkgdir/opt/rocm"
	#ln -s "/opt/rocm-5.4.3/hip/bin/.hipVersion" "$pkgdir/opt/rocm-5.4.3/bin/.hipVersion"

	mkdir -p "${pkgdir}/opt/amdgpu/share/libdrm"
	cd "${pkgdir}/opt/amdgpu/share/libdrm"
	ln -s /usr/share/libdrm/amdgpu.ids amdgpu.ids		

	mkdir -p ${pkgdir}/etc/OpenCL/vendors	
	echo libamdocl64.so > "${pkgdir}/etc/OpenCL/vendors/amdocl64.icd"
	echo libamdocl-orca64.so > "${pkgdir}/etc/OpenCL/vendors/amdocl-orca64.icd"

	mkdir -p ${pkgdir}/etc/ld.so.conf.d
	echo /opt/rocm-5.4.3/opencl/lib > "$pkgdir/etc/ld.so.conf.d/opencl-amd.conf"
	echo /opt/rocm-5.4.3/lib >> "$pkgdir/etc/ld.so.conf.d/opencl-amd.conf"
	echo /opt/rocm-5.4.3/hip/lib >> "$pkgdir/etc/ld.so.conf.d/opencl-amd.conf"

	mkdir -p ${pkgdir}/etc/profile.d
	echo export PATH="\${PATH}:/opt/rocm-5.4.3/bin:/opt/rocm-5.4.3/hip/bin" > "$pkgdir/etc/profile.d/opencl-amd.sh"
}
