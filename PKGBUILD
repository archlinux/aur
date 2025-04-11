# Maintainer: Carson Rueter <roachh at proton mail dot com>
# Co-Maintainer: George Sofianos

# Release notes https://rocm.docs.amd.com/en/latest/about/release-notes.html
_amdgpu_repo='https://repo.radeon.com/amdgpu/6.4/ubuntu'
_rocm_repo='https://repo.radeon.com/rocm/apt/6.4'
_opencl_lib='opt/rocm-6.4.0/opencl/lib'
_rocm_lib='opt/rocm-6.4.0/lib'
_hip_lib='opt/rocm-6.4.0/hip/lib/'
_amdgpu="opt/amdgpu/lib/x86_64-linux-gnu"
_amdgpu_pro="opt/amdgpu-pro/lib/x86_64-linux-gnu/"

pkgname=opencl-amd
pkgdesc="ROCm components repackaged from AMD's Ubuntu releases (ROCr runtime, ROCm runtime, HIP runtime) - This package is intended to work along with the free amdgpu stack."
pkgver=6.4.0
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
"https://repo.radeon.com/amdgpu/6.4/ubuntu/pool/main/libd/libdrm-amdgpu/libdrm-amdgpu-amdgpu1_2.4.124.60400-2147987.24.04_amd64.deb"
# ROCM
"https://repo.radeon.com/rocm/apt/6.4/pool/main/r/rocm-core/rocm-core_6.4.0.60400-47~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4/pool/main/c/comgr/comgr_3.0.0.60400-47~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4/pool/main/h/hipcc/hipcc_1.1.1.60400-47~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4/pool/main/h/hip-dev/hip-dev_6.4.43482.60400-47~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4/pool/main/h/hip-doc/hip-doc_6.4.43482.60400-47~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4/pool/main/h/hip-samples/hip-samples_6.4.43482.60400-47~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4/pool/main/h/hsa-rocr/hsa-rocr_1.15.0.60400-47~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4/pool/main/h/hsa-rocr-dev/hsa-rocr-dev_1.15.0.60400-47~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4/pool/main/r/rocminfo/rocminfo_1.0.0.60400-47~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4/pool/main/h/hip-runtime-amd/hip-runtime-amd_6.4.43482.60400-47~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4/pool/main/r/rocm-device-libs/rocm-device-libs_1.0.0.60400-47~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4/pool/main/r/rocm-language-runtime/rocm-language-runtime_6.4.0.60400-47~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4/pool/main/r/rocm-hip-runtime/rocm-hip-runtime_6.4.0.60400-47~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4/pool/main/r/rocdecode/rocdecode_0.10.0.60400-47~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4/pool/main/r/rocdecode-dev/rocdecode-dev_0.10.0.60400-47~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4/pool/main/r/rocjpeg/rocjpeg_0.8.0.60400-47~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4/pool/main/r/rocjpeg-dev/rocjpeg-dev_0.8.0.60400-47~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4/pool/main/r/rocm-opencl/rocm-opencl_2.0.0.60400-47~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4/pool/main/r/rocm-opencl-dev/rocm-opencl-dev_2.0.0.60400-47~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4/pool/main/r/rocm-opencl-runtime/rocm-opencl-runtime_6.4.0.60400-47~24.04_amd64.deb"
# ROCM DEV
"https://repo.radeon.com/rocm/apt/6.4/pool/main/o/openmp-extras-runtime/openmp-extras-runtime_18.63.0.60400-47~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4/pool/main/r/rocm-smi-lib/rocm-smi-lib_7.5.0.60400-47~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4/pool/main/a/amd-smi-lib/amd-smi-lib_25.3.0.60400-47~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4/pool/main/r/rocm-cmake/rocm-cmake_0.14.0.60400-47~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4/pool/main/r/rocm-dbgapi/rocm-dbgapi_0.77.2.60400-47~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4/pool/main/r/rocm-debug-agent/rocm-debug-agent_2.0.4.60400-47~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4/pool/main/r/rocm-gdb/rocm-gdb_15.2.60400-47~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4/pool/main/r/rocm-utils/rocm-utils_6.4.0.60400-47~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4/pool/main/r/rocprofiler/rocprofiler_2.0.60400.60400-47~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4/pool/main/r/rocprofiler-dev/rocprofiler-dev_2.0.60400.60400-47~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4/pool/main/r/rocprofiler-plugins/rocprofiler-plugins_2.0.60400.60400-47~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4/pool/main/r/rocprofiler-register/rocprofiler-register_0.4.0.60400-47~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4/pool/main/r/roctracer/roctracer_4.1.60400.60400-47~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4/pool/main/r/roctracer-dev/roctracer-dev_4.1.60400.60400-47~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4/pool/main/r/rocm-dev/rocm-dev_6.4.0.60400-47~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.4/pool/main/h/hsa-amd-aqlprofile/hsa-amd-aqlprofile_1.0.0.60400-47~24.04_amd64.deb"
# Proprietary
"https://repo.radeon.com/amdgpu/5.7.1/ubuntu/pool/proprietary/o/opencl-legacy-amdgpu-pro/opencl-legacy-amdgpu-pro-icd_23.20-1664987.22.04_amd64.deb"
)

