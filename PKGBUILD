# Maintainer: Carson Rueter <roachh at proton mail dot com>
# Co-Maintainer: George Sofianos

# Release notes https://rocmdocs.amd.com/en/latest/Current_Release_Notes/Current-Release-Notes.html
major='21.40.2'
minor='1350682'
rocm_major='40502'
rocm_minor='164'
amdgpu_repo='https://repo.radeon.com/amdgpu/21.40.2/ubuntu'
rocm_repo='https://repo.radeon.com/rocm/apt/4.5.2'
opencl_lib='opt/rocm-4.5.2/opencl/lib'
rocm_lib='opt/rocm-4.5.2/lib'
hip_lib='opt/rocm-4.5.2/hip/lib/'
amdgpu="opt/amdgpu/lib/x86_64-linux-gnu"
amdgpu_pro="opt/amdgpu-pro/lib/x86_64-linux-gnu/"

pkgname=opencl-amd
pkgdesc="OpenCL userspace driver as provided in the amdgpu-pro driver stack. This package is intended to work along with the free amdgpu stack."
pkgver=${major}.${minor}
pkgrel=3
arch=('x86_64')
url='http://www.amd.com'
license=('custom:AMD')
makedepends=('wget')
depends=('libdrm' 'ocl-icd' 'gcc-libs' 'numactl')
conflicts=('rocm-opencl-runtime')
provides=('opencl-driver')
optdepends=('clinfo' 'opencl-amd-dev' 'opencl-amd-ncurses5' 'ncurses5-compat-libs')

