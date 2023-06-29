# Maintainer: Carson Rueter <roachh at proton mail dot com>
# Co-Maintainer: George Sofianos

# Release notes https://rocm.docs.amd.com/en/latest/CHANGELOG.html#rocm-5-6-0
amdgpu_repo='https://repo.radeon.com/amdgpu/5.6/ubuntu'
rocm_repo='https://repo.radeon.com/rocm/apt/5.6'
opencl_lib='opt/rocm-5.6.0/opencl/lib'
rocm_lib='opt/rocm-5.6.0/lib'
hip_lib='opt/rocm-5.6.0/hip/lib/'
amdgpu="opt/amdgpu/lib/x86_64-linux-gnu"
amdgpu_pro="opt/amdgpu-pro/lib/x86_64-linux-gnu/"

pkgname=opencl-amd
pkgdesc="ROCr OpenCL stack, supports Vega 10 and later products - Legacy OpenCL stack (Proprietary), supports legacy products older than Vega 10 - This package is intended to work along with the free amdgpu stack."            
pkgver=5.6.0
pkgrel=2
epoch=1
arch=('x86_64')
url='http://www.amd.com'
license=('custom:AMD')
makedepends=('wget')
depends=('libdrm' 'ocl-icd' 'gcc-libs' 'numactl')
provides=('opencl-driver' 'rocm-core' 'hip' 'hip-dev' 'hip-doc' 'hip-samples' 'hsakmt-roct-dev' 'hsa-rocr' 'hsa-rocr-dev' 'rocminfo' 'hip-runtime-amd' 'rocm-device-libs' 'rocm-language-runtime' 
	'rocm-hip-runtime' 'rocm-ocl-icd' 'rocm-opencl' 'rocm-opencl-dev' 'rocm-opencl-runtime' 'rocm-clang-ocl' 'rocm-dbgapi' 'rocm-debug-agent' 'rocm-gdb' 'rocprofiler' 'rocprofiler-dev' 'roctracer' 'roctracer-dev' 'hsa-amd-aqlprofile' 'openmp-extras-runtime' 'rocm-cmake' 'rocm-utils' 'rocm-smi-lib')
conflicts=('rocm-opencl-runtime' 'rocm-core' 'hip' 'hipcc' 'hip-dev' 'hip-doc' 'hip-samples' 'hsakmt-roct-dev' 'hsa-rocr' 'hsa-rocr-dev' 'rocminfo' 'hip-runtime-amd' 'rocm-device-libs' 'rocm-language-runtime' 
	'rocm-hip-runtime' 'rocm-ocl-icd' 'rocm-opencl' 'rocm-opencl-dev' 'rocm-opencl-runtime' 'rocm-clang-ocl' 'rocm-dbgapi' 'rocm-debug-agent' 'rocm-gdb' 'rocprofiler' 'rocprofiler-dev' 'roctracer' 'roctracer-dev' 'hsa-amd-aqlprofile' 'openmp-extras-runtime' 'rocm-cmake' 'rocm-utils' 'rocm-smi-lib')
optdepends=('clinfo' 'opencl-amd-dev')

