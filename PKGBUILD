# Maintainer: Carson Rueter <roachh at proton mail dot com>
# Co-Maintainer: George Sofianos

# Release notes https://docs.amd.com/bundle/ROCm-Release-Notes-v5.3.3/page/About_This_Document.html
amdgpu_install='22.40.0.50303'
amdgpu_version='22.40.0'
rocm_version='50303'
amdgpu_build_id='1504718.22.04'
rocm_build_id='99~22.04'
hip_build_id='22062'
amdgpu_repo='https://repo.radeon.com/amdgpu/5.3.3/ubuntu'
rocm_repo='https://repo.radeon.com/rocm/apt/5.3.3'
opencl_lib='opt/rocm-5.3.3/opencl/lib'
rocm_lib='opt/rocm-5.3.3/lib'
hip_lib='opt/rocm-5.3.3/hip/lib/'
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
"https://repo.radeon.com/amdgpu/5.3.3/ubuntu/pool/main/libd/libdrm-amdgpu/libdrm-amdgpu-amdgpu1_2.4.112.50303-1504718.22.04_amd64.deb"
# ROCM
"https://repo.radeon.com/rocm/apt/5.3.3/pool/main/r/rocm-core/rocm-core_5.3.3.50303-99~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3.3/pool/main/c/comgr/comgr_2.4.0.50303-99~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3.3/pool/main/h/hip-dev/hip-dev_5.3.22062.50303-99~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3.3/pool/main/h/hip-doc/hip-doc_5.3.22062.50303-99~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3.3/pool/main/h/hip-samples/hip-samples_5.3.22062.50303-99~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3.3/pool/main/h/hsakmt-roct-dev/hsakmt-roct-dev_20220803.1.8.50303-99~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3.3/pool/main/h/hsa-rocr/hsa-rocr_1.7.0.50303-99~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3.3/pool/main/h/hsa-rocr-dev/hsa-rocr-dev_1.7.0.50303-99~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3.3/pool/main/r/rocminfo/rocminfo_1.0.0.50303-99~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3.3/pool/main/h/hip-runtime-amd/hip-runtime-amd_5.3.22062.50303-99~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3.3/pool/main/r/rocm-device-libs/rocm-device-libs_1.0.0.50303-99~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3.3/pool/main/r/rocm-language-runtime/rocm-language-runtime_5.3.3.50303-99~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3.3/pool/main/r/rocm-hip-runtime/rocm-hip-runtime_5.3.3.50303-99~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3.3/pool/main/r/rocm-ocl-icd/rocm-ocl-icd_2.0.0.50303-99~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3.3/pool/main/r/rocm-opencl/rocm-opencl_2.0.0.50303-99~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3.3/pool/main/r/rocm-opencl-dev/rocm-opencl-dev_2.0.0.50303-99~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3.3/pool/main/r/rocm-opencl-runtime/rocm-opencl-runtime_5.3.3.50303-99~22.04_amd64.deb"
# ROCM DEV
"https://repo.radeon.com/rocm/apt/5.3.3/pool/main/r/rocm-clang-ocl/rocm-clang-ocl_0.5.0.50303-99~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3.3/pool/main/o/openmp-extras-runtime/openmp-extras-runtime_15.53.0.50303-99~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3.3/pool/main/r/rocm-smi-lib/rocm-smi-lib_5.0.0.50303-99~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3.3/pool/main/r/rocm-cmake/rocm-cmake_0.8.0.50303-99~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3.3/pool/main/r/rocm-dbgapi/rocm-dbgapi_0.67.0.50303-99~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3.3/pool/main/r/rocm-debug-agent/rocm-debug-agent_2.0.3.50303-99~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3.3/pool/main/r/rocm-gdb/rocm-gdb_12.1.50303-99~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3.3/pool/main/r/rocm-utils/rocm-utils_5.3.3.50303-99~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3.3/pool/main/r/rocprofiler-dev/rocprofiler-dev_1.0.0.50303-99~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3.3/pool/main/r/roctracer-dev/roctracer-dev_4.1.0.50303-99~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3.3/pool/main/r/rocm-dev/rocm-dev_5.3.3.50303-99~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.3.3/pool/main/h/hsa-amd-aqlprofile/hsa-amd-aqlprofile_1.0.0.50303-99~22.04_amd64.deb"
# Proprietary
#"https://repo.radeon.com/amdgpu/22.20.3/ubuntu/pool/proprietary/o/opencl-legacy-amdgpu-pro/opencl-legacy-amdgpu-pro-icd_22.20-1462318~22.04_amd64.deb"
#"https://repo.radeon.com/amdgpu/22.20.3/ubuntu/pool/proprietary/c/clinfo-amdgpu-pro/clinfo-amdgpu-pro_22.10-1462318~22.04_amd64.deb"
#"https://repo.radeon.com/amdgpu/22.20.3/ubuntu/pool/proprietary/o/ocl-icd-amdgpu-pro/ocl-icd-libopencl1-amdgpu-pro_22.10-1462318~22.04_amd64.deb"
#"https://repo.radeon.com/amdgpu/22.20.3/ubuntu/pool/proprietary/a/amf-amdgpu-pro/amf-amdgpu-pro_1.4.24-1462318~22.04_amd64.deb"
)

