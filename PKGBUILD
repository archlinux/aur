# Maintainer: Carson Rueter <roachh at proton mail dot com>
# Co-Maintainer: George Sofianos

# Release notes https://rocm.docs.amd.com/en/latest/about/release-notes.html
_amdgpu_repo='https://repo.radeon.com/amdgpu/6.3.2/ubuntu'
_rocm_repo='https://repo.radeon.com/rocm/apt/6.3.2'
_opencl_lib='opt/rocm-6.3.2/opencl/lib'
_rocm_lib='opt/rocm-6.3.2/lib'
_hip_lib='opt/rocm-6.3.2/hip/lib/'
_amdgpu="opt/amdgpu/lib/x86_64-linux-gnu"
_amdgpu_pro="opt/amdgpu-pro/lib/x86_64-linux-gnu/"

pkgname=opencl-amd
pkgdesc="ROCm components repackaged from AMD's Ubuntu releases (ROCr runtime, ROCm runtime, HIP runtime) - This package is intended to work along with the free amdgpu stack."
pkgver=6.3.2
pkgrel=1
epoch=1
arch=('x86_64')
url='http://www.amd.com'
license=('custom:AMD')
makedepends=('wget')
depends=('libdrm' 'ocl-icd' 'gcc-libs' 'numactl')
provides=('opencl-driver' 'libdrm-amdgpu-amdgpu1' 'rocm-core' 'comgr' 'hip' 'hipcc' 'hip-dev' 'hip-doc' 'hip-samples' 'hsa-rocr' 'hsa-rocr-dev' 'rocminfo' 'hip-runtime-amd' 'rocm-device-libs' 'rocm-language-runtime' 
	'rocm-hip-runtime' 'rocdecode' 'rocdecode-dev' 'rocjpeg' 'rocjpeg-dev' 'rocm-ocl-icd' 'rocm-opencl-icd-loader' 'rocm-opencl' 'rocm-opencl-dev' 'rocm-opencl-runtime' 'rocm-dbgapi' 'rocm-debug-agent' 'rocm-gdb' 'rocprofiler' 'rocprofiler-dev' 'rocprofiler-plugins'
	'rocprofiler-register' 'roctracer' 'roctracer-dev' 'hsa-amd-aqlprofile' 'openmp-extras-runtime' 'rocm-cmake' 'rocm-utils' 'rocm-smi-lib' 'amd-smi-lib')
conflicts=('rocm-opencl-runtime' 'libdrm-amdgpu-amdgpu1' 'rocm-core' 'comgr' 'hip' 'hipcc' 'hip-dev' 'hip-doc' 'hip-samples' 'hsa-rocr' 'hsa-rocr-dev' 'rocminfo' 'hip-runtime-amd' 'rocm-device-libs' 'rocm-language-runtime' 
	'rocm-hip-runtime' 'rocdecode' 'rocdecode-dev' 'rocjpeg' 'rocjpeg-dev' 'rocm-ocl-icd' 'rocm-opencl-icd-loader' 'rocm-opencl' 'rocm-opencl-dev' 'rocm-opencl-runtime' 'rocm-dbgapi' 'rocm-debug-agent' 'rocm-gdb' 'rocprofiler' 'rocprofiler-dev' 'rocprofiler-plugins'
	'rocprofiler-register' 'roctracer' 'roctracer-dev' 'hsa-amd-aqlprofile' 'openmp-extras-runtime' 'rocm-cmake' 'rocm-utils' 'rocm-smi-lib' 'amd-smi-lib')
optdepends=('clinfo' 'opencl-amd-dev')

