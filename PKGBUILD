# Maintainer: Carson Rueter <roachh at proton mail dot com>
# Co-Maintainer: George Sofianos

# Release notes https://docs.amd.com/bundle/ROCm-Release-Notes-v5.3/page/About_This_Document.html
amdgpu_install='22.40.0.50300'
amdgpu_version='22.40.0'
rocm_version='50300'
amdgpu_build_id='1483871.22.04'
rocm_build_id='63~22.04'
amdgpu_repo='https://repo.radeon.com/amdgpu/5.3/ubuntu'
rocm_repo='https://repo.radeon.com/rocm/apt/5.3'
opencl_lib='opt/rocm-5.3.0/opencl/lib'
rocm_lib='opt/rocm-5.3.0/lib'
hip_lib='opt/rocm-5.3.0/hip/lib/'
amdgpu="opt/amdgpu/lib/x86_64-linux-gnu"
amdgpu_pro="opt/amdgpu-pro/lib/x86_64-linux-gnu/"

pkgname=opencl-amd
pkgdesc="ROCr OpenCL stack, supports Vega 10 and later products - Legacy OpenCL stack (Proprietary), supports legacy products older than Vega 10 - This package is intended to work along with the free amdgpu stack."            
pkgver=${amdgpu_install}
pkgrel=1
arch=('x86_64')
url='http://www.amd.com'
license=('custom:AMD')
makedepends=('wget')
depends=('libdrm' 'ocl-icd' 'gcc-libs' 'numactl' 'ncurses5-compat-libs')
conflicts=('rocm-opencl-runtime')
provides=('opencl-driver' 'rocm-core' 'hip-dev' 'hip-doc' 'hip-samples' 'hsakmt-roct-dev' 'hsa-rocr' 'hsa-rocr-dev' 'rocminfo' 'hip-runtime-amd' 'rocm-device-libs' 'rocm-language-runtime' 
	'rocm-hip-runtime' 'rocm-ocl-icd' 'rocm-opencl' 'rocm-opencl-dev' 'rocm-opencl-runtime' 'rocm-clang-ocl' 'openmp-extras-runtime' 'rocm-cmake' 'rocm-utils' 'rocm-smi-lib')
optdepends=('clinfo' 'opencl-amd-dev')

source=(
# LIBDRM
"https://repo.radeon.com/amdgpu/5.3/ubuntu/pool/main/libd/libdrm-amdgpu/libdrm-amdgpu-amdgpu1_2.4.112.50300-1483871.22.04_amd64.deb"
# ROCM
"https://repo.radeon.com/rocm/apt/5.3/pool/main/r/rocm-core/rocm-core_5.3.0.50300-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3/pool/main/c/comgr/comgr_2.4.0.50300-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3/pool/main/h/hip-dev/hip-dev_5.3.22061.50300-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3/pool/main/h/hip-doc/hip-doc_5.3.22061.50300-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3/pool/main/h/hip-samples/hip-samples_5.3.22061.50300-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3/pool/main/h/hsakmt-roct-dev/hsakmt-roct-dev_20220803.1.8.50300-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3/pool/main/h/hsa-rocr/hsa-rocr_1.7.0.50300-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3/pool/main/h/hsa-rocr-dev/hsa-rocr-dev_1.7.0.50300-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3/pool/main/r/rocminfo/rocminfo_1.0.0.50300-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3/pool/main/h/hip-runtime-amd/hip-runtime-amd_5.3.22061.50300-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3/pool/main/r/rocm-device-libs/rocm-device-libs_1.0.0.50300-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3/pool/main/r/rocm-language-runtime/rocm-language-runtime_5.3.0.50300-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3/pool/main/r/rocm-hip-runtime/rocm-hip-runtime_5.3.0.50300-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3/pool/main/r/rocm-ocl-icd/rocm-ocl-icd_2.0.0.50300-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3/pool/main/r/rocm-opencl/rocm-opencl_2.0.0.50300-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3/pool/main/r/rocm-opencl-dev/rocm-opencl-dev_2.0.0.50300-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3/pool/main/r/rocm-opencl-runtime/rocm-opencl-runtime_5.3.0.50300-63~22.04_amd64.deb"
# ROCM DEV
"https://repo.radeon.com/rocm/apt/5.3/pool/main/r/rocm-clang-ocl/rocm-clang-ocl_0.5.0.50300-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3/pool/main/o/openmp-extras-runtime/openmp-extras-runtime_15.53.0.50300-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3/pool/main/r/rocm-smi-lib/rocm-smi-lib_5.0.0.50300-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3/pool/main/r/rocm-cmake/rocm-cmake_0.8.0.50300-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3/pool/main/r/rocm-dbgapi/rocm-dbgapi_0.67.0.50300-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3/pool/main/r/rocm-debug-agent/rocm-debug-agent_2.0.3.50300-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3/pool/main/r/rocm-gdb/rocm-gdb_12.1.50300-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3/pool/main/r/rocm-utils/rocm-utils_5.3.0.50300-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3/pool/main/r/rocprofiler-dev/rocprofiler-dev_1.0.0.50300-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3/pool/main/r/roctracer-dev/roctracer-dev_4.1.0.50300-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3/pool/main/r/rocm-dev/rocm-dev_5.3.0.50300-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3/pool/main/h/hsa-amd-aqlprofile/hsa-amd-aqlprofile_1.0.0.50300-63~22.04_amd64.deb"
# Proprietary
#"https://repo.radeon.com/amdgpu/22.20.3/ubuntu/pool/proprietary/o/opencl-legacy-amdgpu-pro/opencl-legacy-amdgpu-pro-icd_22.20-1462318~22.04_amd64.deb"
#"https://repo.radeon.com/amdgpu/22.20.3/ubuntu/pool/proprietary/c/clinfo-amdgpu-pro/clinfo-amdgpu-pro_22.10-1462318~22.04_amd64.deb"
#"https://repo.radeon.com/amdgpu/22.20.3/ubuntu/pool/proprietary/o/ocl-icd-amdgpu-pro/ocl-icd-libopencl1-amdgpu-pro_22.10-1462318~22.04_amd64.deb"
#"https://repo.radeon.com/amdgpu/22.20.3/ubuntu/pool/proprietary/a/amf-amdgpu-pro/amf-amdgpu-pro_1.4.24-1462318~22.04_amd64.deb"
)

