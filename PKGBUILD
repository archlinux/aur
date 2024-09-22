# Maintainer: Carson Rueter <roachh at proton mail dot com>
# Co-Maintainer: George Sofianos

# Release notes https://rocm.docs.amd.com/en/latest/about/release-notes.html
amdgpu_repo='https://repo.radeon.com/amdgpu/6.2.1/ubuntu'
rocm_repo='https://repo.radeon.com/rocm/apt/6.2.1'
opencl_lib='opt/rocm-6.2.1/opencl/lib'
rocm_lib='opt/rocm-6.2.1/lib'
hip_lib='opt/rocm-6.2.1/hip/lib/'
amdgpu="opt/amdgpu/lib/x86_64-linux-gnu"
amdgpu_pro="opt/amdgpu-pro/lib/x86_64-linux-gnu/"

pkgname=opencl-amd
pkgdesc="ROCm components repackaged from AMD's Ubuntu releases (ROCr runtime, ROCm runtime, HIP runtime) - This package is intended to work along with the free amdgpu stack."
pkgver=6.2.1
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
"https://repo.radeon.com/amdgpu/6.2.1/ubuntu/pool/main/libd/libdrm-amdgpu/libdrm-amdgpu-amdgpu1_2.4.120.60201-2038383.24.04_amd64.deb"
# ROCM
"https://repo.radeon.com/rocm/apt/6.2.1/pool/main/r/rocm-core/rocm-core_6.2.1.60201-112~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.1/pool/main/c/comgr/comgr_2.8.0.60201-112~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.1/pool/main/h/hipcc/hipcc_1.1.1.60201-112~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.1/pool/main/h/hip-dev/hip-dev_6.2.41134.60201-112~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.1/pool/main/h/hip-doc/hip-doc_6.2.41134.60201-112~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.1/pool/main/h/hip-samples/hip-samples_6.2.41134.60201-112~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.1/pool/main/h/hsakmt-roct-dev/hsakmt-roct-dev_20240607.4.05.60201-112~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.1/pool/main/h/hsa-rocr/hsa-rocr_1.14.0.60201-112~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.1/pool/main/h/hsa-rocr-dev/hsa-rocr-dev_1.14.0.60201-112~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.1/pool/main/r/rocminfo/rocminfo_1.0.0.60201-112~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.1/pool/main/h/hip-runtime-amd/hip-runtime-amd_6.2.41134.60201-112~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.1/pool/main/r/rocm-device-libs/rocm-device-libs_1.0.0.60201-112~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.1/pool/main/r/rocm-language-runtime/rocm-language-runtime_6.2.1.60201-112~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.1/pool/main/r/rocm-hip-runtime/rocm-hip-runtime_6.2.1.60201-112~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.1/pool/main/r/rocdecode/rocdecode_0.6.0.60201-112~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.1/pool/main/r/rocdecode-dev/rocdecode-dev_0.6.0.60201-112~24.04_amd64.deb"
#"https://repo.radeon.com/rocm/apt/6.2.1/pool/main/r/rocm-ocl-icd/rocm-ocl-icd_2.0.0.60201-112~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.1/pool/main/r/rocm-opencl-icd-loader/rocm-opencl-icd-loader_1.2.60201-112~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.1/pool/main/r/rocm-opencl/rocm-opencl_2.0.0.60201-112~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.1/pool/main/r/rocm-opencl-dev/rocm-opencl-dev_2.0.0.60201-112~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.1/pool/main/r/rocm-opencl-runtime/rocm-opencl-runtime_6.2.1.60201-112~24.04_amd64.deb"
# ROCM DEV
#"https://repo.radeon.com/rocm/apt/6.2.1/pool/main/r/rocm-clang-ocl/rocm-clang-ocl_0.5.0.60201-112~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.1/pool/main/o/openmp-extras-runtime/openmp-extras-runtime_18.62.0.60201-112~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.1/pool/main/r/rocm-smi-lib/rocm-smi-lib_7.3.0.60201-112~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.1/pool/main/a/amd-smi-lib/amd-smi-lib_24.6.3.60201-112~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.1/pool/main/r/rocm-cmake/rocm-cmake_0.13.0.60201-112~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.1/pool/main/r/rocm-dbgapi/rocm-dbgapi_0.76.0.60201-112~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.1/pool/main/r/rocm-debug-agent/rocm-debug-agent_2.0.3.60201-112~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.1/pool/main/r/rocm-gdb/rocm-gdb_14.2.60201-112~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.1/pool/main/r/rocm-utils/rocm-utils_6.2.1.60201-112~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.1/pool/main/r/rocprofiler/rocprofiler_2.0.60201.60201-112~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.1/pool/main/r/rocprofiler-dev/rocprofiler-dev_2.0.60201.60201-112~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.1/pool/main/r/rocprofiler-plugins/rocprofiler-plugins_2.0.60201.60201-112~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.1/pool/main/r/rocprofiler-register/rocprofiler-register_0.4.0.60201-112~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.1/pool/main/r/roctracer/roctracer_4.1.60201.60201-112~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.1/pool/main/r/roctracer-dev/roctracer-dev_4.1.60201.60201-112~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.1/pool/main/r/rocm-dev/rocm-dev_6.2.1.60201-112~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.2.1/pool/main/h/hsa-amd-aqlprofile/hsa-amd-aqlprofile_1.0.0.60201.60201-112~24.04_amd64.deb"
# Proprietary
"https://repo.radeon.com/amdgpu/5.7.1/ubuntu/pool/proprietary/o/opencl-legacy-amdgpu-pro/opencl-legacy-amdgpu-pro-icd_23.20-1664987.22.04_amd64.deb"
)

