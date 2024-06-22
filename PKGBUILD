# Maintainer: Carson Rueter <roachh at proton mail dot com>
# Co-Maintainer: George Sofianos

# Release notes https://rocm.docs.amd.com/en/latest/about/CHANGELOG.html#rocm-6-1-3
amdgpu_repo='https://repo.radeon.com/amdgpu/6.1.3/ubuntu'
rocm_repo='https://repo.radeon.com/rocm/apt/6.1.3'
opencl_lib='opt/rocm-6.1.3/opencl/lib'
rocm_lib='opt/rocm-6.1.3/lib'
hip_lib='opt/rocm-6.1.3/hip/lib/'
amdgpu="opt/amdgpu/lib/x86_64-linux-gnu"
amdgpu_pro="opt/amdgpu-pro/lib/x86_64-linux-gnu/"

pkgname=opencl-amd
pkgdesc="ROCm components repackaged from AMD's Ubuntu releases (ROCr runtime, ROCm runtime, HIP runtime) - This package is intended to work along with the free amdgpu stack."
pkgver=6.1.3
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
"https://repo.radeon.com/amdgpu/6.1.2/ubuntu/pool/main/libd/libdrm-amdgpu/libdrm-amdgpu-amdgpu1_2.4.120.60102-1781449.22.04_amd64.deb"
# ROCM
"https://repo.radeon.com/rocm/apt/6.1.3/pool/main/r/rocm-core/rocm-core_6.1.3.60103-122~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.3/pool/main/c/comgr/comgr_2.7.0.60103-122~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.3/pool/main/h/hipcc/hipcc_1.0.0.60103-122~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.3/pool/main/h/hip-dev/hip-dev_6.1.40093.60103-122~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.3/pool/main/h/hip-doc/hip-doc_6.1.40093.60103-122~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.3/pool/main/h/hip-samples/hip-samples_6.1.40093.60103-122~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.3/pool/main/h/hsakmt-roct-dev/hsakmt-roct-dev_20240125.5.08.60103-122~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.3/pool/main/h/hsa-rocr/hsa-rocr_1.13.0.60103-122~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.3/pool/main/h/hsa-rocr-dev/hsa-rocr-dev_1.13.0.60103-122~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.3/pool/main/r/rocminfo/rocminfo_1.0.0.60103-122~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.3/pool/main/h/hip-runtime-amd/hip-runtime-amd_6.1.40093.60103-122~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.3/pool/main/r/rocm-device-libs/rocm-device-libs_1.0.0.60103-122~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.3/pool/main/r/rocm-language-runtime/rocm-language-runtime_6.1.3.60103-122~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.3/pool/main/r/rocm-hip-runtime/rocm-hip-runtime_6.1.3.60103-122~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.3/pool/main/r/rocdecode/rocdecode_0.6.0.60103-122~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.3/pool/main/r/rocdecode-dev/rocdecode-dev_0.6.0.60103-122~22.04_amd64.deb"
#"https://repo.radeon.com/rocm/apt/6.1.3/pool/main/r/rocm-ocl-icd/rocm-ocl-icd_2.0.0.60103-122~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.3/pool/main/r/rocm-opencl-icd-loader/rocm-opencl-icd-loader_1.2.60103-122~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.3/pool/main/r/rocm-opencl/rocm-opencl_2.0.0.60103-122~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.3/pool/main/r/rocm-opencl-dev/rocm-opencl-dev_2.0.0.60103-122~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.3/pool/main/r/rocm-opencl-runtime/rocm-opencl-runtime_6.1.3.60103-122~22.04_amd64.deb"
# ROCM DEV
"https://repo.radeon.com/rocm/apt/6.1.3/pool/main/r/rocm-clang-ocl/rocm-clang-ocl_0.5.0.60103-122~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.3/pool/main/o/openmp-extras-runtime/openmp-extras-runtime_17.60.0.60103-122~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.3/pool/main/r/rocm-smi-lib/rocm-smi-lib_7.2.0.60103-122~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.3/pool/main/a/amd-smi-lib/amd-smi-lib_24.5.1.60103-122~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.3/pool/main/r/rocm-cmake/rocm-cmake_0.12.0.60103-122~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.3/pool/main/r/rocm-dbgapi/rocm-dbgapi_0.71.0.60103-122~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.3/pool/main/r/rocm-debug-agent/rocm-debug-agent_2.0.3.60103-122~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.3/pool/main/r/rocm-gdb/rocm-gdb_14.1.60103-122~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.3/pool/main/r/rocm-utils/rocm-utils_6.1.3.60103-122~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.3/pool/main/r/rocprofiler/rocprofiler_2.0.60103.60103-122~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.3/pool/main/r/rocprofiler-dev/rocprofiler-dev_2.0.60103.60103-122~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.3/pool/main/r/rocprofiler-plugins/rocprofiler-plugins_2.0.60103.60103-122~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.3/pool/main/r/rocprofiler-register/rocprofiler-register_0.3.0.60103-122~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.3/pool/main/r/roctracer/roctracer_4.1.60103.60103-122~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.3/pool/main/r/roctracer-dev/roctracer-dev_4.1.60103.60103-122~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.3/pool/main/r/rocm-dev/rocm-dev_6.1.3.60103-122~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.3/pool/main/h/hsa-amd-aqlprofile/hsa-amd-aqlprofile_1.0.0.60103.60103-122~22.04_amd64.deb"
# Proprietary
"https://repo.radeon.com/amdgpu/5.7.1/ubuntu/pool/proprietary/o/opencl-legacy-amdgpu-pro/opencl-legacy-amdgpu-pro-icd_23.20-1664987.22.04_amd64.deb"
)

