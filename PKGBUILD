# Maintainer: Carson Rueter <roachh at proton mail dot com>
# Co-Maintainer: George Sofianos

# Release notes https://rocm.docs.amd.com/en/latest/about/CHANGELOG.html#rocm-6-1-0
amdgpu_repo='https://repo.radeon.com/amdgpu/6.1/ubuntu'
rocm_repo='https://repo.radeon.com/rocm/apt/6.1'
opencl_lib='opt/rocm-6.1.0/opencl/lib'
rocm_lib='opt/rocm-6.1.0/lib'
hip_lib='opt/rocm-6.1.0/hip/lib/'
amdgpu="opt/amdgpu/lib/x86_64-linux-gnu"
amdgpu_pro="opt/amdgpu-pro/lib/x86_64-linux-gnu/"

pkgname=opencl-amd
pkgdesc="ROCr OpenCL stack, supports Vega 10 and later products - Legacy OpenCL stack (Proprietary), supports legacy products older than Vega 10 - This package is intended to work along with the free amdgpu stack."            
pkgver=6.1.0
pkgrel=2
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
"https://repo.radeon.com/amdgpu/6.1/ubuntu/pool/main/libd/libdrm-amdgpu/libdrm-amdgpu-amdgpu1_2.4.120.60100-1756574.22.04_amd64.deb"
# ROCM
"https://repo.radeon.com/rocm/apt/6.1/pool/main/r/rocm-core/rocm-core_6.1.0.60100-82~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1/pool/main/c/comgr/comgr_2.7.0.60100-82~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1/pool/main/h/hipcc/hipcc_1.0.0.60100-82~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1/pool/main/h/hip-dev/hip-dev_6.1.40091.60100-82~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1/pool/main/h/hip-doc/hip-doc_6.1.40091.60100-82~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1/pool/main/h/hip-samples/hip-samples_6.1.40091.60100-82~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1/pool/main/h/hsakmt-roct-dev/hsakmt-roct-dev_20240125.3.30.60100-82~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1/pool/main/h/hsa-rocr/hsa-rocr_1.13.0.60100-82~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1/pool/main/h/hsa-rocr-dev/hsa-rocr-dev_1.13.0.60100-82~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1/pool/main/r/rocminfo/rocminfo_1.0.0.60100-82~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1/pool/main/h/hip-runtime-amd/hip-runtime-amd_6.1.40091.60100-82~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1/pool/main/r/rocm-device-libs/rocm-device-libs_1.0.0.60100-82~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1/pool/main/r/rocm-language-runtime/rocm-language-runtime_6.1.0.60100-82~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1/pool/main/r/rocm-hip-runtime/rocm-hip-runtime_6.1.0.60100-82~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1/pool/main/r/rocdecode/rocdecode_0.5.0.60100-82~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1/pool/main/r/rocdecode-dev/rocdecode-dev_0.5.0.60100-82~22.04_amd64.deb"
#"https://repo.radeon.com/rocm/apt/6.1/pool/main/r/rocm-ocl-icd/rocm-ocl-icd_2.0.0.60100-82~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1/pool/main/r/rocm-opencl-icd-loader/rocm-opencl-icd-loader_1.2.60100-82~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1/pool/main/r/rocm-opencl/rocm-opencl_2.0.0.60100-82~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1/pool/main/r/rocm-opencl-dev/rocm-opencl-dev_2.0.0.60100-82~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1/pool/main/r/rocm-opencl-runtime/rocm-opencl-runtime_6.1.0.60100-82~22.04_amd64.deb"
# ROCM DEV
"https://repo.radeon.com/rocm/apt/6.1/pool/main/r/rocm-clang-ocl/rocm-clang-ocl_0.5.0.60100-82~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1/pool/main/o/openmp-extras-runtime/openmp-extras-runtime_17.60.0.60100-82~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1/pool/main/r/rocm-smi-lib/rocm-smi-lib_7.0.0.60100-82~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1/pool/main/a/amd-smi-lib/amd-smi-lib_24.4.1.60100-82~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1/pool/main/r/rocm-cmake/rocm-cmake_0.12.0.60100-82~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1/pool/main/r/rocm-dbgapi/rocm-dbgapi_0.71.0.60100-82~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1/pool/main/r/rocm-debug-agent/rocm-debug-agent_2.0.3.60100-82~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1/pool/main/r/rocm-gdb/rocm-gdb_14.1.60100-82~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1/pool/main/r/rocm-utils/rocm-utils_6.1.0.60100-82~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1/pool/main/r/rocprofiler/rocprofiler_2.0.60100.60100-82~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1/pool/main/r/rocprofiler-dev/rocprofiler-dev_2.0.60100.60100-82~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1/pool/main/r/rocprofiler-plugins/rocprofiler-plugins_2.0.60100.60100-82~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1/pool/main/r/rocprofiler-register/rocprofiler-register_0.3.0.60100-82~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1/pool/main/r/roctracer/roctracer_4.1.60100.60100-82~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1/pool/main/r/roctracer-dev/roctracer-dev_4.1.60100.60100-82~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1/pool/main/r/rocm-dev/rocm-dev_6.1.0.60100-82~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1/pool/main/h/hsa-amd-aqlprofile/hsa-amd-aqlprofile_1.0.0.60100.60100-82~22.04_amd64.deb"
# Proprietary
"https://repo.radeon.com/amdgpu/5.7.1/ubuntu/pool/proprietary/o/opencl-legacy-amdgpu-pro/opencl-legacy-amdgpu-pro-icd_23.20-1664987.22.04_amd64.deb"
)

