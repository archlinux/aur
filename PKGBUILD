# Maintainer: Carson Rueter <roachh at proton mail dot com>
# Co-Maintainer: George Sofianos

# Release notes https://rocm.docs.amd.com/en/latest/about/release-notes.html
amdgpu_repo='https://repo.radeon.com/amdgpu/6.2/ubuntu'
rocm_repo='https://repo.radeon.com/rocm/apt/6.2'
opencl_lib='opt/rocm-6.2.0/opencl/lib'
rocm_lib='opt/rocm-6.2.0/lib'
hip_lib='opt/rocm-6.2.0/hip/lib/'
amdgpu="opt/amdgpu/lib/x86_64-linux-gnu"
amdgpu_pro="opt/amdgpu-pro/lib/x86_64-linux-gnu/"

pkgname=opencl-amd
pkgdesc="ROCm components repackaged from AMD's Ubuntu releases (ROCr runtime, ROCm runtime, HIP runtime) - This package is intended to work along with the free amdgpu stack."
pkgver=6.2.0
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
"https://repo.radeon.com/amdgpu/6.2/ubuntu/pool/main/libd/libdrm-amdgpu/libdrm-amdgpu-amdgpu1_2.4.120.60200-2009582.24.04_amd64.deb"
# ROCM
"https://repo.radeon.com/rocm/apt/6.2/pool/main/r/rocm-core/rocm-core_6.2.0.60200-66~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2/pool/main/c/comgr/comgr_2.8.0.60200-66~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2/pool/main/h/hipcc/hipcc_1.1.1.60200-66~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2/pool/main/h/hip-dev/hip-dev_6.2.41133.60200-66~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2/pool/main/h/hip-doc/hip-doc_6.2.41133.60200-66~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2/pool/main/h/hip-samples/hip-samples_6.2.41133.60200-66~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2/pool/main/h/hsakmt-roct-dev/hsakmt-roct-dev_20240607.3.8.60200-66~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2/pool/main/h/hsa-rocr/hsa-rocr_1.14.0.60200-66~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2/pool/main/h/hsa-rocr-dev/hsa-rocr-dev_1.14.0.60200-66~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2/pool/main/r/rocminfo/rocminfo_1.0.0.60200-66~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2/pool/main/h/hip-runtime-amd/hip-runtime-amd_6.2.41133.60200-66~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2/pool/main/r/rocm-device-libs/rocm-device-libs_1.0.0.60200-66~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2/pool/main/r/rocm-language-runtime/rocm-language-runtime_6.2.0.60200-66~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2/pool/main/r/rocm-hip-runtime/rocm-hip-runtime_6.2.0.60200-66~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2/pool/main/r/rocdecode/rocdecode_0.6.0.60200-66~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2/pool/main/r/rocdecode-dev/rocdecode-dev_0.6.0.60200-66~24.04_amd64.deb"
#"https://repo.radeon.com/rocm/apt/6.2/pool/main/r/rocm-ocl-icd/rocm-ocl-icd_2.0.0.60200-66~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2/pool/main/r/rocm-opencl-icd-loader/rocm-opencl-icd-loader_1.2.60200-66~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2/pool/main/r/rocm-opencl/rocm-opencl_2.0.0.60200-66~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2/pool/main/r/rocm-opencl-dev/rocm-opencl-dev_2.0.0.60200-66~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2/pool/main/r/rocm-opencl-runtime/rocm-opencl-runtime_6.2.0.60200-66~24.04_amd64.deb"
# ROCM DEV
#"https://repo.radeon.com/rocm/apt/6.2/pool/main/r/rocm-clang-ocl/rocm-clang-ocl_0.5.0.60200-66~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2/pool/main/o/openmp-extras-runtime/openmp-extras-runtime_18.62.0.60200-66~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2/pool/main/r/rocm-smi-lib/rocm-smi-lib_7.3.0.60200-66~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2/pool/main/a/amd-smi-lib/amd-smi-lib_24.6.2.60200-66~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2/pool/main/r/rocm-cmake/rocm-cmake_0.13.0.60200-66~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2/pool/main/r/rocm-dbgapi/rocm-dbgapi_0.76.0.60200-66~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2/pool/main/r/rocm-debug-agent/rocm-debug-agent_2.0.3.60200-66~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2/pool/main/r/rocm-gdb/rocm-gdb_14.2.60200-66~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2/pool/main/r/rocm-utils/rocm-utils_6.2.0.60200-66~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2/pool/main/r/rocprofiler/rocprofiler_2.0.60200.60200-66~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2/pool/main/r/rocprofiler-dev/rocprofiler-dev_2.0.60200.60200-66~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2/pool/main/r/rocprofiler-plugins/rocprofiler-plugins_2.0.60200.60200-66~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2/pool/main/r/rocprofiler-register/rocprofiler-register_0.4.0.60200-66~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2/pool/main/r/roctracer/roctracer_4.1.60200.60200-66~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2/pool/main/r/roctracer-dev/roctracer-dev_4.1.60200.60200-66~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2/pool/main/r/rocm-dev/rocm-dev_6.2.0.60200-66~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2/pool/main/h/hsa-amd-aqlprofile/hsa-amd-aqlprofile_1.0.0.60200.60200-66~24.04_amd64.deb"
# Proprietary
"https://repo.radeon.com/amdgpu/5.7.1/ubuntu/pool/proprietary/o/opencl-legacy-amdgpu-pro/opencl-legacy-amdgpu-pro-icd_23.20-1664987.22.04_amd64.deb"
)

