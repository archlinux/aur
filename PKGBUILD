# Maintainer: Carson Rueter <roachh at proton mail dot com>
# Co-Maintainer: George Sofianos

# Release notes https://rocm.docs.amd.com/en/latest/CHANGELOG.html#rocm-5-7-1
amdgpu_repo='https://repo.radeon.com/amdgpu/5.7.1/ubuntu'
rocm_repo='https://repo.radeon.com/rocm/apt/5.7'
opencl_lib='opt/rocm-5.7.1/opencl/lib'
rocm_lib='opt/rocm-5.7.1/lib'
hip_lib='opt/rocm-5.7.1/hip/lib/'
amdgpu="opt/amdgpu/lib/x86_64-linux-gnu"
amdgpu_pro="opt/amdgpu-pro/lib/x86_64-linux-gnu/"

pkgname=opencl-amd
pkgdesc="ROCr OpenCL stack, supports Vega 10 and later products - Legacy OpenCL stack (Proprietary), supports legacy products older than Vega 10 - This package is intended to work along with the free amdgpu stack."            
pkgver=5.7.1
pkgrel=1
epoch=1
arch=('x86_64')
url='http://www.amd.com'
license=('custom:AMD')
makedepends=('wget')
depends=('libdrm' 'ocl-icd' 'gcc-libs' 'numactl')
provides=('opencl-driver' 'libdrm-amdgpu-amdgpu1' 'rocm-core' 'comgr' 'hip' 'hipcc' 'hip-dev' 'hip-doc' 'hip-samples' 'hsakmt-roct' 'hsakmt-roct-dev' 'hsa-rocr' 'hsa-rocr-dev' 'rocminfo' 'hip-runtime-amd' 'rocm-device-libs' 'rocm-language-runtime' 
	'rocm-hip-runtime' 'rocm-ocl-icd' 'rocm-opencl' 'rocm-opencl-dev' 'rocm-opencl-runtime' 'rocm-clang-ocl' 'rocm-dbgapi' 'rocm-debug-agent' 'rocm-gdb' 'rocprofiler' 'rocprofiler-dev' 'rocprofiler-plugins' 'roctracer' 'roctracer-dev' 'hsa-amd-aqlprofile' 'openmp-extras-runtime' 'rocm-cmake' 'rocm-utils' 'rocm-smi-lib')
conflicts=('rocm-opencl-runtime' 'libdrm-amdgpu-amdgpu1' 'rocm-core' 'comgr' 'hip' 'hipcc' 'hip-dev' 'hip-doc' 'hip-samples' 'hsakmt-roct' 'hsakmt-roct-dev' 'hsa-rocr' 'hsa-rocr-dev' 'rocminfo' 'hip-runtime-amd' 'rocm-device-libs' 'rocm-language-runtime' 
	'rocm-hip-runtime' 'rocm-ocl-icd' 'rocm-opencl' 'rocm-opencl-dev' 'rocm-opencl-runtime' 'rocm-clang-ocl' 'rocm-dbgapi' 'rocm-debug-agent' 'rocm-gdb' 'rocprofiler' 'rocprofiler-dev' 'rocprofiler-plugins' 'roctracer' 'roctracer-dev' 'hsa-amd-aqlprofile' 'openmp-extras-runtime' 'rocm-cmake' 'rocm-utils' 'rocm-smi-lib')
optdepends=('clinfo' 'opencl-amd-dev')