source=(
# LIBDRM
"https://repo.radeon.com/amdgpu/5.6/ubuntu/pool/main/libd/libdrm-amdgpu/libdrm-amdgpu-amdgpu1_2.4.115.50600-1609671.22.04_amd64.deb"
# ROCM
"https://repo.radeon.com/rocm/apt/5.6/pool/main/r/rocm-core/rocm-core_5.6.0.50600-67~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.6/pool/main/c/comgr/comgr_2.5.0.50600-67~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.6/pool/main/h/hipcc/hipcc_1.0.0.50600-67~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.6/pool/main/h/hip-dev/hip-dev_5.6.31061.50600-67~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.6/pool/main/h/hip-doc/hip-doc_5.6.31061.50600-67~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.6/pool/main/h/hip-samples/hip-samples_5.6.31061.50600-67~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.6/pool/main/h/hsakmt-roct-dev/hsakmt-roct-dev_20230421.1.8.50600-67~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.6/pool/main/h/hsa-rocr/hsa-rocr_1.9.0.50600-67~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.6/pool/main/h/hsa-rocr-dev/hsa-rocr-dev_1.9.0.50600-67~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.6/pool/main/r/rocminfo/rocminfo_1.0.0.50600-67~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.6/pool/main/h/hip-runtime-amd/hip-runtime-amd_5.6.31061.50600-67~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.6/pool/main/r/rocm-device-libs/rocm-device-libs_1.0.0.50600-67~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.6/pool/main/r/rocm-language-runtime/rocm-language-runtime_5.6.0.50600-67~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.6/pool/main/r/rocm-hip-runtime/rocm-hip-runtime_5.6.0.50600-67~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.6/pool/main/r/rocm-ocl-icd/rocm-ocl-icd_2.0.0.50600-67~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.6/pool/main/r/rocm-opencl/rocm-opencl_2.0.0.50600-67~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.6/pool/main/r/rocm-opencl-dev/rocm-opencl-dev_2.0.0.50600-67~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.6/pool/main/r/rocm-opencl-runtime/rocm-opencl-runtime_5.6.0.50600-67~22.04_amd64.deb"
# ROCM DEV
"https://repo.radeon.com/rocm/apt/5.6/pool/main/r/rocm-clang-ocl/rocm-clang-ocl_0.5.0.50600-67~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.6/pool/main/o/openmp-extras-runtime/openmp-extras-runtime_16.56.0.50600-67~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.6/pool/main/r/rocm-smi-lib/rocm-smi-lib_5.0.0.50600-67~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.6/pool/main/r/rocm-cmake/rocm-cmake_0.9.0.50600-67~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.6/pool/main/r/rocm-dbgapi/rocm-dbgapi_0.70.1.50600-67~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.6/pool/main/r/rocm-debug-agent/rocm-debug-agent_2.0.3.50600-67~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.6/pool/main/r/rocm-gdb/rocm-gdb_13.1.50600-67~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.6/pool/main/r/rocm-utils/rocm-utils_5.6.0.50600-67~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.6/pool/main/r/rocprofiler/rocprofiler_2.0.0.50600-67~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.6/pool/main/r/rocprofiler-dev/rocprofiler-dev_2.0.0.50600-67~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.6/pool/main/r/roctracer/roctracer_4.1.0.50600-67~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.6/pool/main/r/roctracer-dev/roctracer-dev_4.1.0.50600-67~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.6/pool/main/r/rocm-dev/rocm-dev_5.6.0.50600-67~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.6/pool/main/h/hsa-amd-aqlprofile/hsa-amd-aqlprofile_1.0.0.50600-67~22.04_amd64.deb"
# Proprietary
"https://repo.radeon.com/amdgpu/5.5.2/ubuntu/pool/proprietary/o/opencl-legacy-amdgpu-pro/opencl-legacy-amdgpu-pro-icd_23.10-1610704.22.04_amd64.deb"
#"https://repo.radeon.com/amdgpu/22.20.3/ubuntu/pool/proprietary/c/clinfo-amdgpu-pro/clinfo-amdgpu-pro_22.10-1462318~22.04_amd64.deb"
#"https://repo.radeon.com/amdgpu/22.20.3/ubuntu/pool/proprietary/o/ocl-icd-amdgpu-pro/ocl-icd-libopencl1-amdgpu-pro_22.10-1462318~22.04_amd64.deb"
#"https://repo.radeon.com/amdgpu/22.20.3/ubuntu/pool/proprietary/a/amf-amdgpu-pro/amf-amdgpu-pro_1.4.24-1462318~22.04_amd64.deb"
)

