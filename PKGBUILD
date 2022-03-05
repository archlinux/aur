# Maintainer: Carson Rueter <roachh at proton mail dot com>
# Co-Maintainer: George Sofianos

# Release notes https://rocmdocs.amd.com/en/latest/Current_Release_Notes/Current-Release-Notes.html#amd-rocm-v5-0-2-release-notes
major='21.50.2.50002'
minor='1384495'
rocm_major='50002'
rocm_minor='72'
amdgpu_repo='https://repo.radeon.com/amdgpu/21.50.2/ubuntu'
rocm_repo='https://repo.radeon.com/rocm/apt/5.0.2'
opencl_lib='opt/rocm-5.0.2/opencl/lib'
rocm_lib='opt/rocm-5.0.2/lib'
hip_lib='opt/rocm-5.0.2/hip/lib/'
amdgpu="opt/amdgpu/lib/x86_64-linux-gnu"
amdgpu_pro="opt/amdgpu-pro/lib/x86_64-linux-gnu/"

pkgname=opencl-amd
pkgdesc="ROCr based OpenCL for users of applications requiring OpenCL on Vega or later - This package is intended to work along with the free amdgpu stack."
pkgver=${major}.${minor}
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
"https://repo.radeon.com/amdgpu/21.50.2/ubuntu/pool/main/libd/libdrm-amdgpu/libdrm-amdgpu-amdgpu1_2.4.107.50002-1384495_amd64.deb"
# ROCM
"https://repo.radeon.com/rocm/apt/5.0.2/pool/main/r/rocm-core/rocm-core_5.0.2.50002-72_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.0.2/pool/main/c/comgr/comgr_2.4.0.50002-72_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.0.2/pool/main/h/hip-dev/hip-dev_5.0.13601.50002-72_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.0.2/pool/main/h/hip-doc/hip-doc_5.0.13601.50002-72_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.0.2/pool/main/h/hip-samples/hip-samples_5.0.13601.50002-72_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.0.2/pool/main/h/hsakmt-roct-dev/hsakmt-roct-dev_20211222.1.5.50002-72_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.0.2/pool/main/h/hsa-rocr/hsa-rocr_1.5.0.50002-72_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.0.2/pool/main/h/hsa-rocr-dev/hsa-rocr-dev_1.5.0.50002-72_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.0.2/pool/main/r/rocminfo/rocminfo_1.0.0.50002-72_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.0.2/pool/main/h/hip-runtime-amd/hip-runtime-amd_5.0.13601.50002-72_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.0.2/pool/main/r/rocm-device-libs/rocm-device-libs_1.0.0.50002-72_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.0.2/pool/main/r/rocm-language-runtime/rocm-language-runtime_5.0.2.50002-72_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.0.2/pool/main/r/rocm-hip-runtime/rocm-hip-runtime_5.0.2.50002-72_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.0.2/pool/main/r/rocm-ocl-icd/rocm-ocl-icd_2.0.0.50002-72_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.0.2/pool/main/r/rocm-opencl/rocm-opencl_2.0.0.50002-72_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.0.2/pool/main/r/rocm-opencl-dev/rocm-opencl-dev_2.0.0.50002-72_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.0.2/pool/main/r/rocm-opencl-runtime/rocm-opencl-runtime_5.0.2.50002-72_amd64.deb"
# ROCM DEV
"https://repo.radeon.com/rocm/apt/5.0.2/pool/main/r/rocm-clang-ocl/rocm-clang-ocl_0.5.0.50002-72_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.0.2/pool/main/o/openmp-extras/openmp-extras_13.50.0.50002-72_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.0.2/pool/main/r/rocm-smi-lib/rocm-smi-lib_5.0.0.50002-72_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.0.2/pool/main/r/rocm-cmake/rocm-cmake_0.6.1.50002-72_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.0.2/pool/main/r/rocm-dbgapi/rocm-dbgapi_0.62.1.50002-72_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.0.2/pool/main/r/rocm-debug-agent/rocm-debug-agent_2.0.1.50002-72_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.0.2/pool/main/r/rocm-gdb/rocm-gdb_11.1.50002-72_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.0.2/pool/main/r/rocm-utils/rocm-utils_5.0.2.50002-72_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.0.2/pool/main/r/rocprofiler-dev/rocprofiler-dev_1.0.0.50002-72_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.0.2/pool/main/r/roctracer-dev/roctracer-dev_1.0.0.50002-72_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.0.2/pool/main/r/rocm-dev/rocm-dev_5.0.2.50002-72_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.0.2/pool/main/h/hsa-amd-aqlprofile/hsa-amd-aqlprofile_1.0.0.50002-72_amd64.deb"
# Proprietary
"https://repo.radeon.com/amdgpu/21.50.2/ubuntu/pool/proprietary/o/opencl-legacy-amdgpu-pro/opencl-legacy-amdgpu-pro-icd_21.50.2-1384495_amd64.deb"
#"https://repo.radeon.com/amdgpu/21.50.2/ubuntu/pool/proprietary/c/clinfo-amdgpu-pro/clinfo-amdgpu-pro_21.50.2-1384495_amd64.deb"
#"https://repo.radeon.com/amdgpu/21.50.2/ubuntu/pool/proprietary/o/ocl-icd-amdgpu-pro/ocl-icd-libopencl1-amdgpu-pro_21.50.2-1384495_amd64.deb"
#"https://repo.radeon.com/amdgpu/21.50.2/ubuntu/pool/proprietary/a/amf-amdgpu-pro/amf-amdgpu-pro_1.4.24-1384495_amd64.deb"
)

