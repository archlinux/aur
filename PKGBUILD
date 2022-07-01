# Maintainer: Carson Rueter <roachh at proton mail dot com>
# Co-Maintainer: George Sofianos

# Release notes https://docs.amd.com/bundle/ROCm-Release-Notes-v5.2/page/About_This_Document.html
amdgpu_install='22.20.0.50200'
amdgpu_version='22.20.0'
rocm_version='50200'
amdgpu_build_id='1438746~20.04'
rocm_build_id='65'
amdgpu_repo='https://repo.radeon.com/amdgpu/22.20/ubuntu'
rocm_repo='https://repo.radeon.com/rocm/apt/5.2'
opencl_lib='opt/rocm-5.2.0/opencl/lib'
rocm_lib='opt/rocm-5.2.0/lib'
hip_lib='opt/rocm-5.2.0/hip/lib/'
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
provides=('opencl-driver' 'rocm-core' 'hsakmt-roct-dev' 'hsa-rocr' 'hsa-rocr-dev' 'rocminfo' 'hip-runtime-amd' 'rocm-device-libs' 'rocm-language-runtime' 
	'rocm-hip-runtime' 'rocm-ocl-icd' 'rocm-opencl' 'rocm-opencl-dev' 'rocm-opencl-runtime')
optdepends=('clinfo' 'opencl-amd-dev')

source=(
# LIBDRM
"https://repo.radeon.com/amdgpu/22.20/ubuntu/pool/main/libd/libdrm-amdgpu/libdrm-amdgpu-amdgpu1_2.4.110.50200-1438746~20.04_amd64.deb"
# ROCM
"https://repo.radeon.com/rocm/apt/5.2/pool/main/r/rocm-core/rocm-core_5.2.0.50200-65_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.2/pool/main/c/comgr/comgr_2.4.0.50200-65_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.2/pool/main/h/hip-dev/hip-dev_5.2.21151.50200-65_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.2/pool/main/h/hip-doc/hip-doc_5.2.21151.50200-65_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.2/pool/main/h/hip-samples/hip-samples_5.2.21151.50200-65_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.2/pool/main/h/hsakmt-roct-dev/hsakmt-roct-dev_20220426.0.86.50200-65_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.2/pool/main/h/hsa-rocr/hsa-rocr_1.5.0.50200-65_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.2/pool/main/h/hsa-rocr-dev/hsa-rocr-dev_1.5.0.50200-65_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.2/pool/main/r/rocminfo/rocminfo_1.0.0.50200-65_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.2/pool/main/h/hip-runtime-amd/hip-runtime-amd_5.2.21151.50200-65_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.2/pool/main/r/rocm-device-libs/rocm-device-libs_1.0.0.50200-65_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.2/pool/main/r/rocm-language-runtime/rocm-language-runtime_5.2.0.50200-65_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.2/pool/main/r/rocm-hip-runtime/rocm-hip-runtime_5.2.0.50200-65_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.2/pool/main/r/rocm-ocl-icd/rocm-ocl-icd_2.0.0.50200-65_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.2/pool/main/r/rocm-opencl/rocm-opencl_2.0.0.50200-65_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.2/pool/main/r/rocm-opencl-dev/rocm-opencl-dev_2.0.0.50200-65_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.2/pool/main/r/rocm-opencl-runtime/rocm-opencl-runtime_5.2.0.50200-65_amd64.deb"
# ROCM DEV
"https://repo.radeon.com/rocm/apt/5.2/pool/main/r/rocm-clang-ocl/rocm-clang-ocl_0.5.0.50200-65_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.2/pool/main/o/openmp-extras/openmp-extras_14.52.0.50200-65_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.2/pool/main/r/rocm-smi-lib/rocm-smi-lib_5.0.0.50200-65_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.2/pool/main/r/rocm-cmake/rocm-cmake_0.7.3.50200-65_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.2/pool/main/r/rocm-dbgapi/rocm-dbgapi_0.65.1.50200-65_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.2/pool/main/r/rocm-debug-agent/rocm-debug-agent_2.0.3.50200-65_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.2/pool/main/r/rocm-gdb/rocm-gdb_11.2.50200-65_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.2/pool/main/r/rocm-utils/rocm-utils_5.2.0.50200-65_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.2/pool/main/r/rocprofiler-dev/rocprofiler-dev_1.0.0.50200-65_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.2/pool/main/r/roctracer-dev/roctracer-dev_1.0.0.50200-65_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.2/pool/main/r/rocm-dev/rocm-dev_5.2.0.50200-65_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.2/pool/main/h/hsa-amd-aqlprofile/hsa-amd-aqlprofile_1.0.0.50200-65_amd64.deb"
# Proprietary
"https://repo.radeon.com/amdgpu/22.20/ubuntu/pool/proprietary/o/opencl-legacy-amdgpu-pro/opencl-legacy-amdgpu-pro-icd_22.20-1438746~20.04_amd64.deb"
#"https://repo.radeon.com/amdgpu/22.20/ubuntu/pool/proprietary/c/clinfo-amdgpu-pro/clinfo-amdgpu-pro_22.10-1438746~20.04_amd64.deb"
#"https://repo.radeon.com/amdgpu/22.20/ubuntu/pool/proprietary/o/ocl-icd-amdgpu-pro/ocl-icd-libopencl1-amdgpu-pro_22.10-1438746~20.04_amd64.deb"
#"https://repo.radeon.com/amdgpu/22.20/ubuntu/pool/proprietary/a/amf-amdgpu-pro/amf-amdgpu-pro_1.4.24-1438746~20.04_amd64.deb"
)