sha256sums=(
"59cff615ef978269d592ebeaae74c49be8b916ca3b9664e40482128ec6268134"

"4023ec3636b13840d6616c73f6775e248c7419c2c095d3fdf4bf41c00d6ff97f"
"fa5590c7220637300970d451eb8d0649645ab5fa2d833cddd7e8239b5767f2d9"
"e3e3eac12764c521e49bfb28d5db3f1efa0a544e0a887a8e5a2bd81b965ab580"
"3756bce59df80220ee75084d7d2ad1a952cd73daed791de89bc590764d66d4d6"
"22e25301755487e141c12e13defd704a0e97211c95afbad78d20e543a112751f"
"00c6168d7e22030c4ac07524a72c9140406ba273df3b383b6a8924d13282e44e"
"234f89c311d79d91bcd82a81b73f8ddd5f7031f9c6cd934d8c56bd5878937492"
"e30e3674500f261a74f751a5fa6ec78658b992fd9c4bc498ff792ea14d47bff0"
"690716124dedcd062ddfb4f5912136ffef31882fe03ef36aa222a8353ffe254a"
"b7cf95b3b20e3accba23de34265ac408603176279412fda116dce47047a36e7b"
"8cb31ffd9d313e19a6e9b7bed8a106d0ed59fe92f479fa042405217f787cae16"
"7e155798e1027dd4fc0d49a89865245f3017090e44ea057584b8b86d5ea931cd"
"1b5f57bc613bdfd556724dedfcf450d1df8922390381ee6ac336457574af7739"
"b7fe5ec4a6a1fc16174d84993d34a4bb8a6adcbc8d69311b63d3277bc50d56e5"
"c818c321e0e3327b97646a10fe2122b5aad7749b1be04ca2f30e05e7636976d3"
"fefa3217d6427904894ee3a449e4f1a6b0124f0b0dc9c4de41cf63ef488d8878"
"e1fe28df4c48f8807ae885da3ce8951347d73f644d2824aeb7720faaf8343739"
"45652a9a1fc881ab8dedb6dbdc2464a6f339637064824f024aa0e8196cef7f79"
"c5a6f80bbed8e223da61aa4aef1e92395861fbb124f1b0cfcf2480246748ee2d"
"b3ec34ab4c8c2a8e197af3154461873016cb6e186d69a0092dd3bc2f864c3ed3"

"09971cc998b51633b26f835141690a41e1992aa6e66b569b34407a0ac5460f8c"
"23150f4e4987852a98a1a042de7ae394eaace89a6866531b8de9d94af5db9063"
"792775cbf8474dcfea6420cc5f0e599d071bf848dae451b566a2b973ed0a9672"
"fbef31daaafd77abf0911d08d1abbb3c1020a530bb53dab7c7507379fdb666a5"
"28cd3df935237865d9562d8445075b93e94b3ec36db597e9a0964716b96666ff"
"a769ea0c629b8cc219c4497d66de4e1d72b604c0de4fe0c5d11f43d656075429"
"c2a2e49414eaf143e5a905bffc710a2773f810f88a6ddcf334cc456e6d18145b"
"d780d6f72c8ff8d7076ee161f5d36e462af7b224933c0c64a90e0c1d4cc0e4ff"
"1dc47f74bd34867279c48b973b41a060e92f61f38ff88578819b89bcd1db2dd3"
"4d1f1545c540eedda28ca0e5147c0da9ee441ef8b3113cb9865020eea77c21bf"
"0a97df151012fce14a40a3b88f2913b9a417e9a3193c325299fc93cea47e9aa0"
"d710b53bad2e3bbc09f5c2d3bd79ef723bac8731efdd333052786347592fd9a2"
"9922c6e0dd434c9d72e81222d2de4612498cde95b5308ded09e425f41b686c52"
"923da31988be0668aa037923ba3cad021bd06a591deadfbe40c6a4cbcc7b3423"
"f32fbe2969b3094efde90557a1cebf61b3f2b4a21c7a125be075f1d47daf49ee"
"724021a20c9b535697d369876d9b43581675e3351fff7e67116e2d929202f423"
"70dedec17e80ff96e7a19ba80f88ed0f26f192f725119e0897266bb00c295d80"
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
	egz "${srcdir}/rocm-core_6.1.0.60100-82~22.04_amd64.deb"
	egz "${srcdir}/comgr_2.7.0.60100-82~22.04_amd64.deb"
	egz "${srcdir}/hipcc_1.0.0.60100-82~22.04_amd64.deb"
	egz "${srcdir}/hip-dev_6.1.40091.60100-82~22.04_amd64.deb"
	egz "${srcdir}/hip-doc_6.1.40091.60100-82~22.04_amd64.deb"
	egz "${srcdir}/hip-samples_6.1.40091.60100-82~22.04_amd64.deb"
	egz "${srcdir}/hsakmt-roct-dev_20240125.3.30.60100-82~22.04_amd64.deb"
	egz "${srcdir}/hsa-rocr_1.13.0.60100-82~22.04_amd64.deb"
	egz "${srcdir}/hsa-rocr-dev_1.13.0.60100-82~22.04_amd64.deb"
	egz "${srcdir}/rocminfo_1.0.0.60100-82~22.04_amd64.deb"
	egz "${srcdir}/hip-runtime-amd_6.1.40091.60100-82~22.04_amd64.deb"
	egz "${srcdir}/rocm-device-libs_1.0.0.60100-82~22.04_amd64.deb"
	egz "${srcdir}/rocm-language-runtime_6.1.0.60100-82~22.04_amd64.deb"
	egz "${srcdir}/rocm-hip-runtime_6.1.0.60100-82~22.04_amd64.deb"
	egz "${srcdir}/rocdecode_0.5.0.60100-82~22.04_amd64.deb"
	egz "${srcdir}/rocdecode-dev_0.5.0.60100-82~22.04_amd64.deb"
	#egz "${srcdir}/rocm-ocl-icd_2.0.0.60100-82~22.04_amd64.deb"
	egz "${srcdir}/rocm-opencl-icd-loader_1.2.60100-82~22.04_amd64.deb"
	egz "${srcdir}/rocm-opencl_2.0.0.60100-82~22.04_amd64.deb"
	egz "${srcdir}/rocm-opencl-dev_2.0.0.60100-82~22.04_amd64.deb"
	egz "${srcdir}/rocm-opencl-runtime_6.1.0.60100-82~22.04_amd64.deb"
	exz "${srcdir}/rocm-clang-ocl_0.5.0.60100-82~22.04_amd64.deb"
	egz "${srcdir}/rocm-smi-lib_7.0.0.60100-82~22.04_amd64.deb"
	egz "${srcdir}/amd-smi-lib_24.4.1.60100-82~22.04_amd64.deb"
	exz "${srcdir}/rocm-cmake_0.12.0.60100-82~22.04_amd64.deb"
	egz "${srcdir}/rocm-dbgapi_0.71.0.60100-82~22.04_amd64.deb"
	egz "${srcdir}/rocm-debug-agent_2.0.3.60100-82~22.04_amd64.deb"
	egz "${srcdir}/rocm-utils_6.1.0.60100-82~22.04_amd64.deb"
	egz "${srcdir}/rocprofiler_2.0.60100.60100-82~22.04_amd64.deb"
	egz "${srcdir}/rocprofiler-dev_2.0.60100.60100-82~22.04_amd64.deb"
	egz "${srcdir}/rocprofiler-plugins_2.0.60100.60100-82~22.04_amd64.deb"
	egz "${srcdir}/rocprofiler-register_0.3.0.60100-82~22.04_amd64.deb"
	egz "${srcdir}/roctracer_4.1.60100.60100-82~22.04_amd64.deb"
	egz "${srcdir}/roctracer-dev_4.1.60100.60100-82~22.04_amd64.deb"
	egz "${srcdir}/rocm-dev_6.1.0.60100-82~22.04_amd64.deb"
	egz "${srcdir}/hsa-amd-aqlprofile_1.0.0.60100.60100-82~22.04_amd64.deb"
	exz "${srcdir}/libdrm-amdgpu-amdgpu1_2.4.120.60100-1756574.22.04_amd64.deb"
	egz "${srcdir}/openmp-extras-runtime_17.60.0.60100-82~22.04_amd64.deb"
	egz "${srcdir}/rocm-gdb_14.1.60100-82~22.04_amd64.deb"
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
	ln -s "/opt/rocm-6.1.0" "$pkgdir/opt/rocm"
	#ln -s "/opt/rocm-6.1.0/hip/bin/.hipVersion" "$pkgdir/opt/rocm-6.1.0/bin/.hipVersion"

	mkdir -p "${pkgdir}/opt/amdgpu/share/libdrm"
	cd "${pkgdir}/opt/amdgpu/share/libdrm"
	ln -s /usr/share/libdrm/amdgpu.ids amdgpu.ids		

	mkdir -p ${pkgdir}/etc/OpenCL/vendors	
	echo libamdocl64.so > "${pkgdir}/etc/OpenCL/vendors/amdocl64.icd"
	echo libamdocl-orca64.so > "${pkgdir}/etc/OpenCL/vendors/amdocl-orca64.icd"

	mkdir -p ${pkgdir}/etc/ld.so.conf.d
	echo /opt/rocm-6.1.0/opencl/lib > "$pkgdir/etc/ld.so.conf.d/opencl-amd.conf"
	echo /opt/rocm-6.1.0/lib >> "$pkgdir/etc/ld.so.conf.d/opencl-amd.conf"
	echo /opt/rocm-6.1.0/hip/lib >> "$pkgdir/etc/ld.so.conf.d/opencl-amd.conf"

	mkdir -p ${pkgdir}/etc/profile.d
	echo export PATH="\${PATH}:/opt/rocm-6.1.0/bin:/opt/rocm-6.1.0/hip/bin" > "$pkgdir/etc/profile.d/opencl-amd.sh"
}
