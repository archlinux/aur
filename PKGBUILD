# Maintainer: Carson Rueter <roachh at proton mail dot com>
# Co-Maintainer: George Sofianos

# Release notes https://docs.amd.com/bundle/ROCm-Release-Notes-v5.4/page/About_This_Document.html
amdgpu_repo='https://repo.radeon.com/amdgpu/5.4/ubuntu'
rocm_repo='https://repo.radeon.com/rocm/apt/5.4'
opencl_lib='opt/rocm-5.4.0/opencl/lib'
rocm_lib='opt/rocm-5.4.0/lib'
hip_lib='opt/rocm-5.4.0/hip/lib/'
amdgpu="opt/amdgpu/lib/x86_64-linux-gnu"
amdgpu_pro="opt/amdgpu-pro/lib/x86_64-linux-gnu/"

pkgname=opencl-amd
pkgdesc="ROCr OpenCL stack, supports Vega 10 and later products - Legacy OpenCL stack (Proprietary), supports legacy products older than Vega 10 - This package is intended to work along with the free amdgpu stack."            
pkgver=5.4.0
pkgrel=1
epoch=1
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
"https://repo.radeon.com/amdgpu/5.4/ubuntu/pool/main/libd/libdrm-amdgpu/libdrm-amdgpu-amdgpu1_2.4.113.50400-1510348.22.04_amd64.deb"
# ROCM
"https://repo.radeon.com/rocm/apt/5.4/pool/main/r/rocm-core/rocm-core_5.4.0.50400-72~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4/pool/main/c/comgr/comgr_2.4.0.50400-72~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4/pool/main/h/hip-dev/hip-dev_5.4.22801.50400-72~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4/pool/main/h/hip-doc/hip-doc_5.4.22801.50400-72~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4/pool/main/h/hip-samples/hip-samples_5.4.22801.50400-72~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4/pool/main/h/hsakmt-roct-dev/hsakmt-roct-dev_20221020.0.2.50400-72~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4/pool/main/h/hsa-rocr/hsa-rocr_1.7.0.50400-72~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4/pool/main/h/hsa-rocr-dev/hsa-rocr-dev_1.7.0.50400-72~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4/pool/main/r/rocminfo/rocminfo_1.0.0.50400-72~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4/pool/main/h/hip-runtime-amd/hip-runtime-amd_5.4.22801.50400-72~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4/pool/main/r/rocm-device-libs/rocm-device-libs_1.0.0.50400-72~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4/pool/main/r/rocm-language-runtime/rocm-language-runtime_5.4.0.50400-72~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4/pool/main/r/rocm-hip-runtime/rocm-hip-runtime_5.4.0.50400-72~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4/pool/main/r/rocm-ocl-icd/rocm-ocl-icd_2.0.0.50400-72~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4/pool/main/r/rocm-opencl/rocm-opencl_2.0.0.50400-72~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4/pool/main/r/rocm-opencl-dev/rocm-opencl-dev_2.0.0.50400-72~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4/pool/main/r/rocm-opencl-runtime/rocm-opencl-runtime_5.4.0.50400-72~22.04_amd64.deb"
# ROCM DEV
"https://repo.radeon.com/rocm/apt/5.4/pool/main/r/rocm-clang-ocl/rocm-clang-ocl_0.5.0.50400-72~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4/pool/main/o/openmp-extras-runtime/openmp-extras-runtime_15.54.0.50400-72~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4/pool/main/r/rocm-smi-lib/rocm-smi-lib_5.0.0.50400-72~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4/pool/main/r/rocm-cmake/rocm-cmake_0.8.0.50400-72~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4/pool/main/r/rocm-dbgapi/rocm-dbgapi_0.68.0.50400-72~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4/pool/main/r/rocm-debug-agent/rocm-debug-agent_2.0.3.50400-72~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4/pool/main/r/rocm-gdb/rocm-gdb_12.1.50400-72~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4/pool/main/r/rocm-utils/rocm-utils_5.4.0.50400-72~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4/pool/main/r/rocprofiler-dev/rocprofiler-dev_1.0.0.50400-72~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4/pool/main/r/roctracer-dev/roctracer-dev_4.1.0.50400-72~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4/pool/main/r/rocm-dev/rocm-dev_5.4.0.50400-72~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.4/pool/main/h/hsa-amd-aqlprofile/hsa-amd-aqlprofile_1.0.0.50400-72~22.04_amd64.deb"
# Proprietary
#"https://repo.radeon.com/amdgpu/22.20.3/ubuntu/pool/proprietary/o/opencl-legacy-amdgpu-pro/opencl-legacy-amdgpu-pro-icd_22.20-1462318~22.04_amd64.deb"
#"https://repo.radeon.com/amdgpu/22.20.3/ubuntu/pool/proprietary/c/clinfo-amdgpu-pro/clinfo-amdgpu-pro_22.10-1462318~22.04_amd64.deb"
#"https://repo.radeon.com/amdgpu/22.20.3/ubuntu/pool/proprietary/o/ocl-icd-amdgpu-pro/ocl-icd-libopencl1-amdgpu-pro_22.10-1462318~22.04_amd64.deb"
#"https://repo.radeon.com/amdgpu/22.20.3/ubuntu/pool/proprietary/a/amf-amdgpu-pro/amf-amdgpu-pro_1.4.24-1462318~22.04_amd64.deb"
)