source=(
"https://repo.radeon.com/rocm/apt/4.5.2/pool/main/r/rocm-core/rocm-core_4.5.2.40502-164_amd64.deb"
"https://repo.radeon.com/rocm/apt/4.5.2/pool/main/c/comgr/comgr_2.1.0.40502-164_amd64.deb"
"https://repo.radeon.com/rocm/apt/4.5.2/pool/main/h/hip-dev/hip-dev_4.4.21432.40502-164_amd64.deb"
"https://repo.radeon.com/rocm/apt/4.5.2/pool/main/h/hip-doc/hip-doc_4.4.21432.40502-164_amd64.deb"
"https://repo.radeon.com/rocm/apt/4.5.2/pool/main/h/hsakmt-roct-dev/hsakmt-roct-dev_20210902.12.3277.40502-164_amd64.deb"
"https://repo.radeon.com/rocm/apt/4.5.2/pool/main/h/hsa-rocr/hsa-rocr_1.4.0.40502-164_amd64.deb"
"https://repo.radeon.com/rocm/apt/4.5.2/pool/main/h/hsa-rocr-dev/hsa-rocr-dev_1.4.0.40502-164_amd64.deb"
"https://repo.radeon.com/rocm/apt/4.5.2/pool/main/r/rocminfo/rocminfo_1.0.0.40502-164_amd64.deb"

"https://repo.radeon.com/rocm/apt/4.5.2/pool/main/h/hip-runtime-amd/hip-runtime-amd_4.4.21432.40502-164_amd64.deb"
"https://repo.radeon.com/rocm/apt/4.5.2/pool/main/h/hip-samples/hip-samples_4.4.21432.40502-164_amd64.deb"
"https://repo.radeon.com/rocm/apt/4.5.2/pool/main/h/hsa-amd-aqlprofile/hsa-amd-aqlprofile_1.0.0.40502-164_amd64.deb"
"https://repo.radeon.com/amdgpu/21.40.2/ubuntu/pool/main/libd/libdrm-amdgpu/libdrm-amdgpu-amdgpu1_2.4.107.40502-1350682_amd64.deb"
"https://repo.radeon.com/rocm/apt/4.5.2/pool/main/r/rocm-device-libs/rocm-device-libs_1.0.0.40502-164_amd64.deb"
"https://repo.radeon.com/rocm/apt/4.5.2/pool/main/o/openmp-extras/openmp-extras_13.45.0.40502-164_amd64.deb"
"https://repo.radeon.com/rocm/apt/4.5.2/pool/main/r/rocm-opencl/rocm-opencl_2.0.0.40502-164_amd64.deb"
"https://repo.radeon.com/rocm/apt/4.5.2/pool/main/r/rocm-opencl-dev/rocm-opencl-dev_2.0.0.40502-164_amd64.deb"
"https://repo.radeon.com/rocm/apt/4.5.2/pool/main/r/rocm-clang-ocl/rocm-clang-ocl_0.5.0.40502-164_amd64.deb"
"https://repo.radeon.com/rocm/apt/4.5.2/pool/main/r/rocm-cmake/rocm-cmake_0.6.0.40502-164_amd64.deb"
"https://repo.radeon.com/rocm/apt/4.5.2/pool/main/r/rocm-dbgapi/rocm-dbgapi_0.56.0.40502-164_amd64.deb"
"https://repo.radeon.com/rocm/apt/4.5.2/pool/main/r/rocm-debug-agent/rocm-debug-agent_2.0.1.40502-164_amd64.deb"
"https://repo.radeon.com/rocm/apt/4.5.2/pool/main/r/rocm-gdb/rocm-gdb_11.1.40502-164_amd64.deb"
"https://repo.radeon.com/rocm/apt/4.5.2/pool/main/r/rocm-smi-lib/rocm-smi-lib_4.0.0.40502-164_amd64.deb"
"https://repo.radeon.com/rocm/apt/4.5.2/pool/main/r/rocm-utils/rocm-utils_4.5.2.40502-164_amd64.deb"
"https://repo.radeon.com/rocm/apt/4.5.2/pool/main/r/rocprofiler-dev/rocprofiler-dev_1.0.0.40502-164_amd64.deb"
"https://repo.radeon.com/rocm/apt/4.5.2/pool/main/r/roctracer-dev/roctracer-dev_1.0.0.40502-164_amd64.deb"
"https://repo.radeon.com/rocm/apt/4.5.2/pool/main/r/rocm-dev/rocm-dev_4.5.2.40502-164_amd64.deb"
"https://repo.radeon.com/rocm/apt/4.5.2/pool/main/r/rocm-language-runtime/rocm-language-runtime_4.5.2.40502-164_amd64.deb"
"https://repo.radeon.com/rocm/apt/4.5.2/pool/main/r/rocm-hip-runtime/rocm-hip-runtime_4.5.2.40502-164_amd64.deb"
"https://repo.radeon.com/rocm/apt/4.5.2/pool/main/r/rocm-opencl-runtime/rocm-opencl-runtime_4.5.2.40502-164_amd64.deb"
"https://repo.radeon.com/amdgpu/21.40.2/ubuntu/pool/proprietary/o/opencl-legacy-amdgpu-pro/opencl-legacy-amdgpu-pro-icd_21.40.2-1350682_amd64.deb"
#"https://repo.radeon.com/amdgpu/21.40.2/ubuntu/pool/proprietary/c/clinfo-amdgpu-pro/clinfo-amdgpu-pro_21.40.2-1350682_amd64.deb"
#"https://repo.radeon.com/amdgpu/21.40.2/ubuntu/pool/proprietary/o/ocl-icd-amdgpu-pro/ocl-icd-libopencl1-amdgpu-pro_21.40.2-1350682_amd64.deb"
#"https://repo.radeon.com/amdgpu/21.40.2/ubuntu/pool/proprietary/a/amf-amdgpu-pro/amf-amdgpu-pro_1.4.23-1350682_amd64.deb"
)