sha256sums=(
"3248b09dda58dd9a03bb0d00052af46648e76f7874c86c522f72e2db9bc2d762"

"9755a7a06f29529c675bdf516b79d52c8b46c1cb7b5a3749221a2de379f594ef"
"2f319ea328850c4c764ac2caf11974ea2cd6833c5dad279df60251f9b49d11fc"
"4bf9c0ad3dde077bb69d821a1b67ef7224120a80b8db71b0c4ee092a32f57b2a"
"982c91201cbe91ed88c442d462bd062009155406bc54681db41dd4c992168cc9"
"8fb9424b1b9fedd050d549c942332bcae0ac9c785a59ffeb44cbb9ffcfe08dc8"
"3cca7470ab22aa9263cffe54080719c8faf672070126c28ae638e57ec6c8d548"
"7806b9fee2de2635788db0922294aeeaa5f6589b954c2485fdac9b19e7b6170b"
"c7df12afb386c66548789ee840421da10b5a76e03ba381a91d9544f29ea9f188"
"6fbf312bdde68a67e645dc24fdedb7df006846ccb26b466b4f70fbfad07c794f"
"21b3b0fe687ff2c5795288a9473ed77c596bdceb26ba42e24f87fbfabda9d4ea"
"eb5ef2ebc8c41c4838b79952c1facf635eed85294b83e26c15e0162183754295"
"ec3014c3a5c246415db11323d9744d147a905f127e354f39856ee6dfb6c132c6"
"69cef8d550af582666af0cec2e3315da9d7704b46cacca55b5adf087bf7d7cb8"
"1937022c82a9c66e901ba79326b5e021d606ee29ba00f7e6cfb83833640359f5"
"7adcb5dfaf5b802b6cbc038b603a3c0cf5201a63d9044b20c7c31aa62f943f0d"
"8226e6a3bbe2b49d0ce3e06cf66fb1417cd5cb72d493f3e672f45bca4bdfdd8c"
"aff2698fa346a622efda1e488e7ea678b6aec95211f6ae45b31a959677c88fe7"

"84469921e2c235846d02244f15c61929661bd3fc6b9f9cc833252882df06c799"
"f862bb14cbba8a463dde71bf0ba69fef095b335a127ef6aeafba33d849c67e54"
"7e13a9215f7f47b7945725ca407a7a8a2040e80a4662b77a4c9586f8986ee6b8"
"e37d188c1cdeb565d1beb65f1641c37b04f07d5cba89afeff93eae82096bfec2"
"212d162eba0481950aa0a527472d1ad6f171b13d860463cea01bd45e6c93fb4e"
"5076d51a2dbfca1d3562e91a297715550db408acaf0fe0e8a756e75b4445f975"
"91b5125fc041b29bc68f53134441fd97874ed3568f90f28cf808d8b27c33b6db"
"82c29972a86103b4b8df3edd41f9b71b883b220257ecd98d04c7353a17e96a81"
"44978ff0331ae1362ef49d114a00e6cce098213b5eaf77858af1ed2023e00291"
"af62c042aeba930971e4182d4c7edb3544378a540fcec93d8b375724e8b2e2ba"
"77d986836cc0e9058749807076733a1825502e0883bec06f52af56d2fa5ae145"
"46635f4f019aba1c3a53665430b0de70b992700e852f08b36f54ff33ca7e3ec7"
#"ac94ead24a5ecfc9462b09ef647ac036333c856391571e9071e3263f1232dd71"
#"d9d0182d372345a9e0b7df1e18da29aed6420edc9f948e7ffc2e8e66200db513"
)

#Extract .xz files
exz() {
	ar x $1
	tar xJf data.tar.xz
	rm data.tar.xz
}
#Extract .gz files
egz() {
	ar x $1
	tar xfx data.tar.gz
	rm data.tar.gz
}