sha256sums=(
"4a2dac6edbdf389c826b36e64de96fbcd709914183205d41fe048a5cf4a44da0"

"0fe2cfc9d58fc37ea881d4440a8e2362c952778dcf1fb9339523c8ff844c5fd5"
"83fbb9f66e3ae59f1668d53491e1d8417536c09566e78cf6da860bafbc0330f5"
"93fe663e701d170caab5dd9376680444f9b09465ee344ccde9b29e923065c497"
"82da61c3cfbb122df6fd2b14e57d7091a0a16cfe79cdbb2d4f7a56394e52314e"
"104707bb42fbae8ea86841a63b0d61197471f547142bdb9956632759952973df"
"c74ba17a7ea4acf8629ad617bdc936a3d215367312c19ed79faf23cb431e03f1"
"96fa9dbc3fb50218e548e898f3c6d715e2b7215018ebcb646b7eea02bdd7ba0e"
"242724c5436867c9aebd43b215167ec82eb50061c70ea1c97c247c93b15cc58e"
"21c533da37e4b408c03390e8c776d4c98fd23d3b0e2479852e8d60a8a92b462c"
"9aa61458862e1fe54053460ae58cfea0b5cebd50cb4f57cc85b29d515d7a9e81"
"c6e41859928813bc7b44a9115a337e61a1bd8d201cbf71cf112ba098ef6b6fa6"
"069d91756093a2d62be52148a03a4b46371e24966cabf93b30162851e66a0cec"
"c889cedb619d08d27ece987b2f60eb1fce742ecc32cd9c8936a6a176ad27e433"
"10ccc40eaf3647d8cd000feadbea1c92b53d1a9f50ec6f46beb4dbcc2cfdf62b"
"7d87dd7caadeb2dbf964657c020d71dc24becf25eaafa4b4dfac9a7d0e5eee01"
"bb1099358d3c59b4a25c7bc6ce8218bb27c0841b3338ade3ed5b5f2140b32f14"
"f66c116435b0264bf80500fe01431ddd84c5eab216cb2778a5d8ea08ee1cb84c"
"a58baee0fd67473bbf93e31db03dec7273ac81d7c6a55d5eef24cc748c1cdb0e"
"acf6f8628ed52f3903408eac0941a4ab156a9c3c1b60ecd0522f7bc66d656b6b"
"1acff5778d12751f382238b7b2eb33a5c36dd2432a25490e69fa3e3a48c2555d"
# ROCM DEV
"c73bd5d5588a7159428e80764d1dd6b1fac9fbe8b98eaeae0008f37e195bfa96"
"c6f785f2fac8911143b3175a8fd64a4d9e727eba6ef2436ad2b077b3eb9d117c"
"4c0bf06504b3d497509d6fb36d6086f279eb7ac7040dfa50517fb0c19c23b3b5"
"47c873570fda8730d8c2cd23b9c1b1fd79e34806025ddc1833d420ed562cee2a"
"aac1d24b4e58a7f4fac36398b931413f6c7e3b31808db866ebc017789680c69e"
"31aab9890aae0981dc22f179b310082a365e5c694b6cc972b20f13464900bc17"
"6fcf50f640bed658414383d0ab01e2a448d0b6dd03f97d83de9bb08295f6b9fc"
"abf5f12197710addefd4fdb65c042f57476d0d925772ec223142f00ff4a5229c"
"fc52015005c5a6280acc4aba463226a70986ed32565a15e25fd16109ff4cb6eb"
"36ae2b3218a798568df09191a748c929507ed8d26d579e6451745eb2499bdacf"
"904d13509393822437c1f6777688789d479bf14c7a781659f9f10b6144c6e851"
"139b57f1d0188a9a5648c7a6f89d6699c01e64443799d80f8ce2ef4ac6a89c7a"
"b86c3e205686c7a968022e46912435d022850f06bbf218a2470b4a861be2acb3"
"6f7468cd1b906612454891b4a906e2c65ded6f4e8ac50a62bc748e883a779082"
"6817815523827b33c06a0a3be658f505bdeec9cf00b7c8e7b46a98e0950158b5"
"1d5937ff27776125c40d6e84a048e2edb06cbdaf92db0dcee3eee2fb502b3b36"
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
	mv "libdrm_amdgpu.so.1.124.0" "libdrm_amdgpo.so.1.0.0"
	ln -s "libdrm_amdgpo.so.1.0.0" "libdrm_amdgpo.so.1"	

	# legacy
	mkdir -p "${pkgdir}/usr/lib"
	mv "${srcdir}/${_amdgpu_pro}/libamdocl-orca64.so" "${pkgdir}/usr/lib/"
	mv "${srcdir}/${_amdgpu}/libdrm_amdgpo.so.1.0.0" "${pkgdir}/usr/lib/"
	mv "${srcdir}/${_amdgpu}/libdrm_amdgpo.so.1" "${pkgdir}/usr/lib/"

	mv "${srcdir}/opt/" "${pkgdir}/"
	mv "${pkgdir}/opt/rocm-6.4.0" "${pkgdir}/opt/rocm"	

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
