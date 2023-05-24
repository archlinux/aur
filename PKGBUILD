# Maintainer: Carson Rueter <roachh at proton mail dot com>
# Co-Maintainer: George Sofianos

# Release notes https://docs.amd.com/bundle/ROCm-Release-Notes-v5.5.1/page/About_This_Document.html
amdgpu_repo='https://repo.radeon.com/amdgpu/5.5.1/ubuntu'
rocm_repo='https://repo.radeon.com/rocm/apt/5.5.1'
opencl_lib='opt/rocm-5.5.1/opencl/lib'
rocm_lib='opt/rocm-5.5.1/lib'
hip_lib='opt/rocm-5.5.1/hip/lib/'
amdgpu="opt/amdgpu/lib/x86_64-linux-gnu"
amdgpu_pro="opt/amdgpu-pro/lib/x86_64-linux-gnu/"

pkgname=opencl-amd
pkgdesc="ROCr OpenCL stack, supports Vega 10 and later products - Legacy OpenCL stack (Proprietary), supports legacy products older than Vega 10 - This package is intended to work along with the free amdgpu stack."            
pkgver=5.5.1
pkgrel=1
epoch=1
arch=('x86_64')
url='http://www.amd.com'
license=('custom:AMD')
makedepends=('wget')
depends=('libdrm' 'ocl-icd' 'gcc-libs' 'numactl')
provides=('opencl-driver' 'rocm-core' 'hip' 'hip-dev' 'hip-doc' 'hip-samples' 'hsakmt-roct-dev' 'hsa-rocr' 'hsa-rocr-dev' 'rocminfo' 'hip-runtime-amd' 'rocm-device-libs' 'rocm-language-runtime' 
	'rocm-hip-runtime' 'rocm-ocl-icd' 'rocm-opencl' 'rocm-opencl-dev' 'rocm-opencl-runtime' 'rocm-clang-ocl' 'rocm-dbgapi' 'rocm-debug-agent' 'rocm-gdb' 'rocprofiler' 'rocprofiler-dev' 'roctracer' 'roctracer-dev' 'hsa-amd-aqlprofile' 'openmp-extras-runtime' 'rocm-cmake' 'rocm-utils' 'rocm-smi-lib')
conflicts=('rocm-opencl-runtime' 'rocm-core' 'hip' 'hip-dev' 'hip-doc' 'hip-samples' 'hsakmt-roct-dev' 'hsa-rocr' 'hsa-rocr-dev' 'rocminfo' 'hip-runtime-amd' 'rocm-device-libs' 'rocm-language-runtime' 
	'rocm-hip-runtime' 'rocm-ocl-icd' 'rocm-opencl' 'rocm-opencl-dev' 'rocm-opencl-runtime' 'rocm-clang-ocl' 'rocm-dbgapi' 'rocm-debug-agent' 'rocm-gdb' 'rocprofiler' 'rocprofiler-dev' 'roctracer' 'roctracer-dev' 'hsa-amd-aqlprofile' 'openmp-extras-runtime' 'rocm-cmake' 'rocm-utils' 'rocm-smi-lib')
optdepends=('clinfo' 'opencl-amd-dev')