sha256sums=(
"86f267cc9db141956f3a5fe0b62e36cc057a925fd8e81467c2b33c3c04e1dd42"

"dc8913f8520134c4dc0e33699550093bd9ce7b392104a09bf6ddcc76608a7357"
"1e785a098ebe21a3dc207f2b76d4fb59d1dbf8eecdb2ddc216144ac6c7b52be6"
"6ea0450160f2ccf10ef64f2777f766b57e1aec861e2ed05de1b0025e0c9e7401"
"fc53dc7792e72e0453ffc3ffa0186e3cc5d544f048685c8295a84d41d14d5ae4"
"7b1124d57afee0a567b4325d93ba575437294013a4b3ce829f43c39f7984cd97"
"c0d5095c0b496d565a815986cef3c797d8067fa5c5b463be342066c45bef1842"
"877e7b5c49ad312db55a0644ec66a2cf375ace4ef0fcc1710f00e58f26d4780c"
"e60df8d956ca0cfd9789d89c01c8fda5cf2e84862bfdcafe3371269b24899800"
"934f12bb5bc5e72ae439274a9a61583ff6e8b4ee0393b4293ae5b6d01253fc13"
"519d391b3b683d601884fae2cf27501bcb8a1fb5f87773a9f0b801977720d3db"
"bbb1a3d2e75d239134392ab3fc8fc37c87d060203fd36f16bf94ef326a636c2e"
"b4a8525f76a222711a0ce00036cb8b340d22af18a56736c6160e46805de752e6"
"a8de799f59c614a44e961128f8228749419dad96c9f4368f7c9145ae8091c00e"
"ddfd68000b7ba4d740d01f7dc8b58b1581e85b516ca88db7773ca3b9abcb2dd7"
"e92e2c8819f3878f3873f3f9e9bad4d47476d9d20e480e0071820a8520ae0e09"
"78c7ee94935e9a83de0eebce577fcb3d1acd6d98a9e73c5b8944af1b0b0ef113"
"ed646aad84ee00c238b16d42b6e91999bda0c2a538c731300eba8675397ce0ca"

"4326d9eb9117e386f530102d1db8d6d9292a387e3a38967aec1dc6aa30c1e263"
"2e2ba75668daa4b89349e776e4fd7212f799b0ac3902a6cb7212d0e5942510cb"
"46e2aeb08d988dc267eeaf10d87a5c3d7de8f1bd94090e156b82c6b16f596ca5"
"d597a3a538aa9c9aaf6cdf06ca713db5ec51c5b9fb556e031f78aa8e0e4ca045"
"c668c881b6922c88087b56e60d44640914e8e9546acf0c145b835b89f7eaea49"
"0d036f819adda55610e4703c5bdc1fbe6de9e2eba867af781f4d1c45b6ee4d2b"
"0100c94d1d12d7992bacab26ea1450534d6a74cf5cdb83bc33b4998c18a5552b"
"88fa9f27d6df97c7994fa628e4b6c2b039d47c8cf51b5822dfba97b3cdfe7d8d"
"938fe6c5c83ab0f7aa33b27aef85994334d71032b199624c6af424d06677104e"
"6cbd4ed82d4fbcb6c8316903ae6088330b2eb92c794e411472a5088f6f81296e"
"c723dc66cc88b24b3b4dd63749f3f84fa23df26f2348ca2af0d0df03f86b643a"
"18141368fe4464ebc01b1f6d7a448310b607298792d94e8c6113386cb4b8af69"
#"ac94ead24a5ecfc9462b09ef647ac036333c856391571e9071e3263f1232dd71"
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
	egz "${srcdir}/rocm-core_5.4.0.50400-72~22.04_amd64.deb"
	egz "${srcdir}/comgr_2.4.0.50400-72~22.04_amd64.deb"
	egz "${srcdir}/hip-dev_5.4.22801.50400-72~22.04_amd64.deb"
	egz "${srcdir}/hip-doc_5.4.22801.50400-72~22.04_amd64.deb"
	egz "${srcdir}/hip-samples_5.4.22801.50400-72~22.04_amd64.deb"
	egz "${srcdir}/hsakmt-roct-dev_20221020.0.2.50400-72~22.04_amd64.deb"
	egz "${srcdir}/hsa-rocr_1.7.0.50400-72~22.04_amd64.deb"
	egz "${srcdir}/hsa-rocr-dev_1.7.0.50400-72~22.04_amd64.deb"
	egz "${srcdir}/rocminfo_1.0.0.50400-72~22.04_amd64.deb"
	egz "${srcdir}/hip-runtime-amd_5.4.22801.50400-72~22.04_amd64.deb"
	egz "${srcdir}/rocm-device-libs_1.0.0.50400-72~22.04_amd64.deb"
	egz "${srcdir}/rocm-language-runtime_5.4.0.50400-72~22.04_amd64.deb"
	egz "${srcdir}/rocm-hip-runtime_5.4.0.50400-72~22.04_amd64.deb"
	egz "${srcdir}/rocm-ocl-icd_2.0.0.50400-72~22.04_amd64.deb"
	egz "${srcdir}/rocm-opencl_2.0.0.50400-72~22.04_amd64.deb"
	egz "${srcdir}/rocm-opencl-dev_2.0.0.50400-72~22.04_amd64.deb"
	egz "${srcdir}/rocm-opencl-runtime_5.4.0.50400-72~22.04_amd64.deb"
	exz "${srcdir}/rocm-clang-ocl_0.5.0.50400-72~22.04_amd64.deb"
	egz "${srcdir}/rocm-smi-lib_5.0.0.50400-72~22.04_amd64.deb"
	exz "${srcdir}/rocm-cmake_0.8.0.50400-72~22.04_amd64.deb"
	egz "${srcdir}/rocm-dbgapi_0.68.0.50400-72~22.04_amd64.deb"
	egz "${srcdir}/rocm-debug-agent_2.0.3.50400-72~22.04_amd64.deb"
	egz "${srcdir}/rocm-utils_5.4.0.50400-72~22.04_amd64.deb"
	egz "${srcdir}/rocprofiler-dev_1.0.0.50400-72~22.04_amd64.deb"
	egz "${srcdir}/roctracer-dev_4.1.0.50400-72~22.04_amd64.deb"
	egz "${srcdir}/rocm-dev_5.4.0.50400-72~22.04_amd64.deb"
	egz "${srcdir}/hsa-amd-aqlprofile_1.0.0.50400-72~22.04_amd64.deb"
	exz "${srcdir}/libdrm-amdgpu-amdgpu1_2.4.113.50400-1510348.22.04_amd64.deb"
	egz "${srcdir}/openmp-extras-runtime_15.54.0.50400-72~22.04_amd64.deb"
	egz "${srcdir}/rocm-gdb_12.1.50400-72~22.04_amd64.deb"
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
	ln -s "/opt/rocm-5.4.0" "$pkgdir/opt/rocm"
	#ln -s "/opt/rocm-5.4.0/hip/bin/.hipVersion" "$pkgdir/opt/rocm-5.4.0/bin/.hipVersion"

	mkdir -p "${pkgdir}/opt/amdgpu/share/libdrm"
	cd "${pkgdir}/opt/amdgpu/share/libdrm"
	ln -s /usr/share/libdrm/amdgpu.ids amdgpu.ids		

	mkdir -p ${pkgdir}/etc/OpenCL/vendors	
	echo libamdocl64.so > "${pkgdir}/etc/OpenCL/vendors/amdocl64.icd"
	echo libamdocl-orca64.so > "${pkgdir}/etc/OpenCL/vendors/amdocl-orca64.icd"

	mkdir -p ${pkgdir}/etc/ld.so.conf.d
	echo /opt/rocm-5.4.0/opencl/lib > "$pkgdir/etc/ld.so.conf.d/opencl-amd.conf"
	echo /opt/rocm-5.4.0/lib >> "$pkgdir/etc/ld.so.conf.d/opencl-amd.conf"
	echo /opt/rocm-5.4.0/hip/lib >> "$pkgdir/etc/ld.so.conf.d/opencl-amd.conf"

	mkdir -p ${pkgdir}/etc/profile.d
	echo export PATH="\${PATH}:/opt/rocm-5.4.0/bin:/opt/rocm-5.4.0/hip/bin" > "$pkgdir/etc/profile.d/opencl-amd.sh"
}