sha256sums=(
"e2d243c68a41aebd3fd3fae6c34c3328fc9bdbce4d21154173a31c4c90a40ebc"

"b3aa409ca50633a733c9f4a241320c7b87307a2d57e6aa6729d1b3ffefbc8a7a"
"c37f779b02789ab8b8175fad4ba759c40010bb7cfdaf653c9918c21523db067e"
"34e9b10bd79f6c15b5b540a5ebad335cdfba0e862b204e77a32210bf43e58a2a"
"27a243bdfbc7a070f41cb019d59b3c92d3422817a4faf41054dfebd6125696fd"
"086027a9bfdd955050b1b1fad9724fd5218548f7f7f94cb56550b138d9043e83"
"94e0057411b70913c688a8f64e2df6254d3e46947beb5f6e5396188f65be9858"
"693446c81671dd05378e4a0dc405a0a4cc0cd9a4bca27cb53cf987f6eee1de29"
"277b1da60c680fb6a07b739a6da3ea1a38bbd92ac4266787dd89919be0a0fa84"
"2471706e131a73e652a384e865a67d1bbd9de40155b55bf3ef277c6253cb9968"
"db6756e396b2fcd6a5d75317c14db6c908b293b9bfae16c7795ad80d385e149b"
"9e57ddd1ad79bb8932745ea83b5ee03df34aa16f13a339a7766ac106f9ba2ab4"
"6e34a23e984db51d453729492acc0f487de487505e9e609eaa3015004d1294a2"
"985ae3a8bee21bce52890f7298aa6375b3f9c695ea4bf0e0da5cd3785f7eda32"
"ea4652620501b88b832abf2604fe7158b728a879014cd840b4e2a6da4505a82d"
"5f4f336f32dd11cedc220e56515c4dbd2d73c2804ffbfb5bf168b270903072fe"
"5c972e1740157680aa0c1c4103593153c854f50006de9ad9549e4a5a6e35ce92"
"0fc46cbffa5879896291574271a4963bfaf91db54e6cca6038cb2185880b2fa0"
"1387bfee2a494f9913e0635a55a4a1857e2337494b680f85d67c2c140edb77bd"

"288074466786737fa531a3f5f04a8cb08bd96f8b042d8e91339e87295b24c969"
"212a580114f0dd432e20e4211ee0d0e0797073c0c65e486a12f1f273d1519d09"
"96e89acfd7313b7cc6abe17a19ec14830afaf6c1ce5b9659cdc91ed55c340937"
"2227fcee29bc287350c4a720c6927fb36e982232044e5707faaba0c872e3fb28"
"b11c84665f5a2c05240b6fdad95b106bf9e0d7da7059d0bd329e58df41ff5ed1"
"97ac95f9e18d5e7cf789cea34f0393f1f19d212b4123867faaf6b60e5480ad44"
"6c09a6d5bd05571377e4edaf4a8a42833f41fd4b9f9daa559199d15db86e6b86"
"0f1cf3539b034cc9e49a6980fa42457977f2503027468757bea22094ab937291"
"cf61545315754f0f7413c38500b453015c35659d24af7080a9432350fc8ced71"
"18474e48bfdf5306d7f3b0d80e3a12e6d555fce5dd8a2f179d20690e04e01831"
"5d62bd2b34bff735d128d9bd17752f95991e7a0f7f752d22841e8a7762b300bc"
"691bdf7b435dcb8536436ff4d0afdf82c7b54c60111b6b65fea4fb9cbf2038ef"
"02ea170a8699904c6b44360c97a2d1a17ba091bd3219f200aa51951629f3276d"
"bd2d5046a555fbda04c3b12c1bce0e5aac02243aa0c7f4242d65b28b5c82f17a"
# Proprietary
"04e9227c8f5d7fb64f551608b2c2553c60d651d14dbe7579cb413317d91b7648"
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
	egz "${srcdir}/rocm-core_5.6.0.50600-67~22.04_amd64.deb"
	egz "${srcdir}/comgr_2.5.0.50600-67~22.04_amd64.deb"
	egz "${srcdir}/hipcc_1.0.0.50600-67~22.04_amd64.deb"
	egz "${srcdir}/hip-dev_5.6.31061.50600-67~22.04_amd64.deb"
	egz "${srcdir}/hip-doc_5.6.31061.50600-67~22.04_amd64.deb"
	egz "${srcdir}/hip-samples_5.6.31061.50600-67~22.04_amd64.deb"
	egz "${srcdir}/hsakmt-roct-dev_20230421.1.8.50600-67~22.04_amd64.deb"
	egz "${srcdir}/hsa-rocr_1.9.0.50600-67~22.04_amd64.deb"
	egz "${srcdir}/hsa-rocr-dev_1.9.0.50600-67~22.04_amd64.deb"
	egz "${srcdir}/rocminfo_1.0.0.50600-67~22.04_amd64.deb"
	egz "${srcdir}/hip-runtime-amd_5.6.31061.50600-67~22.04_amd64.deb"
	egz "${srcdir}/rocm-device-libs_1.0.0.50600-67~22.04_amd64.deb"
	egz "${srcdir}/rocm-language-runtime_5.6.0.50600-67~22.04_amd64.deb"
	egz "${srcdir}/rocm-hip-runtime_5.6.0.50600-67~22.04_amd64.deb"
	egz "${srcdir}/rocm-ocl-icd_2.0.0.50600-67~22.04_amd64.deb"
	egz "${srcdir}/rocm-opencl_2.0.0.50600-67~22.04_amd64.deb"
	egz "${srcdir}/rocm-opencl-dev_2.0.0.50600-67~22.04_amd64.deb"
	egz "${srcdir}/rocm-opencl-runtime_5.6.0.50600-67~22.04_amd64.deb"
	exz "${srcdir}/rocm-clang-ocl_0.5.0.50600-67~22.04_amd64.deb"
	egz "${srcdir}/rocm-smi-lib_5.0.0.50600-67~22.04_amd64.deb"
	exz "${srcdir}/rocm-cmake_0.9.0.50600-67~22.04_amd64.deb"
	egz "${srcdir}/rocm-dbgapi_0.70.1.50600-67~22.04_amd64.deb"
	egz "${srcdir}/rocm-debug-agent_2.0.3.50600-67~22.04_amd64.deb"
	egz "${srcdir}/rocm-utils_5.6.0.50600-67~22.04_amd64.deb"
	egz "${srcdir}/rocprofiler_2.0.0.50600-67~22.04_amd64.deb"
	egz "${srcdir}/rocprofiler-dev_2.0.0.50600-67~22.04_amd64.deb"
	egz "${srcdir}/roctracer_4.1.0.50600-67~22.04_amd64.deb"
	egz "${srcdir}/roctracer-dev_4.1.0.50600-67~22.04_amd64.deb"
	egz "${srcdir}/rocm-dev_5.6.0.50600-67~22.04_amd64.deb"
	egz "${srcdir}/hsa-amd-aqlprofile_1.0.0.50600-67~22.04_amd64.deb"
	exz "${srcdir}/libdrm-amdgpu-amdgpu1_2.4.115.50600-1609671.22.04_amd64.deb"
	egz "${srcdir}/openmp-extras-runtime_16.56.0.50600-67~22.04_amd64.deb"
	egz "${srcdir}/rocm-gdb_13.1.50600-67~22.04_amd64.deb"
	exz "${srcdir}/opencl-legacy-amdgpu-pro-icd_23.10-1610704.22.04_amd64.deb"

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
	ln -s "/opt/rocm-5.6.0" "$pkgdir/opt/rocm"
	#ln -s "/opt/rocm-5.6.0/hip/bin/.hipVersion" "$pkgdir/opt/rocm-5.6.0/bin/.hipVersion"

	mkdir -p "${pkgdir}/opt/amdgpu/share/libdrm"
	cd "${pkgdir}/opt/amdgpu/share/libdrm"
	ln -s /usr/share/libdrm/amdgpu.ids amdgpu.ids		

	mkdir -p ${pkgdir}/etc/OpenCL/vendors	
	echo libamdocl64.so > "${pkgdir}/etc/OpenCL/vendors/amdocl64.icd"
	echo libamdocl-orca64.so > "${pkgdir}/etc/OpenCL/vendors/amdocl-orca64.icd"

	mkdir -p ${pkgdir}/etc/ld.so.conf.d
	echo /opt/rocm-5.6.0/opencl/lib > "$pkgdir/etc/ld.so.conf.d/opencl-amd.conf"
	echo /opt/rocm-5.6.0/lib >> "$pkgdir/etc/ld.so.conf.d/opencl-amd.conf"
	echo /opt/rocm-5.6.0/hip/lib >> "$pkgdir/etc/ld.so.conf.d/opencl-amd.conf"

	mkdir -p ${pkgdir}/etc/profile.d
	echo export PATH="\${PATH}:/opt/rocm-5.6.0/bin:/opt/rocm-5.6.0/hip/bin" > "$pkgdir/etc/profile.d/opencl-amd.sh"
}