sha256sums=(
"37ebac02ab6d27f93f7770a152e8258e34250788ba50df9fac7b954ef51ae4c1"
'78fcfbfd1ece7e71a5c23f2fd6b48c117468fa86fe1b7ee5425fd1de788e9dd3'
"bc0c26fed977a41ca55d5a69fe71aa709206b66e9d68cece4df9b8c17b3fd60c"
"a1efd85f504e5198ea65bd45563da4e50f35ec0d4bfb72f70722122ccec91422"
'c24b1816144d227c3d6252e925a73c39645fb64fe1f08100608bfcd5ba86dc8d'
'3a9c92bb3a286fbabdaf6104f1ca3bd01ebc818b7efbbf2c7bc2fda3dff0ef30'
"5204cdba0a50367d319724f9d32c969aa40d9dcaa33d9a083431533054617afc"
"1c329ae34fdcdc887b1fc1bf6bcf87065deca86288339d4340508c9e7b6d0ed5"

'e288edcb472b46453ddbcf3615be5c553f8aea2a81bfc79f2517e16cb86f2226'
"03525483301535c9640b4f8a31597744a7402ed740d1b5055193159e8544bfbd"
"a709023fb4f73756340ef27d74185dfb72ec640ad4b2b69b8f39b09fe1fb5db6"
'7fa1eb5ee2b8f9b50fd9aac29330c6f741d313d1d95d3218e80b5236e24bc508'
"90d5baf98306ec9d860e653129a16eb3d72ceff0e46a4f23f9b384175ca9af9d"
"9f32534fdc586c82c596420024c0d435967a004974f60a24beae4e69a51d91e7"
'82b86940d8a93ba91430c48dbfa057ec28db94fcbbc12d1fe58bf11950163d4d'
"9422c149707696a205cbf8ee5a8a2ef97af849cf0c42b36e9427b441b6cbe204"
"ea099f4101de2b3323ba102a39c40355e3ccb8455371569efdd04db91bdadddb"
"b7dd2ff40f67057887c7687cf909f773dc831c803bafa039f4d1fb4c3d86dd10"
"fb3e914326ca2b7e6720ecde90e9e3c46df4d2980ae475b1d4aea2058f50747e"
"5f5da4feedc7b5fa46b9f36f6e681f65729efb705322278a6f1f95f68cf8efe7"
"525b2d8149f97041357016215547502e76bc6e7c253d0d3570058f2fb8761361"
"4e3bc61560aec96d17fcda0ba556f18cf9fae8fdcf6d634a0db66de29df63fe1"
"a6d39213ff9dd99561d5077a3953ee3c1813d209bdf9b1a811cf2612e8894914"
"2075bca8d8a0bddf0df3b8693fe6fe541120864088249dfe43acad353f9d1f2e"
"a7d5638e3d8ba370700594443455990244535d47db21204c427fdfa3edb66470"
"663a256ad0a842469c49db224cfd41393c80b3063960385195464544ac33504e"
"e790e05be47c0e61ce335e731a80adf6658a7f5261349c0fde80b75ac8841dcd"
"1dea44e8ac402fcf81e9465e87c1bc842ad3def1641added1ba7f3be97e77ffc"
"24e81b9080a5c39da422d345a8df3fd2df7bbeb819be61d967c93113b307ede1"
'e3df0cc14bcc7ab529694cd0d61258b9fb6cad93319d7a12dbd8b6d87fd94c02'
#'505a1a8da73869dd1f04a18fce3fe3297b43eb22ca5d71148a3e502d28d7f8e9'
#'f58d4d0a43e02c5a0043845b7ad2659f728d61541ec45aae8fb0989150480d9e'
#'0a9e65112e5dbf4a6b7b81d7078381a931657bb803f66ce005ebd4946e423f7f'
)

#Extract .xz files
exz() {
	ar x $1
	tar xJf data.tar.xz
}
#Extract .gz files
egz() {
	ar x $1
	tar xfx data.tar.gz
}