sha256sums=(
"2918f1e81d45b17b05e795a547411f607b22cbd5d884eefa21ead22ec2b8ad51"

"85eaadb446fa7de3557d790cb86a32a8a77568d172fe55d6c43aa57e3958da08"
"d0fdeb92b4944adad36f276706ac9f7ca49bd1fc16feedd3ae1612f0d3b51398"
"569ee13440e2dd38561d61fa576153cbea8ae7d4b90130a82fcb91199b097b7c"
"87d01b36f0016f6056e7bec96c39df893e8896e88cd85a7f505674e63b775893"
"1fd3bac6e4472c69bd984620f108b75f2218aed7f834bd3198d37fa399a6d39e"
"3b39e47c5dbb084dd3c9554c9b47c743294d3726d817b550b30db5ceee7c8a36"
"a0bee29bdf353b19dafc9d6f7a75d3663009293be3d5578bf3343fc36eb45331"
"1171370293db0f163ad5cb55c923f2c48d8c128a54a5a7743ec721a66da3a421"
"5daafd05e41c91a14b7e979b3c6aeb47168af0bc6b76249a38c59f5f49ae82fe"
"cb9afb3b03e2b9143f56ad7fce3c694155ec34fc5682678d40ca30e7b97d5374"
"2ab86cbe4f78b2ddf24536c11563296d742386a6ec27193e36fb64e7fc34125a"
"68efc7f3e5797dd46380e56343d724fef208b8a89cfd8b622ef23c9e2b74b1d6"
"e973975bb89a0993d212a84ca4f4446d984e1fa8103c5bc549562ace2b5d64f6"
"051f5119e51750897f54a2d9c7fe62e0edfe0b96991872269b0cd92410544a32"
"7f1b2a271ae4c3c64f97a3a451649b6c0a48041ef88471bdcf484d5a982e81f3"
"18e906ef532becdc102557e957ab5c69a5309fceb5bc20ccdf9e74fcfcabe12e"
"289642aee2ad00c7662a415e760e665df27a5edd047b1d14f78e81ad9e50f2b9"

"040c05001b24ca447035fd544ceac8fd8a475cf04948e65cdef59b201e24565c"
"81d4453eb7ad4d83501b389ce7e9e3a67584e1f7977fea23609bb003674ac632"
"8ad72af197577d11a31715bb5a5910f9575bde00b2700d692d5cc444d2af428f"
"7b51d80d34ab72cc9c8bbaca9696836adfeb725b33ef217fc3eb20a98b3e1a1f"
"45d16072c307eeeb6efdb32a46af607095ae611dd884a14b0a5c87bd99381c86"
"53297ff834f6a676fe29e9b13b9a56ced7f6e56dab0e2618afb6c58bc2344dc8"
"0b5be8f4c957470f751319a67a584cfe29bca8dc352bc92269ddf24881fa8c07"
"199eddd4001fcd1577f53862025f432f16d9e5244f1cc45773a5c1c609a3e14e"
"cc3acd60bcd3d2473455e820d76db43871bac4a4243824127656ec4708de6d6c"
"cb7a2b3a7a3686d12ba16a56605d3dc4e95ad6670359e41ddc17a5f449ccd1b9"
"324e05e5e2585041a5d60cf5f25ece8a5be21bcbb96200cbbbb2064a93550d11"
"4730b61c61d7caf349a3fe82f93acca708e2da760762213111e0b3100f0bc3f4"
"6d1c2078c105aef671e2689e838ea45fede613209beeee81bb0fe1e938e6d8ff"
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
	egz "${srcdir}/rocm-core_5.2.0.50200-65_amd64.deb"
	egz "${srcdir}/comgr_2.4.0.50200-65_amd64.deb"
	egz "${srcdir}/hip-dev_5.2.21151.50200-65_amd64.deb"
	egz "${srcdir}/hip-doc_5.2.21151.50200-65_amd64.deb"
	egz "${srcdir}/hip-samples_5.2.21151.50200-65_amd64.deb"
	egz "${srcdir}/hsakmt-roct-dev_20220426.0.86.50200-65_amd64.deb"
	egz "${srcdir}/hsa-rocr_1.5.0.50200-65_amd64.deb"
	egz "${srcdir}/hsa-rocr-dev_1.5.0.50200-65_amd64.deb"
	egz "${srcdir}/rocminfo_1.0.0.50200-65_amd64.deb"
	egz "${srcdir}/hip-runtime-amd_5.2.21151.50200-65_amd64.deb"
	egz "${srcdir}/rocm-device-libs_1.0.0.50200-65_amd64.deb"
	egz "${srcdir}/rocm-language-runtime_5.2.0.50200-65_amd64.deb"
	egz "${srcdir}/rocm-hip-runtime_5.2.0.50200-65_amd64.deb"
	egz "${srcdir}/rocm-ocl-icd_2.0.0.50200-65_amd64.deb"
	egz "${srcdir}/rocm-opencl_2.0.0.50200-65_amd64.deb"
	egz "${srcdir}/rocm-opencl-dev_2.0.0.50200-65_amd64.deb"
	egz "${srcdir}/rocm-opencl-runtime_5.2.0.50200-65_amd64.deb"
	egz "${srcdir}/rocm-clang-ocl_0.5.0.50200-65_amd64.deb"
	egz "${srcdir}/rocm-smi-lib_5.0.0.50200-65_amd64.deb"
	egz "${srcdir}/rocm-cmake_0.7.3.50200-65_amd64.deb"
	egz "${srcdir}/rocm-dbgapi_0.65.1.50200-65_amd64.deb"
	egz "${srcdir}/rocm-debug-agent_2.0.3.50200-65_amd64.deb"
	egz "${srcdir}/rocm-utils_5.2.0.50200-65_amd64.deb"
	egz "${srcdir}/rocprofiler-dev_1.0.0.50200-65_amd64.deb"
	egz "${srcdir}/roctracer-dev_1.0.0.50200-65_amd64.deb"
	egz "${srcdir}/rocm-dev_5.2.0.50200-65_amd64.deb"
	egz "${srcdir}/hsa-amd-aqlprofile_1.0.0.50200-65_amd64.deb"
	exz "${srcdir}/libdrm-amdgpu-amdgpu1_2.4.110.50200-1438746~20.04_amd64.deb"
	exz "${srcdir}/openmp-extras_14.52.0.50200-65_amd64.deb"
	exz "${srcdir}/rocm-gdb_11.2.50200-65_amd64.deb"
	exz "${srcdir}/opencl-legacy-amdgpu-pro-icd_22.20-1438746~20.04_amd64.deb"

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
	ln -s "/opt/rocm-5.2.0" "$pkgdir/opt/rocm"
	#ln -s "/opt/rocm-5.2.0/hip/bin/.hipVersion" "$pkgdir/opt/rocm-5.2.0/bin/.hipVersion"

	mkdir -p "${pkgdir}/opt/amdgpu/share/libdrm"
	cd "${pkgdir}/opt/amdgpu/share/libdrm"
	ln -s /usr/share/libdrm/amdgpu.ids amdgpu.ids		

	mkdir -p ${pkgdir}/etc/OpenCL/vendors	
	echo libamdocl64.so > "${pkgdir}/etc/OpenCL/vendors/amdocl64.icd"
	echo libamdocl-orca64.so > "${pkgdir}/etc/OpenCL/vendors/amdocl-orca64.icd"

	mkdir -p ${pkgdir}/etc/ld.so.conf.d
	echo /opt/rocm-5.2.0/opencl/lib > "$pkgdir/etc/ld.so.conf.d/opencl-amd.conf"
	echo /opt/rocm-5.2.0/lib >> "$pkgdir/etc/ld.so.conf.d/opencl-amd.conf"
	echo /opt/rocm-5.2.0/hip/lib >> "$pkgdir/etc/ld.so.conf.d/opencl-amd.conf"

	mkdir -p ${pkgdir}/etc/profile.d
	echo export PATH="\${PATH}:/opt/rocm-5.2.0/bin:/opt/rocm-5.2.0/hip/bin" > "$pkgdir/etc/profile.d/opencl-amd.sh"
}
