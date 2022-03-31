# Maintainer: Carson Rueter <roachh at proton mail dot com>
# Co-Maintainer: George Sofianos

# Release notes https://docs.amd.com/bundle/ROCm-Release-Notes-v5.1/page/About_This_Document.html
amdgpu_install='22.10.50100'
amdgpu_version='22.10'
rocm_version='50100'
amdgpu_build_id='1395274'
rocm_build_id='36'
amdgpu_repo='https://repo.radeon.com/amdgpu/22.10/ubuntu'
rocm_repo='https://repo.radeon.com/rocm/apt/5.1'
opencl_lib='opt/rocm-5.1.0/opencl/lib'
rocm_lib='opt/rocm-5.1.0/lib'
hip_lib='opt/rocm-5.1.0/hip/lib/'
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
"https://repo.radeon.com/amdgpu/22.10/ubuntu/pool/main/libd/libdrm-amdgpu/libdrm-amdgpu-amdgpu1_2.4.109.50100-1395274_amd64.deb"
# ROCM
"https://repo.radeon.com/rocm/apt/5.1/pool/main/r/rocm-core/rocm-core_5.1.0.50100-36_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1/pool/main/c/comgr/comgr_2.4.0.50100-36_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1/pool/main/h/hip-dev/hip-dev_5.1.20531.50100-36_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1/pool/main/h/hip-doc/hip-doc_5.1.20531.50100-36_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1/pool/main/h/hip-samples/hip-samples_5.1.20531.50100-36_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1/pool/main/h/hsakmt-roct-dev/hsakmt-roct-dev_20220128.1.7.50100-36_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1/pool/main/h/hsa-rocr/hsa-rocr_1.5.0.50100-36_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1/pool/main/h/hsa-rocr-dev/hsa-rocr-dev_1.5.0.50100-36_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1/pool/main/r/rocminfo/rocminfo_1.0.0.50100-36_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1/pool/main/h/hip-runtime-amd/hip-runtime-amd_5.1.20531.50100-36_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1/pool/main/r/rocm-device-libs/rocm-device-libs_1.0.0.50100-36_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1/pool/main/r/rocm-language-runtime/rocm-language-runtime_5.1.0.50100-36_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1/pool/main/r/rocm-hip-runtime/rocm-hip-runtime_5.1.0.50100-36_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1/pool/main/r/rocm-ocl-icd/rocm-ocl-icd_2.0.0.50100-36_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1/pool/main/r/rocm-opencl/rocm-opencl_2.0.0.50100-36_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1/pool/main/r/rocm-opencl-dev/rocm-opencl-dev_2.0.0.50100-36_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1/pool/main/r/rocm-opencl-runtime/rocm-opencl-runtime_5.1.0.50100-36_amd64.deb"
# ROCM DEV
"https://repo.radeon.com/rocm/apt/5.1/pool/main/r/rocm-clang-ocl/rocm-clang-ocl_0.5.0.50100-36_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1/pool/main/o/openmp-extras/openmp-extras_13.51.0.50100-36_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1/pool/main/r/rocm-smi-lib/rocm-smi-lib_5.0.0.50100-36_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1/pool/main/r/rocm-cmake/rocm-cmake_0.7.2.50100-36_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1/pool/main/r/rocm-dbgapi/rocm-dbgapi_0.64.0.50100-36_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1/pool/main/r/rocm-debug-agent/rocm-debug-agent_2.0.3.50100-36_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1/pool/main/r/rocm-gdb/rocm-gdb_11.2.50100-36_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1/pool/main/r/rocm-utils/rocm-utils_5.1.0.50100-36_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1/pool/main/r/rocprofiler-dev/rocprofiler-dev_1.0.0.50100-36_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1/pool/main/r/roctracer-dev/roctracer-dev_1.0.0.50100-36_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1/pool/main/r/rocm-dev/rocm-dev_5.1.0.50100-36_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1/pool/main/h/hsa-amd-aqlprofile/hsa-amd-aqlprofile_1.0.0.50100-36_amd64.deb"
# Proprietary
"https://repo.radeon.com/amdgpu/22.10/ubuntu/pool/proprietary/o/opencl-legacy-amdgpu-pro/opencl-legacy-amdgpu-pro-icd_22.10-1395274_amd64.deb"
#"https://repo.radeon.com/amdgpu/22.10/ubuntu/pool/proprietary/c/clinfo-amdgpu-pro/clinfo-amdgpu-pro_22.10-1395274_amd64.deb"
#"https://repo.radeon.com/amdgpu/22.10/ubuntu/pool/proprietary/o/ocl-icd-amdgpu-pro/ocl-icd-libopencl1-amdgpu-pro_22.10-1395274_amd64.deb"
#"https://repo.radeon.com/amdgpu/22.10/ubuntu/pool/proprietary/a/amf-amdgpu-pro/amf-amdgpu-pro_1.4.24-1395274_amd64.deb"
)