source=(
# LIBDRM
"https://repo.radeon.com/amdgpu/5.5.1/ubuntu/pool/main/libd/libdrm-amdgpu/libdrm-amdgpu-amdgpu1_2.4.114.50501-1593694.22.04_amd64.deb"
# ROCM
"https://repo.radeon.com/rocm/apt/5.5.1/pool/main/r/rocm-core/rocm-core_5.5.1.50501-74~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.5.1/pool/main/c/comgr/comgr_2.5.0.50501-74~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.5.1/pool/main/h/hip-dev/hip-dev_5.5.30202.50501-74~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.5.1/pool/main/h/hip-doc/hip-doc_5.5.30202.50501-74~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.5.1/pool/main/h/hip-samples/hip-samples_5.5.30202.50501-74~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.5.1/pool/main/h/hsakmt-roct-dev/hsakmt-roct-dev_20230131.1.695.50501-74~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.5.1/pool/main/h/hsa-rocr/hsa-rocr_1.8.0.50501-74~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.5.1/pool/main/h/hsa-rocr-dev/hsa-rocr-dev_1.8.0.50501-74~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.5.1/pool/main/r/rocminfo/rocminfo_1.0.0.50501-74~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.5.1/pool/main/h/hip-runtime-amd/hip-runtime-amd_5.5.30202.50501-74~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.5.1/pool/main/r/rocm-device-libs/rocm-device-libs_1.0.0.50501-74~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.5.1/pool/main/r/rocm-language-runtime/rocm-language-runtime_5.5.1.50501-74~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.5.1/pool/main/r/rocm-hip-runtime/rocm-hip-runtime_5.5.1.50501-74~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.5.1/pool/main/r/rocm-ocl-icd/rocm-ocl-icd_2.0.0.50501-74~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.5.1/pool/main/r/rocm-opencl/rocm-opencl_2.0.0.50501-74~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.5.1/pool/main/r/rocm-opencl-dev/rocm-opencl-dev_2.0.0.50501-74~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.5.1/pool/main/r/rocm-opencl-runtime/rocm-opencl-runtime_5.5.1.50501-74~22.04_amd64.deb"
# ROCM DEV
"https://repo.radeon.com/rocm/apt/5.5.1/pool/main/r/rocm-clang-ocl/rocm-clang-ocl_0.5.0.50501-74~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.5.1/pool/main/o/openmp-extras-runtime/openmp-extras-runtime_15.55.0.50501-74~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.5.1/pool/main/r/rocm-smi-lib/rocm-smi-lib_5.0.0.50501-74~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.5.1/pool/main/r/rocm-cmake/rocm-cmake_0.8.1.50501-74~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.5.1/pool/main/r/rocm-dbgapi/rocm-dbgapi_0.70.0.50501-74~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.5.1/pool/main/r/rocm-debug-agent/rocm-debug-agent_2.0.3.50501-74~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.5.1/pool/main/r/rocm-gdb/rocm-gdb_12.1.50501-74~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.5.1/pool/main/r/rocm-utils/rocm-utils_5.5.1.50501-74~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.5.1/pool/main/r/rocprofiler/rocprofiler_2.0.0.50501-74~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.5.1/pool/main/r/rocprofiler-dev/rocprofiler-dev_2.0.0.50501-74~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.5.1/pool/main/r/roctracer/roctracer_4.1.0.50501-74~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.5.1/pool/main/r/roctracer-dev/roctracer-dev_4.1.0.50501-74~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.5.1/pool/main/r/rocm-dev/rocm-dev_5.5.1.50501-74~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.5.1/pool/main/h/hsa-amd-aqlprofile/hsa-amd-aqlprofile_1.0.0.50501-74~22.04_amd64.deb"
# Proprietary
#"https://repo.radeon.com/amdgpu/5.5.1/ubuntu/pool/proprietary/o/opencl-legacy-amdgpu-pro/opencl-legacy-amdgpu-pro-icd_22.40-1538781.22.04_amd64.deb"
#"https://repo.radeon.com/amdgpu/22.20.3/ubuntu/pool/proprietary/c/clinfo-amdgpu-pro/clinfo-amdgpu-pro_22.10-1462318~22.04_amd64.deb"
#"https://repo.radeon.com/amdgpu/22.20.3/ubuntu/pool/proprietary/o/ocl-icd-amdgpu-pro/ocl-icd-libopencl1-amdgpu-pro_22.10-1462318~22.04_amd64.deb"
#"https://repo.radeon.com/amdgpu/22.20.3/ubuntu/pool/proprietary/a/amf-amdgpu-pro/amf-amdgpu-pro_1.4.24-1462318~22.04_amd64.deb"
)