sha256sums=(
"f006070d52f252a8dd7c57da495cb1607a58c8c4a54e2dedb47235798b9b203c"

"af5fcbe8dc2b6cbec30e2d39d30736e8a47a0b9d0ca2be7f179f2947f9c98245"
"9124a99760ce686c4e63638b1cfc27ed5608da8f962162b99da2d09f2a160b15"
"4f68a5d1f2b486f934d8f3c5287f6c1dccb954ab50b5b3875598af1c6e21ffdc"
"cda72054d2011dbb062e75386766d928fd8905c15c88685c3ef87fc963bd88ad"
"d30d0865c06d45df262b229acd8b5c67e63797b62080a1a8dd012009c5480699"
"8314a805906049ad2b5ce3401943a10c0b01de1dc1c9083462cd772572b75eb2"
"ffcbcdd5c5b34d103f57024ada7cb6d2600d675846ce4e399e4d24989977ef2d"
"67684cf24656ca6ed2c9cd8b47622a734fe888b3036873232c264c65217371aa"
"887db1dbaf2f19d7d524af8b71bb72263974fbf3a7492f83230045fe1211d013"
"02206d1f06ca2c2122a78015dd3d9df129f2d5707fffe6027779836389a9b492"
"eb514d0d18ff4b2f048d489fe7e20f1a8cc1c38fdc07a68da6a771ad0970995a"
"e4667a6815dc9e8af5983992cbe88cf4ffe4fcab1b4a2dd811978d03c489b576"
"a7f1d17bff6bbc559df257ba655fe217e6cb1e5a219b2a0d09675a1225d7f32a"
"d76ee2c23d9d648e294c4e343e308601526afe8b7407e720cdfae3782f122d62"
"4372e216894812d549cde9f6a92572f45246b150ddb18cf2f3298f992f724339"
"dc96ae5c75c2993dbb41e6a46c4e179f9baf3434e69475d3ec08cf77e3f3f148"
"958bc438439b2fc70723de55e4bd99a5bc26de2e9ff5bd0b6339870278ec8870"
"55d3707ff3061cc04bad581a651ec324bef4939da21efcc6bbba7408dde58123"
"6ea028bebfc7842be87d90cd08bcf6d8dc898f1bee061ad6423447afcc9d4f59"
"650002a8429e0212dabf67341999386aaa66054d787b737192d9e1bf4fa32991"

#"c2716b32f35eb79d3d1f2d2ade4fcdefdef57437593c130f3e552532e041f077"
"78a2c949f1d6d59e3f44d401febce95f1787dda0e4f379b12335755532a3a131"
"2eaa9917c92765820d1b1db4f10c1a804f27084c17659ab057477b07aac4bf1b"
"951a7f0deb568bfc4862d33117bf767af7654324413b0eafd6a6dbc98801d199"
"21eebd42c05357337bb88e3c0774d5ceef0885e3da4c4e3e2d4022c3e3fb354d"
"550edfb1ea04edece795792a989b7c59d9e4f3ad9cd158f2c03883e4a3b0ce09"
"bc749bdea0c7177d64768f2169d5138c90b8ee8f3888476e23ec3d89fdfeba30"
"ea25ff9d557dba2a412c03eb5e6e5cc90e077299106edb6e1be83a9ec7935323"
"25aef2075627d86a28c3459804996ee4d5675a69d6a9c32450263361a828833c"
"9f42975205c5af1af6c6328f5f4e95f193d58d054dda066c02e343b210151602"
"c9354139e907f269df094a55acb7554ffec325dfd2cc8f5b13522a9ac12a87be"
"de71d50d1629eca13d05b6deb8be5a641990365d73d2bae1bbbc45ae14e8cc34"
"a982dc506ad1515db7e2980cdbbb875ad9827b63eba57965433a75c136e14c40"
"fcd290e85d16e7067dc028c8a4998ec9648a72bfbb0099b7e19f6b088a739025"
"be3f00017159a34d9bc24d78459f79bae396f800a1ccd77fc2f6a0ed105d07eb"
"80ae80c988ad7f8641440b927b5ef3572d40420293cdad0af3026591a57d74ae"
"f0fa887137dc7428f11db42c3c65da9f63527be57145b7ef9017c8a925a3edfa"
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
	egz "${srcdir}/rocm-core_6.2.0.60200-66~24.04_amd64.deb"
	egz "${srcdir}/comgr_2.8.0.60200-66~24.04_amd64.deb"
	egz "${srcdir}/hipcc_1.1.1.60200-66~24.04_amd64.deb"
	egz "${srcdir}/hip-dev_6.2.41133.60200-66~24.04_amd64.deb"
	egz "${srcdir}/hip-doc_6.2.41133.60200-66~24.04_amd64.deb"
	egz "${srcdir}/hip-samples_6.2.41133.60200-66~24.04_amd64.deb"
	egz "${srcdir}/hsakmt-roct-dev_20240607.3.8.60200-66~24.04_amd64.deb"
	egz "${srcdir}/hsa-rocr_1.14.0.60200-66~24.04_amd64.deb"
	egz "${srcdir}/hsa-rocr-dev_1.14.0.60200-66~24.04_amd64.deb"
	egz "${srcdir}/rocminfo_1.0.0.60200-66~24.04_amd64.deb"
	egz "${srcdir}/hip-runtime-amd_6.2.41133.60200-66~24.04_amd64.deb"
	egz "${srcdir}/rocm-device-libs_1.0.0.60200-66~24.04_amd64.deb"
	egz "${srcdir}/rocm-language-runtime_6.2.0.60200-66~24.04_amd64.deb"
	egz "${srcdir}/rocm-hip-runtime_6.2.0.60200-66~24.04_amd64.deb"
	egz "${srcdir}/rocdecode_0.6.0.60200-66~24.04_amd64.deb"
	egz "${srcdir}/rocdecode-dev_0.6.0.60200-66~24.04_amd64.deb"
	#egz "${srcdir}/rocm-ocl-icd_2.0.0.60200-66~24.04_amd64.deb"
	egz "${srcdir}/rocm-opencl-icd-loader_1.2.60200-66~24.04_amd64.deb"
	egz "${srcdir}/rocm-opencl_2.0.0.60200-66~24.04_amd64.deb"
	egz "${srcdir}/rocm-opencl-dev_2.0.0.60200-66~24.04_amd64.deb"
	egz "${srcdir}/rocm-opencl-runtime_6.2.0.60200-66~24.04_amd64.deb"
	#exz "${srcdir}/rocm-clang-ocl_0.5.0.60200-66~24.04_amd64.deb"
	egz "${srcdir}/rocm-smi-lib_7.3.0.60200-66~24.04_amd64.deb"
	egz "${srcdir}/amd-smi-lib_24.6.2.60200-66~24.04_amd64.deb"
	exz "${srcdir}/rocm-cmake_0.13.0.60200-66~24.04_amd64.deb"
	egz "${srcdir}/rocm-dbgapi_0.76.0.60200-66~24.04_amd64.deb"
	egz "${srcdir}/rocm-debug-agent_2.0.3.60200-66~24.04_amd64.deb"
	egz "${srcdir}/rocm-utils_6.2.0.60200-66~24.04_amd64.deb"
	egz "${srcdir}/rocprofiler_2.0.60200.60200-66~24.04_amd64.deb"
	egz "${srcdir}/rocprofiler-dev_2.0.60200.60200-66~24.04_amd64.deb"
	egz "${srcdir}/rocprofiler-plugins_2.0.60200.60200-66~24.04_amd64.deb"
	egz "${srcdir}/rocprofiler-register_0.4.0.60200-66~24.04_amd64.deb"
	egz "${srcdir}/roctracer_4.1.60200.60200-66~24.04_amd64.deb"
	egz "${srcdir}/roctracer-dev_4.1.60200.60200-66~24.04_amd64.deb"
	egz "${srcdir}/rocm-dev_6.2.0.60200-66~24.04_amd64.deb"
	egz "${srcdir}/hsa-amd-aqlprofile_1.0.0.60200.60200-66~24.04_amd64.deb"
	exz "${srcdir}/libdrm-amdgpu-amdgpu1_2.4.120.60200-2009582.24.04_amd64.deb"
	egz "${srcdir}/openmp-extras-runtime_18.62.0.60200-66~24.04_amd64.deb"
	egz "${srcdir}/rocm-gdb_14.2.60200-66~24.04_amd64.deb"
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
	ln -s "/opt/rocm-6.2.0" "$pkgdir/opt/rocm"
	#ln -s "/opt/rocm-6.2.0/hip/bin/.hipVersion" "$pkgdir/opt/rocm-6.2.0/bin/.hipVersion"

	mkdir -p "${pkgdir}/opt/amdgpu/share/libdrm"
	cd "${pkgdir}/opt/amdgpu/share/libdrm"
	ln -s /usr/share/libdrm/amdgpu.ids amdgpu.ids		

	mkdir -p ${pkgdir}/etc/OpenCL/vendors	
	echo libamdocl64.so > "${pkgdir}/etc/OpenCL/vendors/amdocl64.icd"
	echo libamdocl-orca64.so > "${pkgdir}/etc/OpenCL/vendors/amdocl-orca64.icd"

	mkdir -p ${pkgdir}/etc/ld.so.conf.d
	echo /opt/rocm-6.2.0/opencl/lib > "$pkgdir/etc/ld.so.conf.d/opencl-amd.conf"
	echo /opt/rocm-6.2.0/lib >> "$pkgdir/etc/ld.so.conf.d/opencl-amd.conf"
	echo /opt/rocm-6.2.0/hip/lib >> "$pkgdir/etc/ld.so.conf.d/opencl-amd.conf"

	mkdir -p ${pkgdir}/etc/profile.d
	echo export PATH="\${PATH}:/opt/rocm-6.2.0/bin:/opt/rocm-6.2.0/hip/bin" > "$pkgdir/etc/profile.d/opencl-amd.sh"
}
