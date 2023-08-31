# Maintainer: Carson Rueter <roachh at proton mail dot com>
# Co-Maintainer: George Sofianos

# Release notes https://rocm.docs.amd.com/en/latest/CHANGELOG.html#rocm-5-6-1
amdgpu_repo='https://repo.radeon.com/amdgpu/5.6.1/ubuntu'
rocm_repo='https://repo.radeon.com/rocm/apt/5.6.1'
opencl_lib='opt/rocm-5.6.1/opencl/lib'
rocm_lib='opt/rocm-5.6.1/lib'
hip_lib='opt/rocm-5.6.1/hip/lib/'
amdgpu="opt/amdgpu/lib/x86_64-linux-gnu"
amdgpu_pro="opt/amdgpu-pro/lib/x86_64-linux-gnu/"

pkgname=opencl-amd
pkgdesc="ROCr OpenCL stack, supports Vega 10 and later products - Legacy OpenCL stack (Proprietary), supports legacy products older than Vega 10 - This package is intended to work along with the free amdgpu stack."            
pkgver=5.6.1
pkgrel=1
epoch=1
arch=('x86_64')
url='http://www.amd.com'
license=('custom:AMD')
makedepends=('wget')
depends=('libdrm' 'ocl-icd' 'gcc-libs' 'numactl')
provides=('opencl-driver' 'libdrm-amdgpu-amdgpu1' 'rocm-core' 'comgr' 'hip' 'hipcc' 'hip-dev' 'hip-doc' 'hip-samples' 'hsakmt-roct' 'hsakmt-roct-dev' 'hsa-rocr' 'hsa-rocr-dev' 'rocminfo' 'hip-runtime-amd' 'rocm-device-libs' 'rocm-language-runtime' 
	'rocm-hip-runtime' 'rocm-ocl-icd' 'rocm-opencl' 'rocm-opencl-dev' 'rocm-opencl-runtime' 'rocm-clang-ocl' 'rocm-dbgapi' 'rocm-debug-agent' 'rocm-gdb' 'rocprofiler' 'rocprofiler-dev' 'roctracer' 'roctracer-dev' 'hsa-amd-aqlprofile' 'openmp-extras-runtime' 'rocm-cmake' 'rocm-utils' 'rocm-smi-lib')
conflicts=('rocm-opencl-runtime' 'libdrm-amdgpu-amdgpu1' 'rocm-core' 'comgr' 'hip' 'hipcc' 'hip-dev' 'hip-doc' 'hip-samples' 'hsakmt-roct' 'hsakmt-roct-dev' 'hsa-rocr' 'hsa-rocr-dev' 'rocminfo' 'hip-runtime-amd' 'rocm-device-libs' 'rocm-language-runtime' 
	'rocm-hip-runtime' 'rocm-ocl-icd' 'rocm-opencl' 'rocm-opencl-dev' 'rocm-opencl-runtime' 'rocm-clang-ocl' 'rocm-dbgapi' 'rocm-debug-agent' 'rocm-gdb' 'rocprofiler' 'rocprofiler-dev' 'roctracer' 'roctracer-dev' 'hsa-amd-aqlprofile' 'openmp-extras-runtime' 'rocm-cmake' 'rocm-utils' 'rocm-smi-lib')
optdepends=('clinfo' 'opencl-amd-dev')