source=(
# LIBDRM
"https://repo.radeon.com/amdgpu/5.7.1/ubuntu/pool/main/libd/libdrm-amdgpu/libdrm-amdgpu-amdgpu1_2.4.115.50701-1664922.22.04_amd64.deb"
# ROCM
"https://repo.radeon.com/rocm/apt/5.7.1/pool/main/r/rocm-core/rocm-core_5.7.1.50701-98~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.7.1/pool/main/c/comgr/comgr_2.5.0.50701-98~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.7.1/pool/main/h/hipcc/hipcc_1.0.0.50701-98~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.7.1/pool/main/h/hip-dev/hip-dev_5.7.31921.50701-98~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.7.1/pool/main/h/hip-doc/hip-doc_5.7.31921.50701-98~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.7.1/pool/main/h/hip-samples/hip-samples_5.7.31921.50701-98~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.7.1/pool/main/h/hsakmt-roct-dev/hsakmt-roct-dev_20230704.2.5268.50701-98~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.7.1/pool/main/h/hsa-rocr/hsa-rocr_1.11.0.50701-98~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.7.1/pool/main/h/hsa-rocr-dev/hsa-rocr-dev_1.11.0.50701-98~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.7.1/pool/main/r/rocminfo/rocminfo_1.0.0.50701-98~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.7.1/pool/main/h/hip-runtime-amd/hip-runtime-amd_5.7.31921.50701-98~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.7.1/pool/main/r/rocm-device-libs/rocm-device-libs_1.0.0.50701-98~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.7.1/pool/main/r/rocm-language-runtime/rocm-language-runtime_5.7.1.50701-98~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.7.1/pool/main/r/rocm-hip-runtime/rocm-hip-runtime_5.7.1.50701-98~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.7.1/pool/main/r/rocm-ocl-icd/rocm-ocl-icd_2.0.0.50701-98~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.7.1/pool/main/r/rocm-opencl/rocm-opencl_2.0.0.50701-98~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.7.1/pool/main/r/rocm-opencl-dev/rocm-opencl-dev_2.0.0.50701-98~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.7.1/pool/main/r/rocm-opencl-runtime/rocm-opencl-runtime_5.7.1.50701-98~22.04_amd64.deb"
# ROCM DEV
"https://repo.radeon.com/rocm/apt/5.7.1/pool/main/r/rocm-clang-ocl/rocm-clang-ocl_0.5.0.50701-98~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.7.1/pool/main/o/openmp-extras-runtime/openmp-extras-runtime_17.57.0.50701-98~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.7.1/pool/main/r/rocm-smi-lib/rocm-smi-lib_5.0.0.50701-98~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.7.1/pool/main/r/rocm-cmake/rocm-cmake_0.10.0.50701-98~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.7.1/pool/main/r/rocm-dbgapi/rocm-dbgapi_0.70.1.50701-98~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.7.1/pool/main/r/rocm-debug-agent/rocm-debug-agent_2.0.3.50701-98~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.7.1/pool/main/r/rocm-gdb/rocm-gdb_13.2.50701-98~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.7.1/pool/main/r/rocm-utils/rocm-utils_5.7.1.50701-98~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.7.1/pool/main/r/rocprofiler/rocprofiler_2.0.0.50701-98~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.7.1/pool/main/r/rocprofiler-dev/rocprofiler-dev_2.0.0.50701-98~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.7.1/pool/main/r/rocprofiler-plugins/rocprofiler-plugins_2.0.0.50701-98~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.7.1/pool/main/r/roctracer/roctracer_4.1.0.50701-98~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.7.1/pool/main/r/roctracer-dev/roctracer-dev_4.1.0.50701-98~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.7.1/pool/main/r/rocm-dev/rocm-dev_5.7.1.50701-98~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.7.1/pool/main/h/hsa-amd-aqlprofile/hsa-amd-aqlprofile_1.0.0.50701.50701-98~22.04_amd64.deb"
# Proprietary
"https://repo.radeon.com/amdgpu/5.7.1/ubuntu/pool/proprietary/o/opencl-legacy-amdgpu-pro/opencl-legacy-amdgpu-pro-icd_23.20-1664987.22.04_amd64.deb"
)