package() {
	egz "${srcdir}/rocm-core_5.3.0.50300-63~22.04_amd64.deb"
	egz "${srcdir}/comgr_2.4.0.50300-63~22.04_amd64.deb"
	egz "${srcdir}/hip-dev_5.3.22061.50300-63~22.04_amd64.deb"
	egz "${srcdir}/hip-doc_5.3.22061.50300-63~22.04_amd64.deb"
	egz "${srcdir}/hip-samples_5.3.22061.50300-63~22.04_amd64.deb"
	egz "${srcdir}/hsakmt-roct-dev_20220803.1.8.50300-63~22.04_amd64.deb"
	egz "${srcdir}/hsa-rocr_1.7.0.50300-63~22.04_amd64.deb"
	egz "${srcdir}/hsa-rocr-dev_1.7.0.50300-63~22.04_amd64.deb"
	egz "${srcdir}/rocminfo_1.0.0.50300-63~22.04_amd64.deb"
	egz "${srcdir}/hip-runtime-amd_5.3.22061.50300-63~22.04_amd64.deb"
	egz "${srcdir}/rocm-device-libs_1.0.0.50300-63~22.04_amd64.deb"
	egz "${srcdir}/rocm-language-runtime_5.3.0.50300-63~22.04_amd64.deb"
	egz "${srcdir}/rocm-hip-runtime_5.3.0.50300-63~22.04_amd64.deb"
	egz "${srcdir}/rocm-ocl-icd_2.0.0.50300-63~22.04_amd64.deb"
	egz "${srcdir}/rocm-opencl_2.0.0.50300-63~22.04_amd64.deb"
	egz "${srcdir}/rocm-opencl-dev_2.0.0.50300-63~22.04_amd64.deb"
	egz "${srcdir}/rocm-opencl-runtime_5.3.0.50300-63~22.04_amd64.deb"
	exz "${srcdir}/rocm-clang-ocl_0.5.0.50300-63~22.04_amd64.deb"
	egz "${srcdir}/rocm-smi-lib_5.0.0.50300-63~22.04_amd64.deb"
	exz "${srcdir}/rocm-cmake_0.8.0.50300-63~22.04_amd64.deb"
	egz "${srcdir}/rocm-dbgapi_0.67.0.50300-63~22.04_amd64.deb"
	egz "${srcdir}/rocm-debug-agent_2.0.3.50300-63~22.04_amd64.deb"
	egz "${srcdir}/rocm-utils_5.3.0.50300-63~22.04_amd64.deb"
	egz "${srcdir}/rocprofiler-dev_1.0.0.50300-63~22.04_amd64.deb"
	egz "${srcdir}/roctracer-dev_4.1.0.50300-63~22.04_amd64.deb"
	egz "${srcdir}/rocm-dev_5.3.0.50300-63~22.04_amd64.deb"
	egz "${srcdir}/hsa-amd-aqlprofile_1.0.0.50300-63~22.04_amd64.deb"
	exz "${srcdir}/libdrm-amdgpu-amdgpu1_2.4.112.50300-1483871.22.04_amd64.deb"
	egz "${srcdir}/openmp-extras-runtime_15.53.0.50300-63~22.04_amd64.deb"
	egz "${srcdir}/rocm-gdb_12.1.50300-63~22.04_amd64.deb"
	# exz "${srcdir}/opencl-legacy-amdgpu-pro-icd_22.20-1462318~22.04_amd64.deb"

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
	ln -s "/opt/rocm-5.3.0" "$pkgdir/opt/rocm"
	#ln -s "/opt/rocm-5.3.0/hip/bin/.hipVersion" "$pkgdir/opt/rocm-5.3.0/bin/.hipVersion"

	mkdir -p "${pkgdir}/opt/amdgpu/share/libdrm"
	cd "${pkgdir}/opt/amdgpu/share/libdrm"
	ln -s /usr/share/libdrm/amdgpu.ids amdgpu.ids		

	mkdir -p ${pkgdir}/etc/OpenCL/vendors	
	echo libamdocl64.so > "${pkgdir}/etc/OpenCL/vendors/amdocl64.icd"
	echo libamdocl-orca64.so > "${pkgdir}/etc/OpenCL/vendors/amdocl-orca64.icd"

	mkdir -p ${pkgdir}/etc/ld.so.conf.d
	echo /opt/rocm-5.3.0/opencl/lib > "$pkgdir/etc/ld.so.conf.d/opencl-amd.conf"
	echo /opt/rocm-5.3.0/lib >> "$pkgdir/etc/ld.so.conf.d/opencl-amd.conf"
	echo /opt/rocm-5.3.0/hip/lib >> "$pkgdir/etc/ld.so.conf.d/opencl-amd.conf"

	mkdir -p ${pkgdir}/etc/profile.d
	echo export PATH="\${PATH}:/opt/rocm-5.3.0/bin:/opt/rocm-5.3.0/hip/bin" > "$pkgdir/etc/profile.d/opencl-amd.sh"
}