sha256sums=(
"51a6ecd04544b8809f5abe11ff35bf7a5d19efb04ecdd02c1d1676a3e7363007"

"c5adb041cc386647dc7277f1aa98b2f45ba30e72629ff75f8f54a0b44b5ac522"
"cb3a4c7898ac11d3e4f0f05b169c83d257213ed9eb5ef375a8631cd5f997d4d5"
"0deeb326b18b1f2d14abfd9cfe56e185ed9bbb8655489828d8a9e339779bfc5c"
"13129e82e5a4bc34643d16301b3d4c9f25c28e264ea21e21e96419a9f968e79d"
"39656ce3a34c1f97fa08b7a6ac0e6eb2443328f201feae83b2c154fe084b029e"
"8ba1edab5da90140ef588383c6453eefd0a97db3764f57d4cd82e3f782b5b157"
"a36618a24075a65f279d384d539202944877b8fb5aa24fe0ed3c1ca322a17632"
"9d2223c67fe5bcd9f47e3616c0e850d67a588e43ed06600660c4cdf6e7afac2b"
"89292b3e8e9cdb0dda76d55e0a5c26d4246f643e2971e004103e1bbeff081688"
"02f80f0f970c1e7da1492353f587177ddcfdf51f427aefcfcc9923e3c55a1be5"
"e68963bdb4c0321046b7187d412abbce6c1876373ad2a04227b993a51e4c508c"
"dae3766f8103caedf52124680d9a67327402d75beef9736ef4e15b28a70b84af"
"63616a300406f74a6c067d03e29a1aa1c09b781e2d2b952acf1650cf6c3bf725"
"97d9a6d0d3f9a5739865019a8bc26564fadf24b2b7323419b41b597f9bfe1c15"
"3ae856fc35df13c5fca52872cc444a8ec6609f30f75e57bc2e5759949785ccdd"
"c2431fecf9a817d06f8e0cee8c5ac3818afa0c0738270cf7b62bff31ed88a98b"
"4e6fffac5621d70d6b4898b34160ca256f0176dea92f40139346a5a315a988db"

"9f179a2337c7435159130c58dbb6fb452e26f53893fd6a4b238b3ac1de07fcd8"
"f02482d55047d9c836885d0231b3ccfb9f0cf4f5d0b1ee6b1a3a09080222344f"
"c39ad6901e35554e0282196deaf227d540ef56c2db658c7001f69325101a44f6"
"2111a963c3fd2e7317bc77eff78a4434e397d78c80c7f48a36712ecc25513499"
"57b50683fb1c47697db132c4fb5cc73c68481ad6ed469e327bed88edf296273f"
"0c7dc71b2117f32381a285d8ce38ab22f2d0169a91eafe9e8a929eeede5d6723"
"6ddbf8c5864c1ca28876a8068b34a3b02ab43af2871fdf1049059421c1f1509b"
"82a92bceaf66d734e4ab493decfb4cad2bc3e5b20366ff9a369e264d5d006135"
"afaa1a04be47767e2b762ec4072b800e4eff3417cd8c1e13b8d2b68294f1566f"
"bde4fd1fc8483c15f17747762d868d688484c6d0b64e638301da551f50837211"
"a882b29bc23d07e9a88f044370bc4e8e9b1467af7de639da993a6d0edba7646a"
"77ad6de24ac675ed5925d8380ca2e55ac04291bbf1ca3ee6857e761db3eea6e4"
"beb8d0d6e9953abf15f6b873c1ee09a5230b0d0282602b08dc1a2cff5924079d"
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
	egz "${srcdir}/rocm-core_5.0.2.50002-72_amd64.deb"
	egz "${srcdir}/comgr_2.4.0.50002-72_amd64.deb"
	egz "${srcdir}/hip-dev_5.0.13601.50002-72_amd64.deb"
	egz "${srcdir}/hip-doc_5.0.13601.50002-72_amd64.deb"
	egz "${srcdir}/hip-samples_5.0.13601.50002-72_amd64.deb"
	egz "${srcdir}/hsakmt-roct-dev_20211222.1.5.50002-72_amd64.deb"
	egz "${srcdir}/hsa-rocr_1.5.0.50002-72_amd64.deb"
	egz "${srcdir}/hsa-rocr-dev_1.5.0.50002-72_amd64.deb"
	egz "${srcdir}/rocminfo_1.0.0.50002-72_amd64.deb"
	egz "${srcdir}/hip-runtime-amd_5.0.13601.50002-72_amd64.deb"
	egz "${srcdir}/rocm-device-libs_1.0.0.50002-72_amd64.deb"
	egz "${srcdir}/rocm-language-runtime_5.0.2.50002-72_amd64.deb"
	egz "${srcdir}/rocm-hip-runtime_5.0.2.50002-72_amd64.deb"
	egz "${srcdir}/rocm-ocl-icd_2.0.0.50002-72_amd64.deb"
	egz "${srcdir}/rocm-opencl_2.0.0.50002-72_amd64.deb"
	egz "${srcdir}/rocm-opencl-dev_2.0.0.50002-72_amd64.deb"
	egz "${srcdir}/rocm-opencl-runtime_5.0.2.50002-72_amd64.deb"
	egz "${srcdir}/rocm-clang-ocl_0.5.0.50002-72_amd64.deb"
	egz "${srcdir}/rocm-smi-lib_5.0.0.50002-72_amd64.deb"
	egz "${srcdir}/rocm-cmake_0.6.1.50002-72_amd64.deb"
	egz "${srcdir}/rocm-dbgapi_0.62.1.50002-72_amd64.deb"
	egz "${srcdir}/rocm-debug-agent_2.0.1.50002-72_amd64.deb"
	egz "${srcdir}/rocm-utils_5.0.2.50002-72_amd64.deb"
	egz "${srcdir}/rocprofiler-dev_1.0.0.50002-72_amd64.deb"
	egz "${srcdir}/roctracer-dev_1.0.0.50002-72_amd64.deb"
	egz "${srcdir}/rocm-dev_5.0.2.50002-72_amd64.deb"
	egz "${srcdir}/hsa-amd-aqlprofile_1.0.0.50002-72_amd64.deb"
	exz "${srcdir}/libdrm-amdgpu-amdgpu1_2.4.107.50002-1384495_amd64.deb"
	exz "${srcdir}/openmp-extras_13.50.0.50002-72_amd64.deb"
	exz "${srcdir}/rocm-gdb_11.1.50002-72_amd64.deb"
	exz "${srcdir}/opencl-legacy-amdgpu-pro-icd_21.50.2-1384495_amd64.deb"

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
	ln -s "/opt/rocm-5.0.2" "$pkgdir/opt/rocm"
	ln -s "/opt/rocm-5.0.2/hip/bin/.hipVersion" "$pkgdir/opt/rocm-5.0.2/bin/.hipVersion"

	mkdir -p "${pkgdir}/opt/amdgpu/share/libdrm"
	cd "${pkgdir}/opt/amdgpu/share/libdrm"
	ln -s /usr/share/libdrm/amdgpu.ids amdgpu.ids		

	mkdir -p ${pkgdir}/etc/OpenCL/vendors	
	echo libamdocl64.so > "${pkgdir}/etc/OpenCL/vendors/amdocl64.icd"
	echo libamdocl-orca64.so > "${pkgdir}/etc/OpenCL/vendors/amdocl-orca64.icd"

	mkdir -p ${pkgdir}/etc/ld.so.conf.d
	echo /opt/rocm-5.0.2/opencl/lib > "$pkgdir/etc/ld.so.conf.d/opencl-amd.conf"
	echo /opt/rocm-5.0.2/lib >> "$pkgdir/etc/ld.so.conf.d/opencl-amd.conf"
	echo /opt/rocm-5.0.2/hip/lib >> "$pkgdir/etc/ld.so.conf.d/opencl-amd.conf"

	mkdir -p ${pkgdir}/etc/profile.d
	echo export PATH="\${PATH}:/opt/rocm-5.0.2/bin:/opt/rocm-5.0.2/hip/bin" > "$pkgdir/etc/profile.d/opencl-amd.sh"
}
