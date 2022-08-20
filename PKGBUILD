# Maintainer: Carson Rueter <roachh at proton mail dot com>
# Co-Maintainer: George Sofianos

# Release notes https://docs.amd.com/bundle/ROCm-Release-Notes-v5.2/page/About_This_Document.html
amdgpu_install='22.20.3.50203'
amdgpu_version='22.20.3'
rocm_version='50203'
amdgpu_build_id='1462318~22.04'
rocm_build_id='109'
amdgpu_repo='https://repo.radeon.com/amdgpu/22.20.3/ubuntu'
rocm_repo='https://repo.radeon.com/rocm/apt/5.2.3'
opencl_lib='opt/rocm-5.2.3/opencl/lib'
rocm_lib='opt/rocm-5.2.3/lib'
hip_lib='opt/rocm-5.2.3/hip/lib/'
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
provides=('opencl-driver' 'rocm-core' 'rocm-cmake' 'hsakmt-roct-dev' 'hsa-rocr' 'hsa-rocr-dev' 'rocminfo' 'hip-runtime-amd' 'rocm-device-libs' 'rocm-language-runtime' 
	'rocm-hip-runtime' 'rocm-ocl-icd' 'rocm-opencl' 'rocm-opencl-dev' 'rocm-opencl-runtime')
optdepends=('clinfo' 'opencl-amd-dev')

source=(
# LIBDRM
"https://repo.radeon.com/amdgpu/22.20.3/ubuntu/pool/main/libd/libdrm-amdgpu/libdrm-amdgpu-amdgpu1_2.4.110.50203-1462318~22.04_amd64.deb"
# ROCM
"https://repo.radeon.com/rocm/apt/5.2.3/pool/main/r/rocm-core/rocm-core_5.2.3.50203-109_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.2.3/pool/main/c/comgr/comgr_2.4.0.50203-109_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.2.3/pool/main/h/hip-dev/hip-dev_5.2.21153.50203-109_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.2.3/pool/main/h/hip-doc/hip-doc_5.2.21153.50203-109_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.2.3/pool/main/h/hip-samples/hip-samples_5.2.21153.50203-109_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.2.3/pool/main/h/hsakmt-roct-dev/hsakmt-roct-dev_20220426.1.026.50203-109_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.2.3/pool/main/h/hsa-rocr/hsa-rocr_1.5.0.50203-109_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.2.3/pool/main/h/hsa-rocr-dev/hsa-rocr-dev_1.5.0.50203-109_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.2.3/pool/main/r/rocminfo/rocminfo_1.0.0.50203-109_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.2.3/pool/main/h/hip-runtime-amd/hip-runtime-amd_5.2.21153.50203-109_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.2.3/pool/main/r/rocm-device-libs/rocm-device-libs_1.0.0.50203-109_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.2.3/pool/main/r/rocm-language-runtime/rocm-language-runtime_5.2.3.50203-109_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.2.3/pool/main/r/rocm-hip-runtime/rocm-hip-runtime_5.2.3.50203-109_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.2.3/pool/main/r/rocm-ocl-icd/rocm-ocl-icd_2.0.0.50203-109_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.2.3/pool/main/r/rocm-opencl/rocm-opencl_2.0.0.50203-109_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.2.3/pool/main/r/rocm-opencl-dev/rocm-opencl-dev_2.0.0.50203-109_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.2.3/pool/main/r/rocm-opencl-runtime/rocm-opencl-runtime_5.2.3.50203-109_amd64.deb"
# ROCM DEV
"https://repo.radeon.com/rocm/apt/5.2.3/pool/main/r/rocm-clang-ocl/rocm-clang-ocl_0.5.0.50203-109_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.2.3/pool/main/o/openmp-extras/openmp-extras_14.52.0.50203-109_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.2.3/pool/main/r/rocm-smi-lib/rocm-smi-lib_5.0.0.50203-109_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.2.3/pool/main/r/rocm-cmake/rocm-cmake_0.7.3.50203-109_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.2.3/pool/main/r/rocm-dbgapi/rocm-dbgapi_0.65.1.50203-109_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.2.3/pool/main/r/rocm-debug-agent/rocm-debug-agent_2.0.3.50203-109_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.2.3/pool/main/r/rocm-gdb/rocm-gdb_11.2.50203-109_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.2.3/pool/main/r/rocm-utils/rocm-utils_5.2.3.50203-109_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.2.3/pool/main/r/rocprofiler-dev/rocprofiler-dev_1.0.0.50203-109_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.2.3/pool/main/r/roctracer-dev/roctracer-dev_1.0.0.50203-109_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.2.3/pool/main/r/rocm-dev/rocm-dev_5.2.3.50203-109_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.2.3/pool/main/h/hsa-amd-aqlprofile/hsa-amd-aqlprofile_1.0.0.50203-109_amd64.deb"
# Proprietary
"https://repo.radeon.com/amdgpu/22.20.3/ubuntu/pool/proprietary/o/opencl-legacy-amdgpu-pro/opencl-legacy-amdgpu-pro-icd_22.20-1462318~22.04_amd64.deb"
#"https://repo.radeon.com/amdgpu/22.20.3/ubuntu/pool/proprietary/c/clinfo-amdgpu-pro/clinfo-amdgpu-pro_22.10-1462318~22.04_amd64.deb"
#"https://repo.radeon.com/amdgpu/22.20.3/ubuntu/pool/proprietary/o/ocl-icd-amdgpu-pro/ocl-icd-libopencl1-amdgpu-pro_22.10-1462318~22.04_amd64.deb"
#"https://repo.radeon.com/amdgpu/22.20.3/ubuntu/pool/proprietary/a/amf-amdgpu-pro/amf-amdgpu-pro_1.4.24-1462318~22.04_amd64.deb"
)