sha256sums=(
"a3c6071c4fb4884c3a41f34612405b6bfdf06dc046a0bf465b460cef6cd7e656"

"848e009e8171089e36fbc9d45b8bc06acd5364ed0ad6bbb04c5460016eb44e8d"
"58bb4f1ad8646e2927a5c29d9601045708e85ea7d84f0f3e1a8567c28946aaad"
"ec1c5d46cb81a41de00b0c14f81079dd3fdb942d253896c8f23f96facaca9b30"
"9c11aab28acf18a3b0e52c381466df2588e42c92a8a8e841ec98769d383228d1"
"d9c384c014e067b61709250774c10d083ad12b257afc4695d9ad89363152aaf7"
"36b9e2d319f16f3c91aa8419541ecda867ca30c29333b6d53797547e7050fef4"
"5cc30e2145b5716489125910abf792e8de898e7efa91b5433e1900521b30b886"
"8a9515451e884ac67247be23f9ef846b8ca095b5a517ca0b068dd5bc0d3458ee"
"52f42cd687b73cce3c464bc915491999a16d3d0b888f5afe7a66af1a75e28b77"
"e8685e1510e8c380dc678b509b0dd20322d372a8998c1a20e0eae8e010cbb7fb"
"16b97789f4021ae6038b48209482ea087fddb9fe10e82b1b0a6b88169d8b1e15"
"306837be27b8cb77ca0ffbff4a446e8ea8eac020b96d9d8618694d6905fb9480"
"05457336e6569c2c90116bff08c08e7e76f4e70849b25dae24f339e0a3ab5de5"
"70ae2b930f03a8efa944a7a3a3f65777651387cd0bb8a814382c15cf7397f277"
"fd1da36b9fa91612841e6dede21277bfae4ebd3e3b5161b139bc0aee36eadc6b"
"32448258c8f95db8752c2d6d7b44d77de2fb4b9a73699ba257e61e287752df6d"
"45eb0fd4b04b6b444f3b2447b92a471286ff270e710d1c1b1975d838118fbd5e"
"9d5d9096359fe39b5f70cefa3de10b56848652729f769e62167dd1be042464f6"
"1df7c933789fb10b6d9202d5a4f86482d64a47bb9fe9fbc275fcea7a6b1b2730"
"2247f580adc715f5009ffe7d6b846419a4521c40317f46b9f700185338e65af4"

#"c2716b32f35eb79d3d1f2d2ade4fcdefdef57437593c130f3e552532e041f077"
"3aff7ef73a783540f5a7cd39ad39daf72c24a59e60d022acfe4750333b644b3f"
"fd147a75193d00fdc5ddc229883cedf0b0bde1273442c1d1636dee88dfb6bc90"
"8f1f0b7779da2747cb044cc98194cac0fc4155d6c28ddccc0286f1d91ebde578"
"f30b3a4c2696b3560b42e854365590f551d7d40ac61e04968693d801641e474b"
"4dba4f6c8d45eb86394a5a38be7570f4e2d14384040ed42cc95e1767e09eda82"
"e4d4c96a6df54221c49b4ca4654e90ff2b32a83761792f001bcece7c2a99d133"
"b539ad7df45b17e58c7e751ae683a74805707d43b22d559ab06542e6ea216af2"
"cf0e8c4d4e0a16d762aa0b8a9bdfe25e7ee9a8edabf9b1f619cd814f255a03d6"
"54675d6a8bf19b938c80b60e1a11a6890c5490e737351f09f7b8af2ad45321f3"
"5e4a627b033e89e1e19b5f79d7170a9a22bf4c278299e448027e6946e9655abd"
"ca226c5aa34ed57d2c7505eae470d537ad058f094522a199f97d94ef2fcfe6b4"
"918f5421f256b62c54ba26499bd34971486687de412366f1ea5b102d822a4188"
"692a48a5a34c8aa02897ae4a630b18ea99e4fddba768614d8ec0532b597e197e"
"74613190fa9b62800b2a53f9966f730b224d7ba207b1f3f682ecbf84fcb17d39"
"c7e264831880f224f0a8709f41619313c5311bffc537efeb34f44344fe7317c2"
"6b02e5d67d0a903b7ec1ed6b039e7aaa2645156d199a6fbf090563da22df0a5c"
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
	egz "${srcdir}/rocm-core_6.2.1.60201-112~24.04_amd64.deb"
	egz "${srcdir}/comgr_2.8.0.60201-112~24.04_amd64.deb"
	egz "${srcdir}/hipcc_1.1.1.60201-112~24.04_amd64.deb"
	egz "${srcdir}/hip-dev_6.2.41134.60201-112~24.04_amd64.deb"
	egz "${srcdir}/hip-doc_6.2.41134.60201-112~24.04_amd64.deb"
	egz "${srcdir}/hip-samples_6.2.41134.60201-112~24.04_amd64.deb"
	egz "${srcdir}/hsakmt-roct-dev_20240607.4.05.60201-112~24.04_amd64.deb"
	egz "${srcdir}/hsa-rocr_1.14.0.60201-112~24.04_amd64.deb"
	egz "${srcdir}/hsa-rocr-dev_1.14.0.60201-112~24.04_amd64.deb"
	egz "${srcdir}/rocminfo_1.0.0.60201-112~24.04_amd64.deb"
	egz "${srcdir}/hip-runtime-amd_6.2.41134.60201-112~24.04_amd64.deb"
	egz "${srcdir}/rocm-device-libs_1.0.0.60201-112~24.04_amd64.deb"
	egz "${srcdir}/rocm-language-runtime_6.2.1.60201-112~24.04_amd64.deb"
	egz "${srcdir}/rocm-hip-runtime_6.2.1.60201-112~24.04_amd64.deb"
	egz "${srcdir}/rocdecode_0.6.0.60201-112~24.04_amd64.deb"
	egz "${srcdir}/rocdecode-dev_0.6.0.60201-112~24.04_amd64.deb"
	#egz "${srcdir}/rocm-ocl-icd_2.0.0.60201-112~24.04_amd64.deb"
	egz "${srcdir}/rocm-opencl-icd-loader_1.2.60201-112~24.04_amd64.deb"
	egz "${srcdir}/rocm-opencl_2.0.0.60201-112~24.04_amd64.deb"
	egz "${srcdir}/rocm-opencl-dev_2.0.0.60201-112~24.04_amd64.deb"
	egz "${srcdir}/rocm-opencl-runtime_6.2.1.60201-112~24.04_amd64.deb"
	#exz "${srcdir}/rocm-clang-ocl_0.5.0.60201-112~24.04_amd64.deb"
	egz "${srcdir}/rocm-smi-lib_7.3.0.60201-112~24.04_amd64.deb"
	egz "${srcdir}/amd-smi-lib_24.6.3.60201-112~24.04_amd64.deb"
	exz "${srcdir}/rocm-cmake_0.13.0.60201-112~24.04_amd64.deb"
	egz "${srcdir}/rocm-dbgapi_0.76.0.60201-112~24.04_amd64.deb"
	egz "${srcdir}/rocm-debug-agent_2.0.3.60201-112~24.04_amd64.deb"
	egz "${srcdir}/rocm-utils_6.2.1.60201-112~24.04_amd64.deb"
	egz "${srcdir}/rocprofiler_2.0.60201.60201-112~24.04_amd64.deb"
	egz "${srcdir}/rocprofiler-dev_2.0.60201.60201-112~24.04_amd64.deb"
	egz "${srcdir}/rocprofiler-plugins_2.0.60201.60201-112~24.04_amd64.deb"
	egz "${srcdir}/rocprofiler-register_0.4.0.60201-112~24.04_amd64.deb"
	egz "${srcdir}/roctracer_4.1.60201.60201-112~24.04_amd64.deb"
	egz "${srcdir}/roctracer-dev_4.1.60201.60201-112~24.04_amd64.deb"
	egz "${srcdir}/rocm-dev_6.2.1.60201-112~24.04_amd64.deb"
	egz "${srcdir}/hsa-amd-aqlprofile_1.0.0.60201.60201-112~24.04_amd64.deb"
	exz "${srcdir}/libdrm-amdgpu-amdgpu1_2.4.120.60201-2038383.24.04_amd64.deb"
	egz "${srcdir}/openmp-extras-runtime_18.62.0.60201-112~24.04_amd64.deb"
	egz "${srcdir}/rocm-gdb_14.2.60201-112~24.04_amd64.deb"
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
	ln -s "/opt/rocm-6.2.1" "$pkgdir/opt/rocm"
	#ln -s "/opt/rocm-6.2.1/hip/bin/.hipVersion" "$pkgdir/opt/rocm-6.2.1/bin/.hipVersion"

	mkdir -p "${pkgdir}/opt/amdgpu/share/libdrm"
	cd "${pkgdir}/opt/amdgpu/share/libdrm"
	ln -s /usr/share/libdrm/amdgpu.ids amdgpu.ids		

	mkdir -p ${pkgdir}/etc/OpenCL/vendors	
	echo libamdocl64.so > "${pkgdir}/etc/OpenCL/vendors/amdocl64.icd"
	echo libamdocl-orca64.so > "${pkgdir}/etc/OpenCL/vendors/amdocl-orca64.icd"

	mkdir -p ${pkgdir}/etc/ld.so.conf.d
	echo /opt/rocm-6.2.1/opencl/lib > "$pkgdir/etc/ld.so.conf.d/opencl-amd.conf"
	echo /opt/rocm-6.2.1/lib >> "$pkgdir/etc/ld.so.conf.d/opencl-amd.conf"
	echo /opt/rocm-6.2.1/hip/lib >> "$pkgdir/etc/ld.so.conf.d/opencl-amd.conf"

	mkdir -p ${pkgdir}/etc/profile.d
	echo export PATH="\${PATH}:/opt/rocm-6.2.1/bin:/opt/rocm-6.2.1/hip/bin" > "$pkgdir/etc/profile.d/opencl-amd.sh"
}
