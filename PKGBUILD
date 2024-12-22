# Maintainer: Carson Rueter <roachh at proton mail dot com>
# Co-Maintainer: George Sofianos

# Release notes https://rocm.docs.amd.com/en/latest/about/release-notes.html
_amdgpu_repo='https://repo.radeon.com/amdgpu/6.3.1/ubuntu'
_rocm_repo='https://repo.radeon.com/rocm/apt/6.3.1'
_opencl_lib='opt/rocm-6.3.1/opencl/lib'
_rocm_lib='opt/rocm-6.3.1/lib'
_hip_lib='opt/rocm-6.3.1/hip/lib/'
_amdgpu="opt/amdgpu/lib/x86_64-linux-gnu"
_amdgpu_pro="opt/amdgpu-pro/lib/x86_64-linux-gnu/"

pkgname=opencl-amd
pkgdesc="ROCm components repackaged from AMD's Ubuntu releases (ROCr runtime, ROCm runtime, HIP runtime) - This package is intended to work along with the free amdgpu stack."
pkgver=6.3.1
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
"https://repo.radeon.com/amdgpu/6.3.1/ubuntu/pool/main/libd/libdrm-amdgpu/libdrm-amdgpu-amdgpu1_2.4.123.60301-2095006.24.04_amd64.deb"
# ROCM
"https://repo.radeon.com/rocm/apt/6.3.1/pool/main/r/rocm-core/rocm-core_6.3.1.60301-48~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3.1/pool/main/c/comgr/comgr_2.8.0.60301-48~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3.1/pool/main/h/hipcc/hipcc_1.1.1.60301-48~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3.1/pool/main/h/hip-dev/hip-dev_6.3.42133.60301-48~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3.1/pool/main/h/hip-doc/hip-doc_6.3.42133.60301-48~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3.1/pool/main/h/hip-samples/hip-samples_6.3.42133.60301-48~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3.1/pool/main/h/hsa-rocr/hsa-rocr_1.14.0.60301-48~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3.1/pool/main/h/hsa-rocr-dev/hsa-rocr-dev_1.14.0.60301-48~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3.1/pool/main/r/rocminfo/rocminfo_1.0.0.60301-48~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3.1/pool/main/h/hip-runtime-amd/hip-runtime-amd_6.3.42133.60301-48~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3.1/pool/main/r/rocm-device-libs/rocm-device-libs_1.0.0.60301-48~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3.1/pool/main/r/rocm-language-runtime/rocm-language-runtime_6.3.1.60301-48~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3.1/pool/main/r/rocm-hip-runtime/rocm-hip-runtime_6.3.1.60301-48~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3.1/pool/main/r/rocdecode/rocdecode_0.8.0.60301-48~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3.1/pool/main/r/rocdecode-dev/rocdecode-dev_0.8.0.60301-48~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3.1/pool/main/r/rocjpeg/rocjpeg_0.6.0.60301-48~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3.1/pool/main/r/rocjpeg-dev/rocjpeg-dev_0.6.0.60301-48~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3.1/pool/main/r/rocm-opencl/rocm-opencl_2.0.0.60301-48~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3.1/pool/main/r/rocm-opencl-dev/rocm-opencl-dev_2.0.0.60301-48~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3.1/pool/main/r/rocm-opencl-runtime/rocm-opencl-runtime_6.3.1.60301-48~24.04_amd64.deb"
# ROCM DEV
"https://repo.radeon.com/rocm/apt/6.3.1/pool/main/o/openmp-extras-runtime/openmp-extras-runtime_18.63.0.60301-48~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3.1/pool/main/r/rocm-smi-lib/rocm-smi-lib_7.4.0.60301-48~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3.1/pool/main/a/amd-smi-lib/amd-smi-lib_24.7.1.60301-48~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3.1/pool/main/r/rocm-cmake/rocm-cmake_0.14.0.60301-48~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3.1/pool/main/r/rocm-dbgapi/rocm-dbgapi_0.77.0.60301-48~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3.1/pool/main/r/rocm-debug-agent/rocm-debug-agent_2.0.3.60301-48~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3.1/pool/main/r/rocm-gdb/rocm-gdb_15.2.60301-48~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3.1/pool/main/r/rocm-utils/rocm-utils_6.3.1.60301-48~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3.1/pool/main/r/rocprofiler/rocprofiler_2.0.60301.60301-48~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3.1/pool/main/r/rocprofiler-dev/rocprofiler-dev_2.0.60301.60301-48~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3.1/pool/main/r/rocprofiler-plugins/rocprofiler-plugins_2.0.60301.60301-48~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3.1/pool/main/r/rocprofiler-register/rocprofiler-register_0.4.0.60301-48~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3.1/pool/main/r/roctracer/roctracer_4.1.60301.60301-48~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3.1/pool/main/r/roctracer-dev/roctracer-dev_4.1.60301.60301-48~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3.1/pool/main/r/rocm-dev/rocm-dev_6.3.1.60301-48~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3.1/pool/main/h/hsa-amd-aqlprofile/hsa-amd-aqlprofile_1.0.0.60301-48~24.04_amd64.deb"
# Proprietary
"https://repo.radeon.com/amdgpu/5.7.1/ubuntu/pool/proprietary/o/opencl-legacy-amdgpu-pro/opencl-legacy-amdgpu-pro-icd_23.20-1664987.22.04_amd64.deb"
)