source=(
# LIBDRM
"https://repo.radeon.com/amdgpu/6.3.2/ubuntu/pool/main/libd/libdrm-amdgpu/libdrm-amdgpu-amdgpu1_2.4.123.60302-2109964.24.04_amd64.deb"
# ROCM
"https://repo.radeon.com/rocm/apt/6.3.2/pool/main/r/rocm-core/rocm-core_6.3.2.60302-66~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3.2/pool/main/c/comgr/comgr_2.8.0.60302-66~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3.2/pool/main/h/hipcc/hipcc_1.1.1.60302-66~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3.2/pool/main/h/hip-dev/hip-dev_6.3.42134.60302-66~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3.2/pool/main/h/hip-doc/hip-doc_6.3.42134.60302-66~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3.2/pool/main/h/hip-samples/hip-samples_6.3.42134.60302-66~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3.2/pool/main/h/hsa-rocr/hsa-rocr_1.14.0.60302-66~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3.2/pool/main/h/hsa-rocr-dev/hsa-rocr-dev_1.14.0.60302-66~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3.2/pool/main/r/rocminfo/rocminfo_1.0.0.60302-66~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3.2/pool/main/h/hip-runtime-amd/hip-runtime-amd_6.3.42134.60302-66~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3.2/pool/main/r/rocm-device-libs/rocm-device-libs_1.0.0.60302-66~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3.2/pool/main/r/rocm-language-runtime/rocm-language-runtime_6.3.2.60302-66~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3.2/pool/main/r/rocm-hip-runtime/rocm-hip-runtime_6.3.2.60302-66~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3.2/pool/main/r/rocdecode/rocdecode_0.8.0.60302-66~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3.2/pool/main/r/rocdecode-dev/rocdecode-dev_0.8.0.60302-66~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3.2/pool/main/r/rocjpeg/rocjpeg_0.6.0.60302-66~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3.2/pool/main/r/rocjpeg-dev/rocjpeg-dev_0.6.0.60302-66~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3.2/pool/main/r/rocm-opencl/rocm-opencl_2.0.0.60302-66~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3.2/pool/main/r/rocm-opencl-dev/rocm-opencl-dev_2.0.0.60302-66~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3.2/pool/main/r/rocm-opencl-runtime/rocm-opencl-runtime_6.3.2.60302-66~24.04_amd64.deb"
# ROCM DEV
"https://repo.radeon.com/rocm/apt/6.3.2/pool/main/o/openmp-extras-runtime/openmp-extras-runtime_18.63.0.60302-66~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3.2/pool/main/r/rocm-smi-lib/rocm-smi-lib_7.4.0.60302-66~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3.2/pool/main/a/amd-smi-lib/amd-smi-lib_24.7.1.60302-66~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3.2/pool/main/r/rocm-cmake/rocm-cmake_0.14.0.60302-66~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3.2/pool/main/r/rocm-dbgapi/rocm-dbgapi_0.77.0.60302-66~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3.2/pool/main/r/rocm-debug-agent/rocm-debug-agent_2.0.3.60302-66~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3.2/pool/main/r/rocm-gdb/rocm-gdb_15.2.60302-66~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3.2/pool/main/r/rocm-utils/rocm-utils_6.3.2.60302-66~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3.2/pool/main/r/rocprofiler/rocprofiler_2.0.60302.60302-66~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3.2/pool/main/r/rocprofiler-dev/rocprofiler-dev_2.0.60302.60302-66~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3.2/pool/main/r/rocprofiler-plugins/rocprofiler-plugins_2.0.60302.60302-66~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3.2/pool/main/r/rocprofiler-register/rocprofiler-register_0.4.0.60302-66~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3.2/pool/main/r/roctracer/roctracer_4.1.60302.60302-66~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3.2/pool/main/r/roctracer-dev/roctracer-dev_4.1.60302.60302-66~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3.2/pool/main/r/rocm-dev/rocm-dev_6.3.2.60302-66~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3.2/pool/main/h/hsa-amd-aqlprofile/hsa-amd-aqlprofile_1.0.0.60302-66~24.04_amd64.deb"
# Proprietary
"https://repo.radeon.com/amdgpu/5.7.1/ubuntu/pool/proprietary/o/opencl-legacy-amdgpu-pro/opencl-legacy-amdgpu-pro-icd_23.20-1664987.22.04_amd64.deb"
)