sha256sums=(
"9f4f4fa0603451f7d84c6b202618e72605efd0e979b249cff34c51b634af8ac9"

"68cae44049513b32d0d567c6208b2e07c4922cf6a7ab41226a86ede63583c194"
"d806fbc22f70412f0c0f4e03962a9449730dbc9345740af9da6fb35c6233a672"
"33b508aefba4c6da92e2f1955edffe5b6af120ff77e6e2fec0340d18ad889b90"
"839f717ad593d5cc7d6a99f2e123dbdefe861742fbcb4b8dbd33ca4ef3974a5a"
"1a620e90552be5b2b2d2a9cdd2999083a089d607d033dfb4635dba7c51c48ba3"
"a9a577da51bc6f83b83187b1c07f9cfd4307b4c1fae3736a807812eb61750798"
"aea3c9fee49f59d36f1e7da983b5dcc8bbbe9ff8592a089526a15c21c62c1d15"
"995d2008d86a016bef7b9e500fbec6f0e681b870b28f61bb51198661ec273f6a"
"3d85331c443ba0609361e432f261f744f87831e0e8c1495910ca2981f0da07fe"
"2b809c69082b90e3024c42eb03b8cb96e606eb9728ecc0b76f4ad509f9b449a2"
"4ee25e9bdc73915ab410ae54699cc82f5a168a06f6a4b487f01cd7dd4454e055"
"d32e5b129cb8a14fad5b5b40489626c8e311bc0701aabf4e23091bcfeaea7a51"
"c8ebc0f5ae851db2f9d1eddf7d794f503764ffbb742beec93c4bc3a65045be35"
"ef06d406d67f56cf4771b97078bbccd617c62e3573fa84a577ec42e7de541d1c"
"487d4cc91979929edea993d36a17d5bc197b4ab79f8d8b086669fcd52c0f44e9"
"5878a2f2c299e6d3560e3b8620974735b3fca988fa4166f77fcd728068866736"
"7f12483b8b8723eb31699fe8a23bf66b0bcbb630e453e2c51a81aa8582fe6048"
"6b02e2fa77efa472b3de78215b8be8c3041e078666259c74e083a398840c7b9c"
"e209f29341f81e88882ef0387681d7d73c6b8836ad22b160dd9930fc40b18d62"
"8c8915699531e40077fb3596a223183f2f8d1739dda39f4d8e18bc2049032462"

"c2716b32f35eb79d3d1f2d2ade4fcdefdef57437593c130f3e552532e041f077"
"a6d31b1f865bc0978754f2d24b09aa0423527c41b5b9884dbc2ee90587014a89"
"1eb49b27a713d184446ac9853378596ec22debbc310c38e650747c91b6e9d5e4"
"4221bb34fab90d86429d99d2f164ef5bf8de226c2f440de45ed67f952e4c2f84"
"400d6a9e6b2074e8be775a495d253840e1bed3205e55b84bcb0fd672052c1d32"
"3cbea7520beb9263eedb391de72134b7650f71efa4f92cbcb092bb78f7510206"
"ee61c6164adc0f61c86dbb82fcc06921ad16bf93b90eed8e029688a2fe59934a"
"0c90764b24f820050d572de9ce53bab5fe012c8933d2d41f3ebe28545ddf34fb"
"dc2390bcce6d512fd1700d20c5f2df9b9e363a51f705fc3ddcb446925946be80"
"8c52f29f9c51bb43d1fbfa3c0d555eb91999b07f99e6dfd3a85a1fcec049d8ff"
"6140d5e89b96742b51a5c39a116597f7d0dcab748a54ce3fbba713c9addf216e"
"db0bd93877e98791166bb464d32d6488d9c068b42b47160026593221efe3d45a"
"cc608168356e23597639a6789601ed4fd0fc914972391b2788b69dcce2cc66b1"
"3fa2ccf752bc2ada5bfa7af99499cbc6f7da11cd61731585f83e564c426961b0"
"7e2ac6ef5cae29b86c374be3693d210104ff7855d2aafecaf0c19d692053c60a"
"fcfc4dbd684ae750755d092d436964b0deb17957eee6fe2955b334cf9a37ec89"
"e3dbd0dd94f4555bc82ae37160df484e14a7324b31b42a19bf51e882d1cdba45"
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
	egz "${srcdir}/rocm-core_6.1.3.60103-122~22.04_amd64.deb"
	egz "${srcdir}/comgr_2.7.0.60103-122~22.04_amd64.deb"
	egz "${srcdir}/hipcc_1.0.0.60103-122~22.04_amd64.deb"
	egz "${srcdir}/hip-dev_6.1.40093.60103-122~22.04_amd64.deb"
	egz "${srcdir}/hip-doc_6.1.40093.60103-122~22.04_amd64.deb"
	egz "${srcdir}/hip-samples_6.1.40093.60103-122~22.04_amd64.deb"
	egz "${srcdir}/hsakmt-roct-dev_20240125.5.08.60103-122~22.04_amd64.deb"
	egz "${srcdir}/hsa-rocr_1.13.0.60103-122~22.04_amd64.deb"
	egz "${srcdir}/hsa-rocr-dev_1.13.0.60103-122~22.04_amd64.deb"
	egz "${srcdir}/rocminfo_1.0.0.60103-122~22.04_amd64.deb"
	egz "${srcdir}/hip-runtime-amd_6.1.40093.60103-122~22.04_amd64.deb"
	egz "${srcdir}/rocm-device-libs_1.0.0.60103-122~22.04_amd64.deb"
	egz "${srcdir}/rocm-language-runtime_6.1.3.60103-122~22.04_amd64.deb"
	egz "${srcdir}/rocm-hip-runtime_6.1.3.60103-122~22.04_amd64.deb"
	egz "${srcdir}/rocdecode_0.6.0.60103-122~22.04_amd64.deb"
	egz "${srcdir}/rocdecode-dev_0.6.0.60103-122~22.04_amd64.deb"
	#egz "${srcdir}/rocm-ocl-icd_2.0.0.60103-122~22.04_amd64.deb"
	egz "${srcdir}/rocm-opencl-icd-loader_1.2.60103-122~22.04_amd64.deb"
	egz "${srcdir}/rocm-opencl_2.0.0.60103-122~22.04_amd64.deb"
	egz "${srcdir}/rocm-opencl-dev_2.0.0.60103-122~22.04_amd64.deb"
	egz "${srcdir}/rocm-opencl-runtime_6.1.3.60103-122~22.04_amd64.deb"
	exz "${srcdir}/rocm-clang-ocl_0.5.0.60103-122~22.04_amd64.deb"
	egz "${srcdir}/rocm-smi-lib_7.2.0.60103-122~22.04_amd64.deb"
	egz "${srcdir}/amd-smi-lib_24.5.1.60103-122~22.04_amd64.deb"
	exz "${srcdir}/rocm-cmake_0.12.0.60103-122~22.04_amd64.deb"
	egz "${srcdir}/rocm-dbgapi_0.71.0.60103-122~22.04_amd64.deb"
	egz "${srcdir}/rocm-debug-agent_2.0.3.60103-122~22.04_amd64.deb"
	egz "${srcdir}/rocm-utils_6.1.3.60103-122~22.04_amd64.deb"
	egz "${srcdir}/rocprofiler_2.0.60103.60103-122~22.04_amd64.deb"
	egz "${srcdir}/rocprofiler-dev_2.0.60103.60103-122~22.04_amd64.deb"
	egz "${srcdir}/rocprofiler-plugins_2.0.60103.60103-122~22.04_amd64.deb"
	egz "${srcdir}/rocprofiler-register_0.3.0.60103-122~22.04_amd64.deb"
	egz "${srcdir}/roctracer_4.1.60103.60103-122~22.04_amd64.deb"
	egz "${srcdir}/roctracer-dev_4.1.60103.60103-122~22.04_amd64.deb"
	egz "${srcdir}/rocm-dev_6.1.3.60103-122~22.04_amd64.deb"
	egz "${srcdir}/hsa-amd-aqlprofile_1.0.0.60103.60103-122~22.04_amd64.deb"
	exz "${srcdir}/libdrm-amdgpu-amdgpu1_2.4.120.60102-1781449.22.04_amd64.deb"
	egz "${srcdir}/openmp-extras-runtime_17.60.0.60103-122~22.04_amd64.deb"
	egz "${srcdir}/rocm-gdb_14.1.60103-122~22.04_amd64.deb"
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
	ln -s "/opt/rocm-6.1.3" "$pkgdir/opt/rocm"
	#ln -s "/opt/rocm-6.1.3/hip/bin/.hipVersion" "$pkgdir/opt/rocm-6.1.3/bin/.hipVersion"

	mkdir -p "${pkgdir}/opt/amdgpu/share/libdrm"
	cd "${pkgdir}/opt/amdgpu/share/libdrm"
	ln -s /usr/share/libdrm/amdgpu.ids amdgpu.ids		

	mkdir -p ${pkgdir}/etc/OpenCL/vendors	
	echo libamdocl64.so > "${pkgdir}/etc/OpenCL/vendors/amdocl64.icd"
	echo libamdocl-orca64.so > "${pkgdir}/etc/OpenCL/vendors/amdocl-orca64.icd"

	mkdir -p ${pkgdir}/etc/ld.so.conf.d
	echo /opt/rocm-6.1.3/opencl/lib > "$pkgdir/etc/ld.so.conf.d/opencl-amd.conf"
	echo /opt/rocm-6.1.3/lib >> "$pkgdir/etc/ld.so.conf.d/opencl-amd.conf"
	echo /opt/rocm-6.1.3/hip/lib >> "$pkgdir/etc/ld.so.conf.d/opencl-amd.conf"

	mkdir -p ${pkgdir}/etc/profile.d
	echo export PATH="\${PATH}:/opt/rocm-6.1.3/bin:/opt/rocm-6.1.3/hip/bin" > "$pkgdir/etc/profile.d/opencl-amd.sh"
}
