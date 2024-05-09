# Maintainer: Carson Rueter <roachh at proton mail dot com>
# Co-Maintainer: George Sofianos

# Release notes https://rocm.docs.amd.com/en/latest/about/CHANGELOG.html#rocm-6-1-1
amdgpu_repo='https://repo.radeon.com/amdgpu/6.1.1/ubuntu'
rocm_repo='https://repo.radeon.com/rocm/apt/6.1.1'
opencl_lib='opt/rocm-6.1.1/opencl/lib'
rocm_lib='opt/rocm-6.1.1/lib'
hip_lib='opt/rocm-6.1.1/hip/lib/'
amdgpu="opt/amdgpu/lib/x86_64-linux-gnu"
amdgpu_pro="opt/amdgpu-pro/lib/x86_64-linux-gnu/"

pkgname=opencl-amd
pkgdesc="ROCm components repackaged from AMD's Ubuntu releases (ROCr runtime, ROCm runtime, HIP runtime) - This package is intended to work along with the free amdgpu stack."
pkgver=6.1.1
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
"https://repo.radeon.com/amdgpu/6.1.1/ubuntu/pool/main/libd/libdrm-amdgpu/libdrm-amdgpu-amdgpu1_2.4.120.60101-1769056.22.04_amd64.deb"
# ROCM
"https://repo.radeon.com/rocm/apt/6.1.1/pool/main/r/rocm-core/rocm-core_6.1.1.60101-90~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.1/pool/main/c/comgr/comgr_2.7.0.60101-90~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.1/pool/main/h/hipcc/hipcc_1.0.0.60101-90~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.1/pool/main/h/hip-dev/hip-dev_6.1.40092.60101-90~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.1/pool/main/h/hip-doc/hip-doc_6.1.40092.60101-90~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.1/pool/main/h/hip-samples/hip-samples_6.1.40092.60101-90~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.1/pool/main/h/hsakmt-roct-dev/hsakmt-roct-dev_20240125.5.08.60101-90~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.1/pool/main/h/hsa-rocr/hsa-rocr_1.13.0.60101-90~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.1/pool/main/h/hsa-rocr-dev/hsa-rocr-dev_1.13.0.60101-90~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.1/pool/main/r/rocminfo/rocminfo_1.0.0.60101-90~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.1/pool/main/h/hip-runtime-amd/hip-runtime-amd_6.1.40092.60101-90~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.1/pool/main/r/rocm-device-libs/rocm-device-libs_1.0.0.60101-90~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.1/pool/main/r/rocm-language-runtime/rocm-language-runtime_6.1.1.60101-90~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.1/pool/main/r/rocm-hip-runtime/rocm-hip-runtime_6.1.1.60101-90~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.1/pool/main/r/rocdecode/rocdecode_0.5.0.60101-90~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.1/pool/main/r/rocdecode-dev/rocdecode-dev_0.5.0.60101-90~22.04_amd64.deb"
#"https://repo.radeon.com/rocm/apt/6.1.1/pool/main/r/rocm-ocl-icd/rocm-ocl-icd_2.0.0.60101-90~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.1/pool/main/r/rocm-opencl-icd-loader/rocm-opencl-icd-loader_1.2.60101-90~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.1/pool/main/r/rocm-opencl/rocm-opencl_2.0.0.60101-90~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.1/pool/main/r/rocm-opencl-dev/rocm-opencl-dev_2.0.0.60101-90~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.1/pool/main/r/rocm-opencl-runtime/rocm-opencl-runtime_6.1.1.60101-90~22.04_amd64.deb"
# ROCM DEV
"https://repo.radeon.com/rocm/apt/6.1.1/pool/main/r/rocm-clang-ocl/rocm-clang-ocl_0.5.0.60101-90~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.1/pool/main/o/openmp-extras-runtime/openmp-extras-runtime_17.60.0.60101-90~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.1/pool/main/r/rocm-smi-lib/rocm-smi-lib_7.0.0.60101-90~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.1/pool/main/a/amd-smi-lib/amd-smi-lib_24.5.1.60101-90~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.1/pool/main/r/rocm-cmake/rocm-cmake_0.12.0.60101-90~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.1/pool/main/r/rocm-dbgapi/rocm-dbgapi_0.71.0.60101-90~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.1/pool/main/r/rocm-debug-agent/rocm-debug-agent_2.0.3.60101-90~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.1/pool/main/r/rocm-gdb/rocm-gdb_14.1.60101-90~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.1/pool/main/r/rocm-utils/rocm-utils_6.1.1.60101-90~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.1/pool/main/r/rocprofiler/rocprofiler_2.0.60101.60101-90~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.1/pool/main/r/rocprofiler-dev/rocprofiler-dev_2.0.60101.60101-90~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.1/pool/main/r/rocprofiler-plugins/rocprofiler-plugins_2.0.60101.60101-90~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.1/pool/main/r/rocprofiler-register/rocprofiler-register_0.3.0.60101-90~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.1/pool/main/r/roctracer/roctracer_4.1.60101.60101-90~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.1/pool/main/r/roctracer-dev/roctracer-dev_4.1.60101.60101-90~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.1/pool/main/r/rocm-dev/rocm-dev_6.1.1.60101-90~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.1/pool/main/h/hsa-amd-aqlprofile/hsa-amd-aqlprofile_1.0.0.60101.60101-90~22.04_amd64.deb"
# Proprietary
"https://repo.radeon.com/amdgpu/5.7.1/ubuntu/pool/proprietary/o/opencl-legacy-amdgpu-pro/opencl-legacy-amdgpu-pro-icd_23.20-1664987.22.04_amd64.deb"
)