sha256sums=(
"ae5aa108baffbdb17269d6585ac01c7cb842848a96a9482015df10a5575f3539"

"be601f2ed1cb42a7bce9bb9b62de21cca47fec3ed487026b4ebed8b6addc9635"
"af57914c31bb3a76eb510a613b936aa4d93ab4dd58e23b0c9b06b4d30e7621b0"
"070ad4fea5f33eaa9b3806073fe8404958be71a977d3fb580a2ef5c92d70bb01"
"5dc8fb9e612d98f8c5b5d0c4f07f5f4e6ecd4dfe09967e3fddb92231e3097fac"
"30631448936a2a83506476ff1edd95a632623724491e9d5d72ff1e41701f2f07"
"b30fc75d9ea4cfa3b8dfa5c9c6784b6953236c110b5039d5afb118e11585b1b3"
"e22eadaf33be15db9b6d4e77b3ff7fbe1a0baf68e2e38fe6314aefabedcefe62"
"ecc6f7e106c5066beccec9edc22ee6ce7373141cf72f89797b5361b5aa212924"
"a3a483c4563f5fb7c1416b16889f2220add8029d10157a262776e3cfefec816b"
"82fc33ab59342c74ef79e7483725fc13dc845966dffbcb6dec806ae6ec100370"
"1bde59c94f1d77b0a17b98fecf24d38a7088675ea5d4a6a0a5db82a758003934"
"b908aa237ed615fb6c3854a4d930bfdc18d3f0c1e925dd7baefe847f2f93c6ce"
"af4ff836ba4258a88494094449423539500b0de8caf61a31df4d7c0a86edde2a"
"a33bbe54f5a66984376c6c03c182fb8e6edd027a5d783b18d642255d7fda8369"
"468cbbdc889e7a972a2d6b0f059f3ce04fc71bb74782a2ba7eaad7f7a8fa6651"
"82a16ef1d6fc3a8baf89e73e3fc75412d0648cf1a255bedc6a2690589b5d4fac"
"ebabf3473472d30a6f8e15c3a9c62ddbcc68215524ec49f22f817195715e5772"
"9da65a42173beef64d865823d0b080fb7269b264505dacff847841b82c44a041"
"93f546502ae32a77cf0f5abc5e8f6d2c182b14e7daf518751fc3196a0fc14173"
"001a6cc94b1d32467b5f27c6c433791784a958943ed5b31c250fa07b5424e746"
# ROCM DEV
"a4f9f0e9c1f5f52600c7a26f3ef194976adea6fa7f34d636f7553cbed96bd5e2"
"fd16d33e0441694b9a7b228d1ff995d2cdbd712ab6cf5b9f25f458873b48e227"
"493a4a48ef78fc696804de44ed97a3f0ea9dda766068ee2d0f6f4243bac49783"
"453901ecc62d0f3b9869725484bdd98823d4a337d26841650c199ae01a63ddd5"
"ef0d066539661f130239d069468915f0894ad41594d1b78536624e524246a17c"
"c3f8f29da2255533e77b43df5a1a568bf096ce8c77875ef302b3bd87c3576e02"
"80425abf6f2b950ec1ab3d46d6da4b05f2ee11253e5d4a55d963229ce4dd3ac9"
"ab93d8c7f26c805b40bdfd2e55b6cd3a3e277eb7c3ffa99980f69b4daed8cf78"
"ba528d974bb4cd9f4f26cf3a89e069efee360786952586948683938679bbf3a4"
"3d2c56fd2c779219e660392b5ea8a27e54036316e9c4bde2b4ff44e0c81cd18a"
"2907c1e10b89e18e55006b80f50b7a4dc5358bacf533c5fa0436c0245d1e7575"
"c5a46f8076f1b36db909e2259c606800ba73d64cebe51ef5c54b706b7a1eebe9"
"4ced553c4359678924877682c53356c3efb48535abd2368b7210e776beeb3120"
"4756b7fc107bb25f915bc6ca357ddc023412e1419adcf9f5e4e72a6cc002a985"
"b647b880c87d3afe0c948058443beb47ac7ed3c7587137441980618e2d78769f"
"0a4a924cdde49cde8ebca113c5cd8f89c0d7cf403dd22d4dca12c1e1ff5e7ad6"
# Proprietary
"194bf41a21b40f8305f532818a5d2491dca0f6f0750b3d2b538c54f57dbb2dfd"
)

package() {
	for p in *.deb; do
		ar x "${p}"
		if [[ -f data.tar.gz ]]; then
			# echo gz: "${srcdir}/${p}"
			tar xfx data.tar.gz
			rm data.tar.gz
		elif [[ -f data.tar.xz ]]; then
			# echo xz: "${srcdir}/${p}"
			tar xJf data.tar.xz
			rm data.tar.xz
		fi
	done

	cd "${srcdir}/${_amdgpu_pro}"
	sed -i "s|libdrm_amdgpu|libdrm_amdgpo|g" libamdocl-orca64.so

	cd "${srcdir}/${_amdgpu}"
	rm "libdrm_amdgpu.so.1"
	mv "libdrm_amdgpu.so.1.123.0" "libdrm_amdgpo.so.1.0.0"
	ln -s "libdrm_amdgpo.so.1.0.0" "libdrm_amdgpo.so.1"	

	# legacy
	mkdir -p "${pkgdir}/usr/lib"
	mv "${srcdir}/${_amdgpu_pro}/libamdocl-orca64.so" "${pkgdir}/usr/lib/"
	mv "${srcdir}/${_amdgpu}/libdrm_amdgpo.so.1.0.0" "${pkgdir}/usr/lib/"
	mv "${srcdir}/${_amdgpu}/libdrm_amdgpo.so.1" "${pkgdir}/usr/lib/"

	mv "${srcdir}/opt/" "${pkgdir}/"
	mv "${pkgdir}/opt/rocm-6.3.2" "${pkgdir}/opt/rocm"	

	mkdir -p "${pkgdir}/opt/amdgpu/share/libdrm"
	cd "${pkgdir}/opt/amdgpu/share/libdrm"
	ln -s /usr/share/libdrm/amdgpu.ids amdgpu.ids		

	mkdir -p "${pkgdir}/etc/OpenCL/vendors"
	echo libamdocl64.so > "${pkgdir}/etc/OpenCL/vendors/amdocl64.icd"
	echo libamdocl-orca64.so > "${pkgdir}/etc/OpenCL/vendors/amdocl-orca64.icd"

	mkdir -p "${pkgdir}/etc/ld.so.conf.d"
	# echo /opt/rocm/opencl/lib > "$pkgdir/etc/ld.so.conf.d/opencl-amd.conf"
	echo /opt/rocm/lib >> "$pkgdir/etc/ld.so.conf.d/opencl-amd.conf"
	echo /opt/rocm/hip/lib >> "$pkgdir/etc/ld.so.conf.d/opencl-amd.conf"

	mkdir -p "${pkgdir}/etc/profile.d"
	echo export PATH="\${PATH}:/opt/rocm/bin:/opt/rocm/hip/bin" > "$pkgdir/etc/profile.d/opencl-amd.sh"
}