package() {
	egz "${srcdir}/rocm-core_4.5.2.40502-164_amd64.deb"
	egz "${srcdir}/comgr_2.1.0.40502-164_amd64.deb"
	egz "${srcdir}/hip-dev_4.4.21432.40502-164_amd64.deb"
	egz "${srcdir}/hip-doc_4.4.21432.40502-164_amd64.deb"
	egz "${srcdir}/hsakmt-roct-dev_20210902.12.3277.40502-164_amd64.deb"
	egz "${srcdir}/hsa-rocr_1.4.0.40502-164_amd64.deb"
	egz "${srcdir}/hsa-rocr-dev_1.4.0.40502-164_amd64.deb"
	egz "${srcdir}/rocminfo_1.0.0.40502-164_amd64.deb"
	egz "${srcdir}/hip-runtime-amd_4.4.21432.40502-164_amd64.deb"
	egz "${srcdir}/hip-samples_4.4.21432.40502-164_amd64.deb"
	egz "${srcdir}/hsa-amd-aqlprofile_1.0.0.40502-164_amd64.deb"
	egz "${srcdir}/rocm-device-libs_1.0.0.40502-164_amd64.deb"
	egz "${srcdir}/rocm-opencl_2.0.0.40502-164_amd64.deb"
	egz "${srcdir}/rocm-opencl-dev_2.0.0.40502-164_amd64.deb"
	egz "${srcdir}/rocm-clang-ocl_0.5.0.40502-164_amd64.deb"
	egz "${srcdir}/rocm-cmake_0.6.0.40502-164_amd64.deb"
	egz "${srcdir}/rocm-dbgapi_0.56.0.40502-164_amd64.deb"
	egz "${srcdir}/rocm-debug-agent_2.0.1.40502-164_amd64.deb"
	egz "${srcdir}/rocm-smi-lib_4.0.0.40502-164_amd64.deb"
	egz "${srcdir}/rocm-utils_4.5.2.40502-164_amd64.deb"
	egz "${srcdir}/rocprofiler-dev_1.0.0.40502-164_amd64.deb"
	egz "${srcdir}/roctracer-dev_1.0.0.40502-164_amd64.deb"
	egz "${srcdir}/rocm-dev_4.5.2.40502-164_amd64.deb"
	egz "${srcdir}/rocm-language-runtime_4.5.2.40502-164_amd64.deb"
	egz "${srcdir}/rocm-hip-runtime_4.5.2.40502-164_amd64.deb"
	egz "${srcdir}/rocm-opencl-runtime_4.5.2.40502-164_amd64.deb"
	exz "${srcdir}/libdrm-amdgpu-amdgpu1_2.4.107.40502-1350682_amd64.deb"	
	exz "${srcdir}/openmp-extras_13.45.0.40502-164_amd64.deb"	
	exz "${srcdir}/rocm-gdb_11.1.40502-164_amd64.deb"	
	exz "${srcdir}/opencl-legacy-amdgpu-pro-icd_21.40.2-1350682_amd64.deb"

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
	ln -s "/opt/rocm-4.5.2" "$pkgdir/opt/rocm"
	ln -s "/opt/rocm-4.5.2/hip/bin/.hipVersion" "$pkgdir/opt/rocm-4.5.2/bin/.hipVersion"	

	mkdir -p "${pkgdir}/opt/amdgpu/share/libdrm"
	cd "${pkgdir}/opt/amdgpu/share/libdrm"
	ln -s /usr/share/libdrm/amdgpu.ids amdgpu.ids		

	mkdir -p ${pkgdir}/etc/OpenCL/vendors	
	echo libamdocl64.so > "${pkgdir}/etc/OpenCL/vendors/amdocl64.icd"
	echo libamdocl-orca64.so > "${pkgdir}/etc/OpenCL/vendors/amdocl-orca64.icd"

	mkdir -p ${pkgdir}/etc/ld.so.conf.d
	echo /opt/rocm-4.5.2/opencl/lib > "$pkgdir/etc/ld.so.conf.d/opencl-amd.conf"
	echo /opt/rocm-4.5.2/lib >> "$pkgdir/etc/ld.so.conf.d/opencl-amd.conf"
}
