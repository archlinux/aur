# Maintainer: Carson Rueter <roachh at proton mail dot com>
# Co-Maintainer: George Sofianos

# Release notes https://docs.amd.com/bundle/ROCm-Release-Notes-v5.1/page/About_This_Document.html
amdgpu_install='22.10.2.50102'
amdgpu_version='22.10.2'
rocm_version='50102'
amdgpu_build_id='1411481'
rocm_build_id='55'
amdgpu_repo='https://repo.radeon.com/amdgpu/22.10.2/ubuntu'
rocm_repo='https://repo.radeon.com/rocm/apt/5.1.2'
opencl_lib='opt/rocm-5.1.2/opencl/lib'
rocm_lib='opt/rocm-5.1.2/lib'
hip_lib='opt/rocm-5.1.2/hip/lib/'
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
"https://repo.radeon.com/amdgpu/22.10.2/ubuntu/pool/main/libd/libdrm-amdgpu/libdrm-amdgpu-amdgpu1_2.4.109.50102-1411481_amd64.deb"
# ROCM
"https://repo.radeon.com/rocm/apt/5.1.2/pool/main/r/rocm-core/rocm-core_5.1.2.50102-55_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1.2/pool/main/c/comgr/comgr_2.4.0.50102-55_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1.2/pool/main/h/hip-dev/hip-dev_5.1.20532.50102-55_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1.2/pool/main/h/hip-doc/hip-doc_5.1.20532.50102-55_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1.2/pool/main/h/hip-samples/hip-samples_5.1.20532.50102-55_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1.2/pool/main/h/hsakmt-roct-dev/hsakmt-roct-dev_20220128.1.7.50102-55_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1.2/pool/main/h/hsa-rocr/hsa-rocr_1.5.0.50102-55_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1.2/pool/main/h/hsa-rocr-dev/hsa-rocr-dev_1.5.0.50102-55_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1.2/pool/main/r/rocminfo/rocminfo_1.0.0.50102-55_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1.2/pool/main/h/hip-runtime-amd/hip-runtime-amd_5.1.20532.50102-55_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1.2/pool/main/r/rocm-device-libs/rocm-device-libs_1.0.0.50102-55_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1.2/pool/main/r/rocm-language-runtime/rocm-language-runtime_5.1.2.50102-55_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1.2/pool/main/r/rocm-hip-runtime/rocm-hip-runtime_5.1.2.50102-55_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1.2/pool/main/r/rocm-ocl-icd/rocm-ocl-icd_2.0.0.50102-55_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1.2/pool/main/r/rocm-opencl/rocm-opencl_2.0.0.50102-55_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1.2/pool/main/r/rocm-opencl-dev/rocm-opencl-dev_2.0.0.50102-55_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1.2/pool/main/r/rocm-opencl-runtime/rocm-opencl-runtime_5.1.2.50102-55_amd64.deb"
# ROCM DEV
"https://repo.radeon.com/rocm/apt/5.1.2/pool/main/r/rocm-clang-ocl/rocm-clang-ocl_0.5.0.50102-55_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1.2/pool/main/o/openmp-extras/openmp-extras_13.51.0.50102-55_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1.2/pool/main/r/rocm-smi-lib/rocm-smi-lib_5.0.0.50102-55_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1.2/pool/main/r/rocm-cmake/rocm-cmake_0.7.2.50102-55_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1.2/pool/main/r/rocm-dbgapi/rocm-dbgapi_0.64.0.50102-55_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1.2/pool/main/r/rocm-debug-agent/rocm-debug-agent_2.0.3.50102-55_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1.2/pool/main/r/rocm-gdb/rocm-gdb_11.2.50102-55_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1.2/pool/main/r/rocm-utils/rocm-utils_5.1.2.50102-55_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1.2/pool/main/r/rocprofiler-dev/rocprofiler-dev_1.0.0.50102-55_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1.2/pool/main/r/roctracer-dev/roctracer-dev_1.0.0.50102-55_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1.2/pool/main/r/rocm-dev/rocm-dev_5.1.2.50102-55_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1.2/pool/main/h/hsa-amd-aqlprofile/hsa-amd-aqlprofile_1.0.0.50102-55_amd64.deb"
# Proprietary
"https://repo.radeon.com/amdgpu/22.10.2/ubuntu/pool/proprietary/o/opencl-legacy-amdgpu-pro/opencl-legacy-amdgpu-pro-icd_22.10.2-1411481_amd64.deb"
#"https://repo.radeon.com/amdgpu/22.10.2/ubuntu/pool/proprietary/c/clinfo-amdgpu-pro/clinfo-amdgpu-pro_22.10-1411481_amd64.deb"
#"https://repo.radeon.com/amdgpu/22.10.2/ubuntu/pool/proprietary/o/ocl-icd-amdgpu-pro/ocl-icd-libopencl1-amdgpu-pro_22.10-1411481_amd64.deb"
#"https://repo.radeon.com/amdgpu/22.10.2/ubuntu/pool/proprietary/a/amf-amdgpu-pro/amf-amdgpu-pro_1.4.24-1411481_amd64.deb"
)