sha256sums=(
"ab800dc58a7ffa95807771f08667ce883213e3e10aab5543917f9c528206c030"

"e5e37ac5492413f7145a848c8f2d6f6054d61ac784cc8a96b0bd3e979074f277"
"433633583e11b696f361987d441e6b74cf20c36706d47a25fe788868ca7dec52"
"878c26095e31e6f49dbf17f66caaaaf89d311e2aa9ef41a297d9ba883d7c365d"
"49f6a99afed9c1a426d766a65e865c39d4581d2c7b2758cab0707f990d324a44"
"44cf762f187fecd19614a3a8026cfe4e656f1f783a15d8cefb83d164fcf1d743"
"31e311b42a2494461effa4750fceb52b401ddd3d379df8a7d9381aba1d436a79"
"201b70c73273106f399e86557ac2486dbd2517e5e7e0c1c51637c8c975dc3546"
"4973e720b2623c23eccca2e2bef2f87828da79d22b912603c2a26a93ec3bb656"
"b9e97e5cad9321ec9d33058ab28fe3230aebd42b8e507422dfd4083e943777b2"
"3001afbb85e2e57209511a4dd9e0adb271f1f42f1a10d66008bd99a56ca3fd32"
"26d0761f3cd49feefa83999eaf7f5549e2f486202be56276d32e4ce811500419"
"41e99a87476992e44bb20b0c80e99bac88a6b38137cabfac88fa4fa08816ef64"
"47ecf61e51fd626be6f38e54e4b98c24869511a1d2df2c97f3ae0dde5b960753"
"08b9910b16915e42dc071feb5d96180ef635db6da4cf1822d7bb89e096b3a882"
"312f247e2e4f2c819634a820e7443a1fe6e514787145275398228a1052e7f5b0"
"1996339f5e83e7b53fc4fb8d0740d2fd2e041fd160c9a19cb5db00a923ac76f4"
"cc1d3ac74f2e254696d5b15d7842ebe9717dc1783fd2b5bebe939b2470cb38bd"

"6f422772acceb37d2e76a4147fdcba41e5f8dcabdb14cd79ffc0104473582e4b"
"abed59a7d4beea0711137ca690c4c51aad91603d7c4de9703b0fb22d4e229ca9"
"98642b7eba5660c33d6f1a15bccddba26cbc3ba92b0cc000b9d8fcdedb6e780b"
"60873db2564c74138f211cba23818abef310c73b1e25052d15ff74e8dc573da1"
"35e66c31189fbac52a2e84556a36fa3579c9920772dde3b915ad7061751eca4a"
"f80b42cd67282f5d9c40f90cbf5436135b483352a5e389871816cee4c2d5d049"
"310273baa8d732f8e5e4cd9d4828558875296054685f9e0cf094343849994add"
"229916ce194db319ebbced8b6e09b257e092a84ba7b9b95083f5918679e263e1"
"e8934233201ee4884da9a0e4d8308dec7cf67fee9f9cf54752feb7cd7ac352a3"
"cd92a5512dfbcb206e08e08a445bcc063a8bbc78168e066dbc0195283474d22f"
"5671a4d0cc544cc18f7f36544764187f8c3c0f205b4158cd64aaeb0fd8a436d8"
"69b4f2fb900a6e0a4ce20d8e8147772d8e68147275ada382c14534246e9cb997"
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
	egz "${srcdir}/rocm-core_5.3.3.50303-99~22.04_amd64.deb"
	egz "${srcdir}/comgr_2.4.0.50303-99~22.04_amd64.deb"
	egz "${srcdir}/hip-dev_5.3.22062.50303-99~22.04_amd64.deb"
	egz "${srcdir}/hip-doc_5.3.22062.50303-99~22.04_amd64.deb"
	egz "${srcdir}/hip-samples_5.3.22062.50303-99~22.04_amd64.deb"
	egz "${srcdir}/hsakmt-roct-dev_20220803.1.8.50303-99~22.04_amd64.deb"
	egz "${srcdir}/hsa-rocr_1.7.0.50303-99~22.04_amd64.deb"
	egz "${srcdir}/hsa-rocr-dev_1.7.0.50303-99~22.04_amd64.deb"
	egz "${srcdir}/rocminfo_1.0.0.50303-99~22.04_amd64.deb"
	egz "${srcdir}/hip-runtime-amd_5.3.22062.50303-99~22.04_amd64.deb"
	egz "${srcdir}/rocm-device-libs_1.0.0.50303-99~22.04_amd64.deb"
	egz "${srcdir}/rocm-language-runtime_5.3.3.50303-99~22.04_amd64.deb"
	egz "${srcdir}/rocm-hip-runtime_5.3.3.50303-99~22.04_amd64.deb"
	egz "${srcdir}/rocm-ocl-icd_2.0.0.50303-99~22.04_amd64.deb"
	egz "${srcdir}/rocm-opencl_2.0.0.50303-99~22.04_amd64.deb"
	egz "${srcdir}/rocm-opencl-dev_2.0.0.50303-99~22.04_amd64.deb"
	egz "${srcdir}/rocm-opencl-runtime_5.3.3.50303-99~22.04_amd64.deb"
	exz "${srcdir}/rocm-clang-ocl_0.5.0.50303-99~22.04_amd64.deb"
	egz "${srcdir}/rocm-smi-lib_5.0.0.50303-99~22.04_amd64.deb"
	exz "${srcdir}/rocm-cmake_0.8.0.50303-99~22.04_amd64.deb"
	egz "${srcdir}/rocm-dbgapi_0.67.0.50303-99~22.04_amd64.deb"
	egz "${srcdir}/rocm-debug-agent_2.0.3.50303-99~22.04_amd64.deb"
	egz "${srcdir}/rocm-utils_5.3.3.50303-99~22.04_amd64.deb"
	egz "${srcdir}/rocprofiler-dev_1.0.0.50303-99~22.04_amd64.deb"
	egz "${srcdir}/roctracer-dev_4.1.0.50303-99~22.04_amd64.deb"
	egz "${srcdir}/rocm-dev_5.3.3.50303-99~22.04_amd64.deb"
	egz "${srcdir}/hsa-amd-aqlprofile_1.0.0.50303-99~22.04_amd64.deb"
	exz "${srcdir}/libdrm-amdgpu-amdgpu1_2.4.112.50303-1504718.22.04_amd64.deb"
	egz "${srcdir}/openmp-extras-runtime_15.53.0.50303-99~22.04_amd64.deb"
	egz "${srcdir}/rocm-gdb_12.1.50303-99~22.04_amd64.deb"
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
	ln -s "/opt/rocm-5.3.3" "$pkgdir/opt/rocm"
	#ln -s "/opt/rocm-5.3.3/hip/bin/.hipVersion" "$pkgdir/opt/rocm-5.3.3/bin/.hipVersion"

	mkdir -p "${pkgdir}/opt/amdgpu/share/libdrm"
	cd "${pkgdir}/opt/amdgpu/share/libdrm"
	ln -s /usr/share/libdrm/amdgpu.ids amdgpu.ids		

	mkdir -p ${pkgdir}/etc/OpenCL/vendors	
	echo libamdocl64.so > "${pkgdir}/etc/OpenCL/vendors/amdocl64.icd"
	echo libamdocl-orca64.so > "${pkgdir}/etc/OpenCL/vendors/amdocl-orca64.icd"

	mkdir -p ${pkgdir}/etc/ld.so.conf.d
	echo /opt/rocm-5.3.3/opencl/lib > "$pkgdir/etc/ld.so.conf.d/opencl-amd.conf"
	echo /opt/rocm-5.3.3/lib >> "$pkgdir/etc/ld.so.conf.d/opencl-amd.conf"
	echo /opt/rocm-5.3.3/hip/lib >> "$pkgdir/etc/ld.so.conf.d/opencl-amd.conf"

	mkdir -p ${pkgdir}/etc/profile.d
	echo export PATH="\${PATH}:/opt/rocm-5.3.3/bin:/opt/rocm-5.3.3/hip/bin" > "$pkgdir/etc/profile.d/opencl-amd.sh"
}