sha256sums=(
"e4a2a6f7f76d8140871f3628af954269948de0288feb0cdf10f3d44c2421474b"

"c199b72b0ce0f6a28f1f512e7c0a7d3f08847be67fcc63fd46ef67877e4c8afe"
"c954cc0aba93c183c0762494cc731b916fdfaa42b52fcc60701b18ffea152b8d"
"aa7cdc19e2344b0247757d21d12975462b1afa4235ccae10276e85bcebd77022"
"e3b0a1d6971c3f52903a5c3649044fba6059a41e19b3331c78e3db48a7b61882"
"88b844319c57926fcad0f7e34fbbdb853f40631743e71a357e3d48d62fef45b8"
"ac87c534574be6cb0517de0f79be0cf9bdb3938b29007a6f88fa5164466f990f"
"8e417b0b800b4bcf1a05cdac166147e5ffa92625d9d72075b69319dc3acf8729"
"3080d9727cd50d44b6ee46055b29aa5d2280406527065d3530094c8518bd05e1"
"586c9c44b75d88f1321859e3ce79a241d67c96a1bb028cf4db339ef6b1527e86"
"06328a4fbf56062abb97b1fedd78953542691019b5ed628ef1110d93a4a20685"
"147a46871545777a4fa39bf3a3aacbd53773525318bd554eca01d07c717d5c3d"
"433823f097eb9579ea5ca1443e297f22ae3caedf5196550e644a465a55875886"
"315e35749aba1d68eb8be74f5428b01ff32159d4bab96e856bad068f2687cd53"
"20dcafed943c8e3f32ef2fb4f9b5a9feda60cf8940e20067ff4af8ee3f5ee084"
"6101ee1d0a5c0f8b59d3d2574a2a0619d5c25ad69e3b4091cee030cfc89a8e8b"
"6948956167a00d36f6a15f7e2b2339d69365bbeb530e26684ce213d0493cc79c"
"a891d4bf9fbad175af672ae3bd63f4a9c8b6b1b5e069bba2b184a8048ae23135"
"c0faa304f59fd7e070c2abaf8b26cef5963d80c77f11d738d2f2959035f7d433"
"409fcde0423ca10a025f07d52d854f03d26857a60cc621aa50c1ae907a6879bf"
"0d1d914a29f4eba76ee77a06483d6bca72a39f06ea729205f9b52fac9baf73ee"
# ROCM DEV
"5b71cc62de0e3efff22944f8539f85b03c8bd19f65bded741720c26b4ac4e17d"
"755d95abfb13f07252accfebd97521e39ce21d5ec49f23721419eccf91e66e5d"
"78b3c8fd3dd23e52b292700b24882d9ddc9cbeaddaf03f6969a6c3dc9be37682"
"03cbbb49d4d2340fa5ad73d2a0667f21828faf1b6b43bf333e9447e0bbbc735a"
"cdfd3a5a585223446caab8eb27ae3dfdecc44a84c863122151eca25f1a9a4f62"
"62cf7f3ea031ac28e5317af3b6d29faff45484ebb6ca7a33db5863803af1c9e2"
"ddd7a76b5d29fb10a99785112cd1426f18196bde1c774a57e7e2f7a2d387cb4b"
"d31df5d5f6105212e6e82a244ccee210d1bcfe01c3509f24fe0384f6e534dbdc"
"608ac7fbfde14e1a59de6d1ead88886e64018612f0c53518aecfef5b9b0ae7c4"
"bc876a7645fe1d3c0106bbc6fa76c26b720e445db1eb100aaa380a5e49712799"
"f96d3193d270f1bb17a81c1b2e81bcc642f5cf22c0c0ac1f98b3772daae97010"
"d66ef249f806d3fa4a2fda2cbe147f4154fd7a9f8ff475c1fc4ae96b443d0b33"
"56d48f8414bf26504907acb483c5f4b66c679a0cc1d43b9f0f2e5c4c3bd276b6"
"7e860bdb09a9965717049f9e94020b99d50f00b11d7363711e3a395834179e83"
"82c3f216e382515284b687edbd0f12744da41c87935d2aa986beea5df6358f99"
"f7bc4495eaa18a82acc434caeafaba2b2952a8bcc8eda239a1a9658c1037291f"
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
	mv "${pkgdir}/opt/rocm-6.3.1" "${pkgdir}/opt/rocm"	

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