source=(
# LIBDRM
"https://repo.radeon.com/amdgpu/5.6.1/ubuntu/pool/main/libd/libdrm-amdgpu/libdrm-amdgpu-amdgpu1_2.4.115.50601-1649308.22.04_amd64.deb"
# ROCM
"https://repo.radeon.com/rocm/apt/5.6.1/pool/main/r/rocm-core/rocm-core_5.6.1.50601-93~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.6.1/pool/main/c/comgr/comgr_2.5.0.50601-93~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.6.1/pool/main/h/hipcc/hipcc_1.0.0.50601-93~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.6.1/pool/main/h/hip-dev/hip-dev_5.6.31062.50601-93~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.6.1/pool/main/h/hip-doc/hip-doc_5.6.31062.50601-93~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.6.1/pool/main/h/hip-samples/hip-samples_5.6.31062.50601-93~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.6.1/pool/main/h/hsakmt-roct-dev/hsakmt-roct-dev_20230421.1.8.50601-93~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.6.1/pool/main/h/hsa-rocr/hsa-rocr_1.9.0.50601-93~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.6.1/pool/main/h/hsa-rocr-dev/hsa-rocr-dev_1.9.0.50601-93~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.6.1/pool/main/r/rocminfo/rocminfo_1.0.0.50601-93~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.6.1/pool/main/h/hip-runtime-amd/hip-runtime-amd_5.6.31062.50601-93~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.6.1/pool/main/r/rocm-device-libs/rocm-device-libs_1.0.0.50601-93~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.6.1/pool/main/r/rocm-language-runtime/rocm-language-runtime_5.6.1.50601-93~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.6.1/pool/main/r/rocm-hip-runtime/rocm-hip-runtime_5.6.1.50601-93~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.6.1/pool/main/r/rocm-ocl-icd/rocm-ocl-icd_2.0.0.50601-93~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.6.1/pool/main/r/rocm-opencl/rocm-opencl_2.0.0.50601-93~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.6.1/pool/main/r/rocm-opencl-dev/rocm-opencl-dev_2.0.0.50601-93~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.6.1/pool/main/r/rocm-opencl-runtime/rocm-opencl-runtime_5.6.1.50601-93~22.04_amd64.deb"
# ROCM DEV
"https://repo.radeon.com/rocm/apt/5.6.1/pool/main/r/rocm-clang-ocl/rocm-clang-ocl_0.5.0.50601-93~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.6.1/pool/main/o/openmp-extras-runtime/openmp-extras-runtime_16.56.0.50601-93~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.6.1/pool/main/r/rocm-smi-lib/rocm-smi-lib_5.0.0.50601-93~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.6.1/pool/main/r/rocm-cmake/rocm-cmake_0.9.0.50601-93~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.6.1/pool/main/r/rocm-dbgapi/rocm-dbgapi_0.70.1.50601-93~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.6.1/pool/main/r/rocm-debug-agent/rocm-debug-agent_2.0.3.50601-93~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.6.1/pool/main/r/rocm-gdb/rocm-gdb_13.1.50601-93~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.6.1/pool/main/r/rocm-utils/rocm-utils_5.6.1.50601-93~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.6.1/pool/main/r/rocprofiler/rocprofiler_2.0.0.50601-93~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.6.1/pool/main/r/rocprofiler-dev/rocprofiler-dev_2.0.0.50601-93~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.6.1/pool/main/r/roctracer/roctracer_4.1.0.50601-93~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.6.1/pool/main/r/roctracer-dev/roctracer-dev_4.1.0.50601-93~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.6.1/pool/main/r/rocm-dev/rocm-dev_5.6.1.50601-93~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.6.1/pool/main/h/hsa-amd-aqlprofile/hsa-amd-aqlprofile_1.0.0.50601-93~22.04_amd64.deb"
# Proprietary
"https://repo.radeon.com/amdgpu/5.5.2/ubuntu/pool/proprietary/o/opencl-legacy-amdgpu-pro/opencl-legacy-amdgpu-pro-icd_23.10-1610704.22.04_amd64.deb"
#"https://repo.radeon.com/amdgpu/22.20.3/ubuntu/pool/proprietary/c/clinfo-amdgpu-pro/clinfo-amdgpu-pro_22.10-1462318~22.04_amd64.deb"
#"https://repo.radeon.com/amdgpu/22.20.3/ubuntu/pool/proprietary/o/ocl-icd-amdgpu-pro/ocl-icd-libopencl1-amdgpu-pro_22.10-1462318~22.04_amd64.deb"
#"https://repo.radeon.com/amdgpu/22.20.3/ubuntu/pool/proprietary/a/amf-amdgpu-pro/amf-amdgpu-pro_1.4.24-1462318~22.04_amd64.deb"
)