sha256sums=(
"ea0ffb3e9c27aaaa06c327bb60b85864bf0e3cff1c081bdb1e09d30a88f3716e"

"18a299907e919cfccd24f37caaf6d7f85be0d7d3ea49b9a0a58948e4bc2cf4ae"
"d2b32ac8937c8c6844102a28ae190021c880e06daa07beacd4b82d73ecf1e7ac"
"503530209884ffe3160d80126a6664d64b1a524e17a1b040f77ff3ea77a16868"
"770fb09d1a8d448381583927c2bef0c61361bfe05aeec23ed47f4b0c6088b43a"
"e304e1bdf392f9c53f9a58e2202c54414d00ee4267f1cc77b04960f9033cb787"
"ce56af2811ec8784fc529bcc5efeeb169382a662bcebe9634a313585dc37e503"
"8f46bb5fa6456a3086c4b1bf8c73dca97f1d349017c07439e513fd950e1a8a70"
"4f4640883c469f3f7796d8f88bb4b6878884f10ac89c2143296650e803df929b"
"cb032f8dc63213d373afb970a84d73eb8b899990cfa30dd0b3a2af9b9f17617b"
"7ac302258b99fb9a5d689fb01dab07fb37b5b51e9ee092561cde9aba51d45623"
"90e4a77552107ff8a3fa993c8f76922b8470c3ccbd32ea89678dc09e83fe8cf6"
"43faf7e1797338a21f3d797b3c4b58650d3c612c8cc06bbf88eed674fd0aba0c"
"ae0b70e241f17ef6626e5515d079b82e2010600c37419ceeab6de93ef00a5f03"
"0119a3dc8526f29e621965daa10f4d0e61fcc82e7c80994a6f6629908741292d"
"d67986cf7f49a7578e350d6cc6eb169047abe4c8746ab15cce5ee55774a87842"
"6513808c8859067b022e0376506307ef9b8f3a26d41bec9980333dc95db0f7e3"
"574dbffc6b050ed4e09440c981ff702b00482e187778bbfa031e6d0fc4b5c9a8"
"644fce207304f980ba330424a5e74bc6d6a0e262d8823adc6590714d1b29124b"

"63bfd3d850e8aa90141167b7317141ea3e73394fc10fccd546cbb97906416947"
"0cc29c0d4f4304214a0556a270332985a409ff554896847ddc13407d6a83e2fc"
"6f0bc1144401cea85ad0fc899199413e6f9581c6eea9dc7c3ede2ec66110e7e2"
"b96e27b8484719f8acb9e35bfaa81323c9bad20cbbf7a7222bfc687fc307e931"
"255346c0fb8ce7034e8fd2fe10ff82793e795f009f16c4dd7f65e9fdb88d7db4"
"e0a6e0f2a99af92bf4403717f7703bfd01e5ee2354c6333173f42b4d8878d1e5"
"ae7b6d7642194f0bc9ced4de6779225d3b821c7dade10ad3edc28ffa9002266d"
"6359beb47b42ed470d19c0538a2ec7d563222e763901117045bb42333441c149"
"3b12c4e31ed561b5fd457be915bb9dc6e61cbad0af1ba73b8d5ea729b6ce3e86"
"d761308a560cf6ed80ebe670846281da6fab58a00e14f4b90378b31fa199bd83"
"f99c527266c34dadd5eecd6dbeb4e8f453adf3daf049a9a37dfb8ef8d279fd30"
"605d3cf9eb3d45910c354e2e53036bb0faebbde0175f5cabe15d5ef36c5368f1"
"7c2c1f824f4acbf90f6c271fa00dc2ba1b48d1dfdfd50c9e69c14a6bd66e80a0"
"c8600130f471e46d0b40baf50001411b96decb01e3597de1868d5676abe1f7fb"
"2d602d674a5a256f25844f9000cc2ada5f3033ef7a6f1939acd5b24174dcf55a"
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
	egz "${srcdir}/rocm-core_5.7.1.50701-98~22.04_amd64.deb"
	egz "${srcdir}/comgr_2.5.0.50701-98~22.04_amd64.deb"
	egz "${srcdir}/hipcc_1.0.0.50701-98~22.04_amd64.deb"
	egz "${srcdir}/hip-dev_5.7.31921.50701-98~22.04_amd64.deb"
	egz "${srcdir}/hip-doc_5.7.31921.50701-98~22.04_amd64.deb"
	egz "${srcdir}/hip-samples_5.7.31921.50701-98~22.04_amd64.deb"
	egz "${srcdir}/hsakmt-roct-dev_20230704.2.5268.50701-98~22.04_amd64.deb"
	egz "${srcdir}/hsa-rocr_1.11.0.50701-98~22.04_amd64.deb"
	egz "${srcdir}/hsa-rocr-dev_1.11.0.50701-98~22.04_amd64.deb"
	egz "${srcdir}/rocminfo_1.0.0.50701-98~22.04_amd64.deb"
	egz "${srcdir}/hip-runtime-amd_5.7.31921.50701-98~22.04_amd64.deb"
	egz "${srcdir}/rocm-device-libs_1.0.0.50701-98~22.04_amd64.deb"
	egz "${srcdir}/rocm-language-runtime_5.7.1.50701-98~22.04_amd64.deb"
	egz "${srcdir}/rocm-hip-runtime_5.7.1.50701-98~22.04_amd64.deb"
	egz "${srcdir}/rocm-ocl-icd_2.0.0.50701-98~22.04_amd64.deb"
	egz "${srcdir}/rocm-opencl_2.0.0.50701-98~22.04_amd64.deb"
	egz "${srcdir}/rocm-opencl-dev_2.0.0.50701-98~22.04_amd64.deb"
	egz "${srcdir}/rocm-opencl-runtime_5.7.1.50701-98~22.04_amd64.deb"
	exz "${srcdir}/rocm-clang-ocl_0.5.0.50701-98~22.04_amd64.deb"
	egz "${srcdir}/rocm-smi-lib_5.0.0.50701-98~22.04_amd64.deb"
	exz "${srcdir}/rocm-cmake_0.10.0.50701-98~22.04_amd64.deb"
	egz "${srcdir}/rocm-dbgapi_0.70.1.50701-98~22.04_amd64.deb"
	egz "${srcdir}/rocm-debug-agent_2.0.3.50701-98~22.04_amd64.deb"
	egz "${srcdir}/rocm-utils_5.7.1.50701-98~22.04_amd64.deb"
	egz "${srcdir}/rocprofiler_2.0.0.50701-98~22.04_amd64.deb"
	egz "${srcdir}/rocprofiler-dev_2.0.0.50701-98~22.04_amd64.deb"
	egz "${srcdir}/rocprofiler-plugins_2.0.0.50701-98~22.04_amd64.deb"
	egz "${srcdir}/roctracer_4.1.0.50701-98~22.04_amd64.deb"
	egz "${srcdir}/roctracer-dev_4.1.0.50701-98~22.04_amd64.deb"
	egz "${srcdir}/rocm-dev_5.7.1.50701-98~22.04_amd64.deb"
	egz "${srcdir}/hsa-amd-aqlprofile_1.0.0.50701.50701-98~22.04_amd64.deb"
	exz "${srcdir}/libdrm-amdgpu-amdgpu1_2.4.115.50701-1664922.22.04_amd64.deb"
	egz "${srcdir}/openmp-extras-runtime_17.57.0.50701-98~22.04_amd64.deb"
	egz "${srcdir}/rocm-gdb_13.2.50701-98~22.04_amd64.deb"
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
	ln -s "/opt/rocm-5.7.1" "$pkgdir/opt/rocm"
	#ln -s "/opt/rocm-5.7.1/hip/bin/.hipVersion" "$pkgdir/opt/rocm-5.7.1/bin/.hipVersion"

	mkdir -p "${pkgdir}/opt/amdgpu/share/libdrm"
	cd "${pkgdir}/opt/amdgpu/share/libdrm"
	ln -s /usr/share/libdrm/amdgpu.ids amdgpu.ids		

	mkdir -p ${pkgdir}/etc/OpenCL/vendors	
	echo libamdocl64.so > "${pkgdir}/etc/OpenCL/vendors/amdocl64.icd"
	echo libamdocl-orca64.so > "${pkgdir}/etc/OpenCL/vendors/amdocl-orca64.icd"

	mkdir -p ${pkgdir}/etc/ld.so.conf.d
	echo /opt/rocm-5.7.1/opencl/lib > "$pkgdir/etc/ld.so.conf.d/opencl-amd.conf"
	echo /opt/rocm-5.7.1/lib >> "$pkgdir/etc/ld.so.conf.d/opencl-amd.conf"
	echo /opt/rocm-5.7.1/hip/lib >> "$pkgdir/etc/ld.so.conf.d/opencl-amd.conf"

	mkdir -p ${pkgdir}/etc/profile.d
	echo export PATH="\${PATH}:/opt/rocm-5.7.1/bin:/opt/rocm-5.7.1/hip/bin" > "$pkgdir/etc/profile.d/opencl-amd.sh"
}