sha256sums=(
"6dfa3dd757532ed3a845a11a197037fbb6c5f612b0dfc8cd016d851be177aed0"

"69a1127504c0191d2b683f778f1c3cd732496a2371bf2d81b78591e67a44f4a7"
"d8e371482e8049ab8291bbc3874ce6a4e7140ba882412988e53bf87b0882089d"
"9ebd32fa87b89637f2d3a5ab4fa505e8d60fde5d79d98523b4c91b96a6313294"
"302fc6b8282011c8e3df9816e6102925e8a6d8e3ace9e89b6af0366352a86024"
"e27fdc0912941b3859b828613da2d3dac252a535adc59b7b8d2d1213b76945d7"
"5ffed50668b4a3179a244c7a4a4c17921a220c44febd690503140cba035beb4a"
"c69c9b7ae2404422f37300e0201a0e76542bf79ec2ff35d1b455bd8a7c60c854"
"4b6f1295f88fe7eb26e722a0b1fc8f9ea1204271bcf270b2dccf0f88b2366703"
"c430d84aec6cb2b7c2fd9798d8906d407aa39de2f21828019a81ffae621b67c4"
"994a159793f23029ef5457bb1d33218f81c5258e3ebad88bfec6da63dcd473ca"
"bb71ab3248dfbb6fea85e9bf80afdb82a6ebe1bf5cd3b74714df1644fec23a25"
"d378aff59d7385923b6611a3072338fe20f4ea4c59a52996801db1f1899043b3"
"39a29f05aadde6c6d6a52dfb0df8c29c81122ab521a15a9e2cdbd16e24aa1437"
"7e6f7d32c12dcde99e7218e2899af153f55227c020cf85e139835c194d96af87"
"46f35ce6baf9cdb29d59958a0e6abf2216d2bcea589e2ff90fc6a48127977d69"
"87ec01eedeb9ce2907a0d2693e611ca32b108c50f8c25ecc186f04d0e2c066af"
"786ba77f78564d6ce732eb289f430e977b3c4fbd05a5a50eea1edaed9d671110"

"4b4c5b8ac2b8412fee250139102640ee9586970a10795226f5714ee907237028"
"fefd19f721e45ef0d3fb108ad173267d7ce97efea98557f1c77601bec0af97eb"
"5cef2352e561de3b82860f11391f27b9176ed114ffae37fd67213ae9961d4a1e"
"f4bf90d9c908199fd98a649aba4c1fffec9156714962c15af51f3d9f5400fef1"
"fdd9008ade1f84058ff5c188eeadd3504ddc4fd21bff81978b90f6e9c870aafd"
"c36c423d0e8b09d9c45157cecd4d1fc8e1cac0dd64bbdc204988c02b433c6a3d"
"fd286340049aa3137ec12c69e4bf472fe46bdad2a3e348f2ecdca165ddc8a283"
"f88cd1eaaf6540022a18c8b695ff77c5641eaa44ae4468a0c44bf9d595895fa2"
"c91f5d26a9705fea8b214c090e184a40f26375428c6208c7ec37b3e5fa334463"
"022e7af63f9ce5e2fc99d151f8c573ba14b803265330367182335fe9e5900292"
"72482e762c9d8d59f61e4b8443d6d4814969f07ea27aceec296efec69f24d786"
"1064c75793a12e6b25b21c0d7b40493d084a82da1513c1e2b83bb209e89c0d4e"
"f3c8324413c14d7e5cc4e4294127f642f0514515c94104647590e2071aa57418"
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
	egz "${srcdir}/rocm-core_5.1.2.50102-55_amd64.deb"
	egz "${srcdir}/comgr_2.4.0.50102-55_amd64.deb"
	egz "${srcdir}/hip-dev_5.1.20532.50102-55_amd64.deb"
	egz "${srcdir}/hip-doc_5.1.20532.50102-55_amd64.deb"
	egz "${srcdir}/hip-samples_5.1.20532.50102-55_amd64.deb"
	egz "${srcdir}/hsakmt-roct-dev_20220128.1.7.50102-55_amd64.deb"
	egz "${srcdir}/hsa-rocr_1.5.0.50102-55_amd64.deb"
	egz "${srcdir}/hsa-rocr-dev_1.5.0.50102-55_amd64.deb"
	egz "${srcdir}/rocminfo_1.0.0.50102-55_amd64.deb"
	egz "${srcdir}/hip-runtime-amd_5.1.20532.50102-55_amd64.deb"
	egz "${srcdir}/rocm-device-libs_1.0.0.50102-55_amd64.deb"
	egz "${srcdir}/rocm-language-runtime_5.1.2.50102-55_amd64.deb"
	egz "${srcdir}/rocm-hip-runtime_5.1.2.50102-55_amd64.deb"
	egz "${srcdir}/rocm-ocl-icd_2.0.0.50102-55_amd64.deb"
	egz "${srcdir}/rocm-opencl_2.0.0.50102-55_amd64.deb"
	egz "${srcdir}/rocm-opencl-dev_2.0.0.50102-55_amd64.deb"
	egz "${srcdir}/rocm-opencl-runtime_5.1.2.50102-55_amd64.deb"
	egz "${srcdir}/rocm-clang-ocl_0.5.0.50102-55_amd64.deb"
	egz "${srcdir}/rocm-smi-lib_5.0.0.50102-55_amd64.deb"
	egz "${srcdir}/rocm-cmake_0.7.2.50102-55_amd64.deb"
	egz "${srcdir}/rocm-dbgapi_0.64.0.50102-55_amd64.deb"
	egz "${srcdir}/rocm-debug-agent_2.0.3.50102-55_amd64.deb"
	egz "${srcdir}/rocm-utils_5.1.2.50102-55_amd64.deb"
	egz "${srcdir}/rocprofiler-dev_1.0.0.50102-55_amd64.deb"
	egz "${srcdir}/roctracer-dev_1.0.0.50102-55_amd64.deb"
	egz "${srcdir}/rocm-dev_5.1.2.50102-55_amd64.deb"
	egz "${srcdir}/hsa-amd-aqlprofile_1.0.0.50102-55_amd64.deb"
	exz "${srcdir}/libdrm-amdgpu-amdgpu1_2.4.109.50102-1411481_amd64.deb"
	exz "${srcdir}/openmp-extras_13.51.0.50102-55_amd64.deb"
	exz "${srcdir}/rocm-gdb_11.2.50102-55_amd64.deb"
	exz "${srcdir}/opencl-legacy-amdgpu-pro-icd_22.10.2-1411481_amd64.deb"

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
	ln -s "/opt/rocm-5.1.2" "$pkgdir/opt/rocm"
	ln -s "/opt/rocm-5.1.2/hip/bin/.hipVersion" "$pkgdir/opt/rocm-5.1.2/bin/.hipVersion"

	mkdir -p "${pkgdir}/opt/amdgpu/share/libdrm"
	cd "${pkgdir}/opt/amdgpu/share/libdrm"
	ln -s /usr/share/libdrm/amdgpu.ids amdgpu.ids		

	mkdir -p ${pkgdir}/etc/OpenCL/vendors	
	echo libamdocl64.so > "${pkgdir}/etc/OpenCL/vendors/amdocl64.icd"
	echo libamdocl-orca64.so > "${pkgdir}/etc/OpenCL/vendors/amdocl-orca64.icd"

	mkdir -p ${pkgdir}/etc/ld.so.conf.d
	echo /opt/rocm-5.1.2/opencl/lib > "$pkgdir/etc/ld.so.conf.d/opencl-amd.conf"
	echo /opt/rocm-5.1.2/lib >> "$pkgdir/etc/ld.so.conf.d/opencl-amd.conf"
	echo /opt/rocm-5.1.2/hip/lib >> "$pkgdir/etc/ld.so.conf.d/opencl-amd.conf"

	mkdir -p ${pkgdir}/etc/profile.d
	echo export PATH="\${PATH}:/opt/rocm-5.1.2/bin:/opt/rocm-5.1.2/hip/bin" > "$pkgdir/etc/profile.d/opencl-amd.sh"
}