sha256sums=(
"a790e1630bc892e60d1360e20bdd067523b86e4d2f61c746ef288c7d6b479b91"

"73d6b61b908f83d8823530f0463062db10f4256548aac3ce75bf10721e36a6fe"
"800abbc9e8464f2a77a6ec4fabed6b190ecd1d04aae935714e29b0d9ba170a7c"
"6dec0aa81820a760a898f5cf3945878c109f879009b4ba6e42b65d3c1c347cfe"
"9a3c14426aec19c7eca6cac710838d4cef2492770729db9f9a68ecb1c40481d6"
"68669611f0854337a8e6ac49a45c0937573dd43d370d7b864808cdabd33b1984"
"d49c6a1f9d4e7bf3599badb2d4d026a22f6ace9ec1f20a3243c895b41be5cc6b"
"323f987ccbfec615d573439a4f05c3228bedf6f82e325df192e7a2b846072e29"
"268cb78cecef9bbee6e06b7ff3a588c60af6d48d89469a874273813700175021"
"eb9fae9fa636437129b766642fce514c6f623a44766dcc2489bd053663aa0391"
"a9ff73f0e546d585eaa44cdb9706799e1ab123d78f3277bf1154833347102f73"
"a5fad5392b7f16010de0475a6495521dc520eaddea5200b13a462c4f05db7de1"
"6be1b86e204d75e5f7d771807d05294b4176b61fe16e05bca71741a90fdee4b4"
"aafd64a7cdd781856c8fe2c40e636ed2ea73aa506ff6a4a437a4ef439b3852ea"
"a8bd3c8d489d60c5385f8f0e510289ca7010df532e55da96f347c37a7849eb25"
"a7ab08a9e4a78d718f057c300907730313e59204dbaeeeac771f63a7523f3a58"
"44ac01aa9948deb999cd30c7f5c3966f55755fbd4360760c8f1989dd84706837"
"4eb348c60d7835c6b190fe95bda7190250301f15c38479c66ae9d766760ff7be"
"9940d9ba984aa5de6d89202e4ddaad5ef2190e07ab648d26482b270600e6712b"

"1a6eb87c2dfff12aa78bc6945167fa6729b9209152ee1f42a69914aaf088bf3f"
"36016bcbe216bd4b516a2fcb5baeab1898ac0cbab470b259abafe4957d19c353"
"9f094a2eebbfc849b7ce628ba2e08aa063aa7cb19526dd1754676c894ee2c824"
"d488e7f8cfe71ff9fc57be9a9a1978bb6eb553bc1186fc330a03b51d14be2fa8"
"3227fd5a198f530bdb6ce05bdc9cb284c4a77611d8f1280bf946b6c617e6d505"
"78ee9fb1477b27c80a529c76caaafbfcdfd74b59d70a00539eab8c510b544c4c"
"655e75dff1603b21ca1606d4bb2391c92b5692650437998bd81667df3cf85406"
"bcbde3e203f6afc2b0a2286fc57d29d77cc70e1d5c1cf5e37aba010c3bf743ff"
"06b0b0470e70a92eddd5841a68929400ddefd89f1bec3b88576a081f7fde3c7b"
"ba44c2268ca87613dfd39c4853e0b64e588b77626b87b6958d01320f567c3a6d"
"3d65ea1823c4330797075cb98bdf0c648ae524f75dc8ca1860b0863b3b2ef672"
"e306027a1634d1dab565550ab7f774b125766e253740f53695a02c88adb2ceff"
"0d0d01c84223566160cbe07c8904086eec9c1077cff1342768bffd08f1610a5b"
"180d61a1995519934147462db68b0260d94f8002f7439b6f7789ca008861aa97"
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
	egz "${srcdir}/rocm-core_5.6.1.50601-93~22.04_amd64.deb"
	egz "${srcdir}/comgr_2.5.0.50601-93~22.04_amd64.deb"
	egz "${srcdir}/hipcc_1.0.0.50601-93~22.04_amd64.deb"
	egz "${srcdir}/hip-dev_5.6.31062.50601-93~22.04_amd64.deb"
	egz "${srcdir}/hip-doc_5.6.31062.50601-93~22.04_amd64.deb"
	egz "${srcdir}/hip-samples_5.6.31062.50601-93~22.04_amd64.deb"
	egz "${srcdir}/hsakmt-roct-dev_20230421.1.8.50601-93~22.04_amd64.deb"
	egz "${srcdir}/hsa-rocr_1.9.0.50601-93~22.04_amd64.deb"
	egz "${srcdir}/hsa-rocr-dev_1.9.0.50601-93~22.04_amd64.deb"
	egz "${srcdir}/rocminfo_1.0.0.50601-93~22.04_amd64.deb"
	egz "${srcdir}/hip-runtime-amd_5.6.31062.50601-93~22.04_amd64.deb"
	egz "${srcdir}/rocm-device-libs_1.0.0.50601-93~22.04_amd64.deb"
	egz "${srcdir}/rocm-language-runtime_5.6.1.50601-93~22.04_amd64.deb"
	egz "${srcdir}/rocm-hip-runtime_5.6.1.50601-93~22.04_amd64.deb"
	egz "${srcdir}/rocm-ocl-icd_2.0.0.50601-93~22.04_amd64.deb"
	egz "${srcdir}/rocm-opencl_2.0.0.50601-93~22.04_amd64.deb"
	egz "${srcdir}/rocm-opencl-dev_2.0.0.50601-93~22.04_amd64.deb"
	egz "${srcdir}/rocm-opencl-runtime_5.6.1.50601-93~22.04_amd64.deb"
	exz "${srcdir}/rocm-clang-ocl_0.5.0.50601-93~22.04_amd64.deb"
	egz "${srcdir}/rocm-smi-lib_5.0.0.50601-93~22.04_amd64.deb"
	exz "${srcdir}/rocm-cmake_0.9.0.50601-93~22.04_amd64.deb"
	egz "${srcdir}/rocm-dbgapi_0.70.1.50601-93~22.04_amd64.deb"
	egz "${srcdir}/rocm-debug-agent_2.0.3.50601-93~22.04_amd64.deb"
	egz "${srcdir}/rocm-utils_5.6.1.50601-93~22.04_amd64.deb"
	egz "${srcdir}/rocprofiler_2.0.0.50601-93~22.04_amd64.deb"
	egz "${srcdir}/rocprofiler-dev_2.0.0.50601-93~22.04_amd64.deb"
	egz "${srcdir}/roctracer_4.1.0.50601-93~22.04_amd64.deb"
	egz "${srcdir}/roctracer-dev_4.1.0.50601-93~22.04_amd64.deb"
	egz "${srcdir}/rocm-dev_5.6.1.50601-93~22.04_amd64.deb"
	egz "${srcdir}/hsa-amd-aqlprofile_1.0.0.50601-93~22.04_amd64.deb"
	exz "${srcdir}/libdrm-amdgpu-amdgpu1_2.4.115.50601-1649308.22.04_amd64.deb"
	egz "${srcdir}/openmp-extras-runtime_16.56.0.50601-93~22.04_amd64.deb"
	egz "${srcdir}/rocm-gdb_13.1.50601-93~22.04_amd64.deb"
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
	ln -s "/opt/rocm-5.6.1" "$pkgdir/opt/rocm"
	#ln -s "/opt/rocm-5.6.1/hip/bin/.hipVersion" "$pkgdir/opt/rocm-5.6.1/bin/.hipVersion"

	mkdir -p "${pkgdir}/opt/amdgpu/share/libdrm"
	cd "${pkgdir}/opt/amdgpu/share/libdrm"
	ln -s /usr/share/libdrm/amdgpu.ids amdgpu.ids		

	mkdir -p ${pkgdir}/etc/OpenCL/vendors	
	echo libamdocl64.so > "${pkgdir}/etc/OpenCL/vendors/amdocl64.icd"
	echo libamdocl-orca64.so > "${pkgdir}/etc/OpenCL/vendors/amdocl-orca64.icd"

	mkdir -p ${pkgdir}/etc/ld.so.conf.d
	echo /opt/rocm-5.6.1/opencl/lib > "$pkgdir/etc/ld.so.conf.d/opencl-amd.conf"
	echo /opt/rocm-5.6.1/lib >> "$pkgdir/etc/ld.so.conf.d/opencl-amd.conf"
	echo /opt/rocm-5.6.1/hip/lib >> "$pkgdir/etc/ld.so.conf.d/opencl-amd.conf"

	mkdir -p ${pkgdir}/etc/profile.d
	echo export PATH="\${PATH}:/opt/rocm-5.6.1/bin:/opt/rocm-5.6.1/hip/bin" > "$pkgdir/etc/profile.d/opencl-amd.sh"
}