sha256sums=(
"1ba0cb736986ffb11a1364224b7b110acae1d1a0cbfe776251e460629b6347da"

"67455770bafdca6b918e2561b5907e2032a8690abc05953391682f03df76419c"
"bbb627832cfffe61c095eadbdb37141bbc3e177c511d84ff90083dbdc603f794"
"29b7f22966c31c90196e8a3159cafb2ad0eda870b5e951b2499ad33aa8415393"
"b86e2feecf760d7a31f423c645cfc7570df291b0614f585f938d80269a594550"
"34068bd8c400c20c472a69246cc85442e710a923df012def7abc852925c1483b"
"c908f6dfc2118e7855145a2d7f46a2a4fc262abbae920ddc84be68a77c690ce7"
"49cfcae176061542003da1f403c9cbeffea5ff24e2d48dbf79f9e92358c961e7"
"30a2bdbdcc210e9799b312cf64d83c6b2ea5975e2a6ef752c003a0dd340e6e63"
"ab190cdde0ce765f936b897caf3a9c53e212f08ec34242e08bc189ce54c4d5df"
"ddcf982e4c98f6b38c17429c5e25d43c963c912aa70ebd357416e109107d28cc"
"dfe2eb5d9ede767fb503f2458af84ce8994ebf3d9751aa5fdb1811baa3ad1518"
"61a68c15e6ee63e39eadcf3c00cbe4f6e6ba60af502269dc4e809353b20bba53"
"1df85e151c7597d9ad1530658e555a73c4be0ab7e4a8b3289a2baaad9887e596"
"60eaa7f7c2db1b973ca192f35420ea44fee40b9e38d12e70b2626102e339ce81"
"9a48b3cbb95387676d8b8df130ed6d2a8d429f1def3cbd36ffdeb13a889157e2"
"3fa3c0276b0515d091aeedbc66de7eced17ab3de2c15927e4e58f9e8b1da4bc1"
"839a6bd073edf1e9c9ffac38d450f8c7705206c8aff462864147d79ad57f6f50"

"fbcdf407c691d046fcb4dedef0e694d1cc6d1ff9110b6c498d0c93b81b728216"
"6dafc220be28efa084399a4bec6d17411c8ddfc349da91899d13a154a6cf06b2"
"d88f3dc4598b251dff1f6366f126e80916139d437802438ecab063c1e0e6ee0f"
"4fcf90b7351c561ffcf1f5ae87a22fb4dda71a079724a7b17c68f01a2c104ba4"
"0dfe80cd395b43154aabb5877f65f3484b5a34858bdd9c3527a5f83243b4d17d"
"e66f722aa08c67a3e6cd5de682dcd3214580be15bff0f1af33a0f65cc64c04b4"
"bf134667b9de5148d834170df27d005e8d032b6d60a5e721da5121d3181f2ee6"
"53b6df3fb7da5a375353f1cb20efcfe323c98776a989f1411ca70e2324b9ead4"
"feb48a1bd224fe9dcfffedb6269680b99bf71cc9ba7193d5095816578786420c"
"a7ff450988d977af51cc0c05ec0af26a8edc72751c0a1dca3f5790bda74b8631"
"71537baca4ed69556a799474bc98bf58428126ea6d41ffcbca2889f69a4f6d5f"
"ac94ead24a5ecfc9462b09ef647ac036333c856391571e9071e3263f1232dd71"
"d9d0182d372345a9e0b7df1e18da29aed6420edc9f948e7ffc2e8e66200db513"
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
	egz "${srcdir}/rocm-core_5.2.3.50203-109_amd64.deb"
	egz "${srcdir}/comgr_2.4.0.50203-109_amd64.deb"
	egz "${srcdir}/hip-dev_5.2.21153.50203-109_amd64.deb"
	egz "${srcdir}/hip-doc_5.2.21153.50203-109_amd64.deb"
	egz "${srcdir}/hip-samples_5.2.21153.50203-109_amd64.deb"
	egz "${srcdir}/hsakmt-roct-dev_20220426.1.026.50203-109_amd64.deb"
	egz "${srcdir}/hsa-rocr_1.5.0.50203-109_amd64.deb"
	egz "${srcdir}/hsa-rocr-dev_1.5.0.50203-109_amd64.deb"
	egz "${srcdir}/rocminfo_1.0.0.50203-109_amd64.deb"
	egz "${srcdir}/hip-runtime-amd_5.2.21153.50203-109_amd64.deb"
	egz "${srcdir}/rocm-device-libs_1.0.0.50203-109_amd64.deb"
	egz "${srcdir}/rocm-language-runtime_5.2.3.50203-109_amd64.deb"
	egz "${srcdir}/rocm-hip-runtime_5.2.3.50203-109_amd64.deb"
	egz "${srcdir}/rocm-ocl-icd_2.0.0.50203-109_amd64.deb"
	egz "${srcdir}/rocm-opencl_2.0.0.50203-109_amd64.deb"
	egz "${srcdir}/rocm-opencl-dev_2.0.0.50203-109_amd64.deb"
	egz "${srcdir}/rocm-opencl-runtime_5.2.3.50203-109_amd64.deb"
	egz "${srcdir}/rocm-clang-ocl_0.5.0.50203-109_amd64.deb"
	egz "${srcdir}/rocm-smi-lib_5.0.0.50203-109_amd64.deb"
	egz "${srcdir}/rocm-cmake_0.7.3.50203-109_amd64.deb"
	egz "${srcdir}/rocm-dbgapi_0.65.1.50203-109_amd64.deb"
	egz "${srcdir}/rocm-debug-agent_2.0.3.50203-109_amd64.deb"
	egz "${srcdir}/rocm-utils_5.2.3.50203-109_amd64.deb"
	egz "${srcdir}/rocprofiler-dev_1.0.0.50203-109_amd64.deb"
	egz "${srcdir}/roctracer-dev_1.0.0.50203-109_amd64.deb"
	egz "${srcdir}/rocm-dev_5.2.3.50203-109_amd64.deb"
	egz "${srcdir}/hsa-amd-aqlprofile_1.0.0.50203-109_amd64.deb"
	exz "${srcdir}/libdrm-amdgpu-amdgpu1_2.4.110.50203-1462318~22.04_amd64.deb"
	exz "${srcdir}/openmp-extras_14.52.0.50203-109_amd64.deb"
	exz "${srcdir}/rocm-gdb_11.2.50203-109_amd64.deb"
	exz "${srcdir}/opencl-legacy-amdgpu-pro-icd_22.20-1462318~22.04_amd64.deb"

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
	ln -s "/opt/rocm-5.2.3" "$pkgdir/opt/rocm"
	#ln -s "/opt/rocm-5.2.3/hip/bin/.hipVersion" "$pkgdir/opt/rocm-5.2.3/bin/.hipVersion"

	mkdir -p "${pkgdir}/opt/amdgpu/share/libdrm"
	cd "${pkgdir}/opt/amdgpu/share/libdrm"
	ln -s /usr/share/libdrm/amdgpu.ids amdgpu.ids		

	mkdir -p ${pkgdir}/etc/OpenCL/vendors	
	echo libamdocl64.so > "${pkgdir}/etc/OpenCL/vendors/amdocl64.icd"
	echo libamdocl-orca64.so > "${pkgdir}/etc/OpenCL/vendors/amdocl-orca64.icd"

	mkdir -p ${pkgdir}/etc/ld.so.conf.d
	echo /opt/rocm-5.2.3/opencl/lib > "$pkgdir/etc/ld.so.conf.d/opencl-amd.conf"
	echo /opt/rocm-5.2.3/lib >> "$pkgdir/etc/ld.so.conf.d/opencl-amd.conf"
	echo /opt/rocm-5.2.3/hip/lib >> "$pkgdir/etc/ld.so.conf.d/opencl-amd.conf"

	mkdir -p ${pkgdir}/etc/profile.d
	echo export PATH="\${PATH}:/opt/rocm-5.2.3/bin:/opt/rocm-5.2.3/hip/bin" > "$pkgdir/etc/profile.d/opencl-amd.sh"
}