sha256sums=(
"5fea0d76dbd2662f2db560d2152b01bff073a55789963bcb24b4f1ed5a06c898"

"c019d97cfef8f8fd0d8b5bc24634dd05b40e9c9f8c69c4c2ba62b626c6dacd82"
"fe34245b1127ee964bf54033f8cfb15e5c68750d59bf4fba20019303acc548f3"
"df5382602674c337720c0e2357f946f57c030015c470844c6594b6d5cf061e2b"
"2bc320444fb1a836a4449adf0b791261db1b390ef429bf2a3bd06ff7e57cc807"
"b21376be568e20239e75a73c3c48922aec890742749c0b27765349d0683ca5f4"
"61791c70194eae77f91736deb56dad77f028782ebe16173cdb26746725504d50"
"560d1f6c91738b532877f15481460feef4a52eae2142caa717e894b240e78967"
"a0fccc204adbbc9ac68c4e826e04c1a1edf6e8ea6406b1ad57e0c57c94bee56f"
"a065e1f08a2a78a52939653dbbd2493767aebd992a012772ed58110961bdf467"
"937023b6ba674f2297883355bb60f68032dff36671cd9ae7c41a423e66a70b9f"
"8287dddcf88c13c34702fda3d8e9242d1aa7dc509fbf54516f0d991e8eb5fa1f"
"4d2d766af005f2e0a4f225faee837c2a4fbdf794c65e48907d1316817e35e35c"
"3b420acdfe8d37eb73dd4bf8077e5a24a26a30085919e8b12720b4c683813368"
"7ed35a542d658c7c8358ca25b5bf9526edc59e2d0833f0d11f3a866cbef0775d"
"02b3f10e47e1c97471e08f4e536dbbc43690315da593a8ed6e5c6ba8412fc71f"
"768587793f3b729c80fcfc30db7c78afaef759875c9e205e6186b42b2511df07"
"9951ec490b749a79dbbfc01bea422ca0b834c07891db98c8d80b33616c233c79"

"7390b2a6fae4932147bb787c63018b41f58ad6ec38b13d615385ef8214df0cff"
"5b3961c07b886917808f7c93db9f4cfa3b82eb28ef80ece075793dfe9cd25577"
"31e388fd038efebca1078829bb2e22e3c66a4005a529841a33fbfedce22690ab"
"063a7f271e77f71199df5bacfbe026cb00b169eba3649fa3b9795cefbf01c8d0"
"de8fade9bb1b80228e01c82f9682d380ec5ddb8de183b0df9886e15812c57914"
"746d5c4ee0d640bda4ba209ca94667ebe3846f1ba8141736876101f6d7755358"
"2e03ba5a665c97b89ee8acaef2b7817c25a8ec43c128ae137e8c9d849070ba43"
"f14186bca91bc0ad1cb2a6edb6fe23e749c7a7d80517becad2bf619035fa61c3"
"09816a6257388ebaa4428f497422de5b2f79830ff8e1bcf066bde20d25c6d934"
"97c38517074756500d8e6f26247f9f6fe62d2ccc2afc53d969cf180b542ca26e"
"847593912e770dbd11e9504af6cebf0957695559c7495cae39c3c8af69a19fea"
"abc50264640a9a05ca1bdf5cc90158b7437f435684c4f260a629e8c75356bc79"
"7e0e647abeaa304d7541e8657c09c9a9b124577ad920a465a8c9aa22313d8885"
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
	egz "${srcdir}/rocm-core_5.1.0.50100-36_amd64.deb"
	egz "${srcdir}/comgr_2.4.0.50100-36_amd64.deb"
	egz "${srcdir}/hip-dev_5.1.20531.50100-36_amd64.deb"
	egz "${srcdir}/hip-doc_5.1.20531.50100-36_amd64.deb"
	egz "${srcdir}/hip-samples_5.1.20531.50100-36_amd64.deb"
	egz "${srcdir}/hsakmt-roct-dev_20220128.1.7.50100-36_amd64.deb"
	egz "${srcdir}/hsa-rocr_1.5.0.50100-36_amd64.deb"
	egz "${srcdir}/hsa-rocr-dev_1.5.0.50100-36_amd64.deb"
	egz "${srcdir}/rocminfo_1.0.0.50100-36_amd64.deb"
	egz "${srcdir}/hip-runtime-amd_5.1.20531.50100-36_amd64.deb"
	egz "${srcdir}/rocm-device-libs_1.0.0.50100-36_amd64.deb"
	egz "${srcdir}/rocm-language-runtime_5.1.0.50100-36_amd64.deb"
	egz "${srcdir}/rocm-hip-runtime_5.1.0.50100-36_amd64.deb"
	egz "${srcdir}/rocm-ocl-icd_2.0.0.50100-36_amd64.deb"
	egz "${srcdir}/rocm-opencl_2.0.0.50100-36_amd64.deb"
	egz "${srcdir}/rocm-opencl-dev_2.0.0.50100-36_amd64.deb"
	egz "${srcdir}/rocm-opencl-runtime_5.1.0.50100-36_amd64.deb"
	egz "${srcdir}/rocm-clang-ocl_0.5.0.50100-36_amd64.deb"
	egz "${srcdir}/rocm-smi-lib_5.0.0.50100-36_amd64.deb"
	egz "${srcdir}/rocm-cmake_0.7.2.50100-36_amd64.deb"
	egz "${srcdir}/rocm-dbgapi_0.64.0.50100-36_amd64.deb"
	egz "${srcdir}/rocm-debug-agent_2.0.3.50100-36_amd64.deb"
	egz "${srcdir}/rocm-utils_5.1.0.50100-36_amd64.deb"
	egz "${srcdir}/rocprofiler-dev_1.0.0.50100-36_amd64.deb"
	egz "${srcdir}/roctracer-dev_1.0.0.50100-36_amd64.deb"
	egz "${srcdir}/rocm-dev_5.1.0.50100-36_amd64.deb"
	egz "${srcdir}/hsa-amd-aqlprofile_1.0.0.50100-36_amd64.deb"
	exz "${srcdir}/libdrm-amdgpu-amdgpu1_2.4.109.50100-1395274_amd64.deb"
	exz "${srcdir}/openmp-extras_13.51.0.50100-36_amd64.deb"
	exz "${srcdir}/rocm-gdb_11.2.50100-36_amd64.deb"
	exz "${srcdir}/opencl-legacy-amdgpu-pro-icd_22.10-1395274_amd64.deb"

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
	ln -s "/opt/rocm-5.1.0" "$pkgdir/opt/rocm"
	ln -s "/opt/rocm-5.1.0/hip/bin/.hipVersion" "$pkgdir/opt/rocm-5.1.0/bin/.hipVersion"

	mkdir -p "${pkgdir}/opt/amdgpu/share/libdrm"
	cd "${pkgdir}/opt/amdgpu/share/libdrm"
	ln -s /usr/share/libdrm/amdgpu.ids amdgpu.ids		

	mkdir -p ${pkgdir}/etc/OpenCL/vendors	
	echo libamdocl64.so > "${pkgdir}/etc/OpenCL/vendors/amdocl64.icd"
	echo libamdocl-orca64.so > "${pkgdir}/etc/OpenCL/vendors/amdocl-orca64.icd"

	mkdir -p ${pkgdir}/etc/ld.so.conf.d
	echo /opt/rocm-5.1.0/opencl/lib > "$pkgdir/etc/ld.so.conf.d/opencl-amd.conf"
	echo /opt/rocm-5.1.0/lib >> "$pkgdir/etc/ld.so.conf.d/opencl-amd.conf"
	echo /opt/rocm-5.1.0/hip/lib >> "$pkgdir/etc/ld.so.conf.d/opencl-amd.conf"

	mkdir -p ${pkgdir}/etc/profile.d
	echo export PATH="\${PATH}:/opt/rocm-5.1.0/bin:/opt/rocm-5.1.0/hip/bin" > "$pkgdir/etc/profile.d/opencl-amd.sh"
}