sha256sums=(
"21cfac9815e2cda7b56932c8aba5dbc1e4f24ab04e46b0d6935d7a2d9531c8a6"

"440d5cc32656d892d2f5cfaef2f87c094f50faee44eeedf0dcafa619a8fd5c8f"
"47dcc0a2d3ef9ec49d87eb74f80ee704d14047cc89b8a7e4a002762ccf21a157"
"44041b9fdc2331a6e99dfdf906359d5c63a805a2d13fb6cb035498a76a0d3872"
"3545c3f7a4ce4076787464112b9159d742bf940ea76f4ff61e469c240167142c"
"b9a37cc3068228ba19598a17a036dab2b1ab89914773d26a1c5a230fb7560405"
"19d1a25fa3b19717200b401f5aba37d3728ad371ff0016ecb195d4d8b5e33d6a"
"b3bda8790f164a011f7bddff2d62ce2d381e7186c07a94da64b4a32a275a9181"
"b3134a95667a3992ac3501598b84b2cf6f42167d520de0017a0cc4befca0623d"
"f22d0e462d95cbb2f8c32b8579c5392a8fdc7dabeb108c9eb586b8fe9ab222bf"
"59a3d4c45a844e579ae5ef3803efcb327847829c8300d14a98a6627cb52a9546"
"b6a3592f4bf55b61ecc1c1ef11a66862848cfde65365af83c0d187be96c799f6"
"82b63c6036515842977da338119ba51980c2f9d8cdca78578cbe4d08dae7eab3"
"6ebcd89c3f6dad35b3accadb940b5e3d32596ca0681f1d9613cd70592ccbda58"
"a090119d20ec60f37d0bb1e4adc03fa10b9e3a0a016f6ba4eae876267c28d665"
"554d7d4de135dc722d1fd5fcf6a7d71666cf3d522e736a50517acec5f0e92398"
"4610c12e2502a98aff4009ac9b919980b7c0defbad102e6aeca6184f9581dff8"
"17aecd42597e9747543442ca05cc27765ffb8519f2b03ecd2a49f0295a42a9e6"

"36b2ab195bd4db19006db6e730911c028ce087b2bd34b0c9a66070b8d92b3e9f"
"0c1c5cfebcae15c79465f38c0eff705650295d15df2cf60ac164b566cc5c086e"
"f48ecab6e91303f47b789a9f261fbce956d686a51a5f5e5f55a4e843c8d73564"
"437400c329eddfa98339e332a229a823278ba3cf814f3677d9b3ef235c2ec2fc"
"7880b50a31ffaff95005ec5c30742411051497ba0b50c73c436d1bf638c9c7b6"
"655036da7e4748ac5b6656b7f6d5b60e9f72bde227fc81e97839ea8525798cf7"
"59c59021211124e5b3f2fbea4ccd89ca2b82c79ca167e780b88fa8995b0d9f97"
"f1b2fded6b5e1bf465f8188694b70fcf40e481a80c0c5bf418e568c29573697d"
"0a29f2676b617652a98e715b4a22a53071298d94400ce447c7a200d06908b7cb"
"9db62acaad8103613458c6dade1d65581da4c80328770ee4bb5c5db8e9975775"
"7e23ca5499774f7794abfc1dd74c72f46d8175f506c1d72706f90b5eee0983a0"
"41c98563ac5ff515f5fd74627b547b1864ba07481bdf58d6dfab0af60065058f"
"5b1e78e3ee2d19ca73b5222a5fe87b5cfe8096da05d7fe59a9d9ed48aa192463"
"c87bd5d9032d88966ba44a46bd5814d037b5962a99a17fe42131f78b89eb8aec"
# Proprietary
#"ecd6fc900fe8d8b1c57e57c6e141230d9ea0584fe9a41234595c1eff850bfd14"
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
	egz "${srcdir}/rocm-core_5.5.1.50501-74~22.04_amd64.deb"
	egz "${srcdir}/comgr_2.5.0.50501-74~22.04_amd64.deb"
	egz "${srcdir}/hip-dev_5.5.30202.50501-74~22.04_amd64.deb"
	egz "${srcdir}/hip-doc_5.5.30202.50501-74~22.04_amd64.deb"
	egz "${srcdir}/hip-samples_5.5.30202.50501-74~22.04_amd64.deb"
	egz "${srcdir}/hsakmt-roct-dev_20230131.1.695.50501-74~22.04_amd64.deb"
	egz "${srcdir}/hsa-rocr_1.8.0.50501-74~22.04_amd64.deb"
	egz "${srcdir}/hsa-rocr-dev_1.8.0.50501-74~22.04_amd64.deb"
	egz "${srcdir}/rocminfo_1.0.0.50501-74~22.04_amd64.deb"
	egz "${srcdir}/hip-runtime-amd_5.5.30202.50501-74~22.04_amd64.deb"
	egz "${srcdir}/rocm-device-libs_1.0.0.50501-74~22.04_amd64.deb"
	egz "${srcdir}/rocm-language-runtime_5.5.1.50501-74~22.04_amd64.deb"
	egz "${srcdir}/rocm-hip-runtime_5.5.1.50501-74~22.04_amd64.deb"
	egz "${srcdir}/rocm-ocl-icd_2.0.0.50501-74~22.04_amd64.deb"
	egz "${srcdir}/rocm-opencl_2.0.0.50501-74~22.04_amd64.deb"
	egz "${srcdir}/rocm-opencl-dev_2.0.0.50501-74~22.04_amd64.deb"
	egz "${srcdir}/rocm-opencl-runtime_5.5.1.50501-74~22.04_amd64.deb"
	exz "${srcdir}/rocm-clang-ocl_0.5.0.50501-74~22.04_amd64.deb"
	egz "${srcdir}/rocm-smi-lib_5.0.0.50501-74~22.04_amd64.deb"
	exz "${srcdir}/rocm-cmake_0.8.1.50501-74~22.04_amd64.deb"
	egz "${srcdir}/rocm-dbgapi_0.70.0.50501-74~22.04_amd64.deb"
	egz "${srcdir}/rocm-debug-agent_2.0.3.50501-74~22.04_amd64.deb"
	egz "${srcdir}/rocm-utils_5.5.1.50501-74~22.04_amd64.deb"
	egz "${srcdir}/rocprofiler_2.0.0.50501-74~22.04_amd64.deb"
	egz "${srcdir}/rocprofiler-dev_2.0.0.50501-74~22.04_amd64.deb"
	egz "${srcdir}/roctracer_4.1.0.50501-74~22.04_amd64.deb"
	egz "${srcdir}/roctracer-dev_4.1.0.50501-74~22.04_amd64.deb"
	egz "${srcdir}/rocm-dev_5.5.1.50501-74~22.04_amd64.deb"
	egz "${srcdir}/hsa-amd-aqlprofile_1.0.0.50501-74~22.04_amd64.deb"
	exz "${srcdir}/libdrm-amdgpu-amdgpu1_2.4.114.50501-1593694.22.04_amd64.deb"
	egz "${srcdir}/openmp-extras-runtime_15.55.0.50501-74~22.04_amd64.deb"
	egz "${srcdir}/rocm-gdb_12.1.50501-74~22.04_amd64.deb"
	#exz "${srcdir}/opencl-legacy-amdgpu-pro-icd_22.40-1538781.22.04_amd64.deb"

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
	ln -s "/opt/rocm-5.5.1" "$pkgdir/opt/rocm"
	#ln -s "/opt/rocm-5.5.1/hip/bin/.hipVersion" "$pkgdir/opt/rocm-5.5.1/bin/.hipVersion"

	mkdir -p "${pkgdir}/opt/amdgpu/share/libdrm"
	cd "${pkgdir}/opt/amdgpu/share/libdrm"
	ln -s /usr/share/libdrm/amdgpu.ids amdgpu.ids		

	mkdir -p ${pkgdir}/etc/OpenCL/vendors	
	echo libamdocl64.so > "${pkgdir}/etc/OpenCL/vendors/amdocl64.icd"
	echo libamdocl-orca64.so > "${pkgdir}/etc/OpenCL/vendors/amdocl-orca64.icd"

	mkdir -p ${pkgdir}/etc/ld.so.conf.d
	echo /opt/rocm-5.5.1/opencl/lib > "$pkgdir/etc/ld.so.conf.d/opencl-amd.conf"
	echo /opt/rocm-5.5.1/lib >> "$pkgdir/etc/ld.so.conf.d/opencl-amd.conf"
	echo /opt/rocm-5.5.1/hip/lib >> "$pkgdir/etc/ld.so.conf.d/opencl-amd.conf"

	mkdir -p ${pkgdir}/etc/profile.d
	echo export PATH="\${PATH}:/opt/rocm-5.5.1/bin:/opt/rocm-5.5.1/hip/bin" > "$pkgdir/etc/profile.d/opencl-amd.sh"
}