sha256sums=(
"92c224e0b2c27b6c520399844a4d7a00c9d6002e293c3593478eeb7509d30ba4"

"10a79da60c07c9a9672ba39d57254a5e8536703757875dac3c6debc073cec797"
"993127f0cb67bd2aca156c053ed4d7f1e03c4b90b512fcdb3d06dd3937f5b4ce"
"ae8bd54070bde2c1e3cd8867e8f0dfba757d1068a5b9059628b882c39a483b40"
"c1ba40bbabcf31946b8b3bd13cb40cab7f852e96a86394c807a48e15eb13ec00"
"35b47626219c13d2fcdf0953d18770e77993e5d9a75fe90aecce1d3d49d02fad"
"a64e7426d70f6e3d8965dfa7f169b35a139722c5ebb4ad61732fe1e39a9704cc"
"9ad0ad4703984fd3e00c4f8d2ac63ef5e8d620c0592e9ed198e4cfb9e25d73bc"
"8e2d7cbef30a3f4bda1d2cc0b1dc56dad4838fe30cd7ad4756e2b8dcb5832ee9"
"8f55f517ca62e2a91e990e236dbadfdf574f716a1041fdc031e73b7908f1ed37"
"d2c8e57f09c1bda6e3c09c0872ec0244264a626b3fb748c220093ac4779d35e0"
"46059152779e3bee8c5432028ce0d09394149e3cae17fbb7bbf45fae90ea30a1"
"7f8f6780f99a538d8a15a6198881eb4fe1a8d0d50a36cb866668a3ea75b91dcc"
"79f4ae797cf964c81bf05dd3308d95cd2f9079b34ab22a153e63df2c6f3d4362"
"b92e5770be925da6d1b470d3118d497726fe007b35d806160fa2b5cd4378ac32"
"6d730d27db0261240fe26838a4ea5c8e7eab4596d773929aaaaf0f36e9ae377d"
"94db7e5a3007cad7cdc12bbbc3524b45e035ca7114705e328a3fb6b7118e760c"
"58552bdc7748129a5e41087f80cbce2658007f22fff0bde48e93d114737cadff"
"c072118d2414ad70bc1e21a27e6092a3e25351a912c4bddd3201802d4cd65547"
"7f1ad80d8ef0c94b054a15041b028cff412e20651d05b202795e480d1394dad0"
"fe33b263bed9017030d9c41dc05d687b818470f1074aa072a40dde26d128a63d"

"3e9b8d103a13a5cb20074d69a089e95067a09050ea826b52145d223b90fd7c24"
"bcc28c4ab5c14936850309ea05122a2fb116f35c2cb26c26873090428b5ceb61"
"f639f2334a70270918593257df02bc275e2fd7582a02bbc6bb5cc9d03d1e9ce6"
"c1ff5a0dfa8f56fd7ab1ac9ec62c109a8b9e234831fd69fd3c6816dd05136b2d"
"37562a5512da60c3a78cda9faae1ec709bc13a2483c7b34f485fafba925e0fc9"
"ff6e16833ec2262bd80c87c0f4e4c9c8d9ac8dab95679ec13abed73daae2ad54"
"e67b86bf22c24fa96c73d4e3c9a3a16daf305322af515f514b77518db62bfec2"
"1c5bee24b1503a95ca966b9d1b4fe77ab18b4c60e2f578e1f9af473886b0b084"
"8522a4e8fa7df4c1b8b6eb2c24bb269a75c81399cfc892722622afd1e6df5a24"
"fe3fe9add783c04b5b08bed5f36d680447297d54d493ccd89b501c412bc4e51d"
"8988592d5617bb1b242933f805abb576d21fedc9225740ff149e7b3419ea2a70"
"042332f08eac76e6b469bf6b74e232c62b73a60a21cc55ac60cb84afe22bf01e"
"252156b90310b93440fc7e4003291ef676e81ef4ac42be031c7b06d1abc580ed"
"9244e194dcc4682af4413e7e20c9fcf9fa861d83f019af4b878576c9f823931a"
"836c9e66cce4fa91753dd819191f9479f3c2f1f89f6e4f1cb5e203e4ff42b20d"
"45b23f7cffa6b1f89ddfba8107ac9508ebe570e82c17a173b231b800897d9406"
"7e7f85170ecfbb82e5cbe01cecf19803238d7fd285aca470f0daea5266024057"
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
	egz "${srcdir}/rocm-core_6.1.1.60101-90~22.04_amd64.deb"
	egz "${srcdir}/comgr_2.7.0.60101-90~22.04_amd64.deb"
	egz "${srcdir}/hipcc_1.0.0.60101-90~22.04_amd64.deb"
	egz "${srcdir}/hip-dev_6.1.40092.60101-90~22.04_amd64.deb"
	egz "${srcdir}/hip-doc_6.1.40092.60101-90~22.04_amd64.deb"
	egz "${srcdir}/hip-samples_6.1.40092.60101-90~22.04_amd64.deb"
	egz "${srcdir}/hsakmt-roct-dev_20240125.5.08.60101-90~22.04_amd64.deb"
	egz "${srcdir}/hsa-rocr_1.13.0.60101-90~22.04_amd64.deb"
	egz "${srcdir}/hsa-rocr-dev_1.13.0.60101-90~22.04_amd64.deb"
	egz "${srcdir}/rocminfo_1.0.0.60101-90~22.04_amd64.deb"
	egz "${srcdir}/hip-runtime-amd_6.1.40092.60101-90~22.04_amd64.deb"
	egz "${srcdir}/rocm-device-libs_1.0.0.60101-90~22.04_amd64.deb"
	egz "${srcdir}/rocm-language-runtime_6.1.1.60101-90~22.04_amd64.deb"
	egz "${srcdir}/rocm-hip-runtime_6.1.1.60101-90~22.04_amd64.deb"
	egz "${srcdir}/rocdecode_0.5.0.60101-90~22.04_amd64.deb"
	egz "${srcdir}/rocdecode-dev_0.5.0.60101-90~22.04_amd64.deb"
	#egz "${srcdir}/rocm-ocl-icd_2.0.0.60101-90~22.04_amd64.deb"
	egz "${srcdir}/rocm-opencl-icd-loader_1.2.60101-90~22.04_amd64.deb"
	egz "${srcdir}/rocm-opencl_2.0.0.60101-90~22.04_amd64.deb"
	egz "${srcdir}/rocm-opencl-dev_2.0.0.60101-90~22.04_amd64.deb"
	egz "${srcdir}/rocm-opencl-runtime_6.1.1.60101-90~22.04_amd64.deb"
	exz "${srcdir}/rocm-clang-ocl_0.5.0.60101-90~22.04_amd64.deb"
	egz "${srcdir}/rocm-smi-lib_7.0.0.60101-90~22.04_amd64.deb"
	egz "${srcdir}/amd-smi-lib_24.5.1.60101-90~22.04_amd64.deb"
	exz "${srcdir}/rocm-cmake_0.12.0.60101-90~22.04_amd64.deb"
	egz "${srcdir}/rocm-dbgapi_0.71.0.60101-90~22.04_amd64.deb"
	egz "${srcdir}/rocm-debug-agent_2.0.3.60101-90~22.04_amd64.deb"
	egz "${srcdir}/rocm-utils_6.1.1.60101-90~22.04_amd64.deb"
	egz "${srcdir}/rocprofiler_2.0.60101.60101-90~22.04_amd64.deb"
	egz "${srcdir}/rocprofiler-dev_2.0.60101.60101-90~22.04_amd64.deb"
	egz "${srcdir}/rocprofiler-plugins_2.0.60101.60101-90~22.04_amd64.deb"
	egz "${srcdir}/rocprofiler-register_0.3.0.60101-90~22.04_amd64.deb"
	egz "${srcdir}/roctracer_4.1.60101.60101-90~22.04_amd64.deb"
	egz "${srcdir}/roctracer-dev_4.1.60101.60101-90~22.04_amd64.deb"
	egz "${srcdir}/rocm-dev_6.1.1.60101-90~22.04_amd64.deb"
	egz "${srcdir}/hsa-amd-aqlprofile_1.0.0.60101.60101-90~22.04_amd64.deb"
	exz "${srcdir}/libdrm-amdgpu-amdgpu1_2.4.120.60101-1769056.22.04_amd64.deb"
	egz "${srcdir}/openmp-extras-runtime_17.60.0.60101-90~22.04_amd64.deb"
	egz "${srcdir}/rocm-gdb_14.1.60101-90~22.04_amd64.deb"
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
	ln -s "/opt/rocm-6.1.1" "$pkgdir/opt/rocm"
	#ln -s "/opt/rocm-6.1.1/hip/bin/.hipVersion" "$pkgdir/opt/rocm-6.1.1/bin/.hipVersion"

	mkdir -p "${pkgdir}/opt/amdgpu/share/libdrm"
	cd "${pkgdir}/opt/amdgpu/share/libdrm"
	ln -s /usr/share/libdrm/amdgpu.ids amdgpu.ids		

	mkdir -p ${pkgdir}/etc/OpenCL/vendors	
	echo libamdocl64.so > "${pkgdir}/etc/OpenCL/vendors/amdocl64.icd"
	echo libamdocl-orca64.so > "${pkgdir}/etc/OpenCL/vendors/amdocl-orca64.icd"

	mkdir -p ${pkgdir}/etc/ld.so.conf.d
	echo /opt/rocm-6.1.1/opencl/lib > "$pkgdir/etc/ld.so.conf.d/opencl-amd.conf"
	echo /opt/rocm-6.1.1/lib >> "$pkgdir/etc/ld.so.conf.d/opencl-amd.conf"
	echo /opt/rocm-6.1.1/hip/lib >> "$pkgdir/etc/ld.so.conf.d/opencl-amd.conf"

	mkdir -p ${pkgdir}/etc/profile.d
	echo export PATH="\${PATH}:/opt/rocm-6.1.1/bin:/opt/rocm-6.1.1/hip/bin" > "$pkgdir/etc/profile.d/opencl-amd.sh"
}
