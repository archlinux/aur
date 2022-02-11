# Maintainer: Carson Rueter <roachh at proton mail dot com>
# Co-Maintainer: George Sofianos

# Release notes https://docs.amd.com/bundle/ROCm_Release_Notes_v5.0/page/ROCm_Installation_Updates.html
major='21.50.50000'
minor='1376259'
rocm_major='50000'
rocm_minor='49'
amdgpu_repo='https://repo.radeon.com/amdgpu/21.50/ubuntu'
rocm_repo='https://repo.radeon.com/rocm/apt/5.0'
opencl_lib='opt/rocm-5.0/opencl/lib'
rocm_lib='opt/rocm-5.0/lib'
hip_lib='opt/rocm-5.0/hip/lib/'
amdgpu="opt/amdgpu/lib/x86_64-linux-gnu"
amdgpu_pro="opt/amdgpu-pro/lib/x86_64-linux-gnu/"

pkgname=opencl-amd
pkgdesc="ROCr based OpenCL for users of applications requiring OpenCL on Vega or later - This package is intended to work along with the free amdgpu stack."
pkgver=${major}.${minor}
pkgrel=3
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
"https://repo.radeon.com/amdgpu/21.50/ubuntu/pool/main/libd/libdrm-amdgpu/libdrm-amdgpu-amdgpu1_2.4.107.50000-1373477_amd64.deb"
# ROCM
"https://repo.radeon.com/rocm/apt/5.0/pool/main/r/rocm-core/rocm-core_5.0.0.50000-49_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.0/pool/main/c/comgr/comgr_2.4.0.50000-49_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.0/pool/main/h/hip-dev/hip-dev_5.0.13601.50000-49_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.0/pool/main/h/hip-doc/hip-doc_5.0.13601.50000-49_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.0/pool/main/h/hip-samples/hip-samples_5.0.13601.50000-49_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.0/pool/main/h/hsakmt-roct-dev/hsakmt-roct-dev_20211222.1.5.50000-49_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.0/pool/main/h/hsa-rocr/hsa-rocr_1.5.0.50000-49_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.0/pool/main/h/hsa-rocr-dev/hsa-rocr-dev_1.5.0.50000-49_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.0/pool/main/r/rocminfo/rocminfo_1.0.0.50000-49_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.0/pool/main/h/hip-runtime-amd/hip-runtime-amd_5.0.13601.50000-49_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.0/pool/main/r/rocm-device-libs/rocm-device-libs_1.0.0.50000-49_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.0/pool/main/r/rocm-language-runtime/rocm-language-runtime_5.0.0.50000-49_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.0/pool/main/r/rocm-hip-runtime/rocm-hip-runtime_5.0.0.50000-49_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.0/pool/main/r/rocm-ocl-icd/rocm-ocl-icd_2.0.0.50000-49_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.0/pool/main/r/rocm-opencl/rocm-opencl_2.0.0.50000-49_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.0/pool/main/r/rocm-opencl-dev/rocm-opencl-dev_2.0.0.50000-49_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.0/pool/main/r/rocm-opencl-runtime/rocm-opencl-runtime_5.0.0.50000-49_amd64.deb"
# ROCM DEV
"https://repo.radeon.com/rocm/apt/5.0/pool/main/r/rocm-clang-ocl/rocm-clang-ocl_0.5.0.50000-49_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.0/pool/main/o/openmp-extras/openmp-extras_13.50.0.50000-49_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.0/pool/main/r/rocm-smi-lib/rocm-smi-lib_5.0.0.50000-49_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.0/pool/main/r/rocm-cmake/rocm-cmake_0.6.1.50000-49_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.0/pool/main/r/rocm-dbgapi/rocm-dbgapi_0.62.1.50000-49_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.0/pool/main/r/rocm-debug-agent/rocm-debug-agent_2.0.1.50000-49_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.0/pool/main/r/rocm-gdb/rocm-gdb_11.1.50000-49_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.0/pool/main/r/rocm-utils/rocm-utils_5.0.0.50000-49_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.0/pool/main/r/rocprofiler-dev/rocprofiler-dev_1.0.0.50000-49_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.0/pool/main/r/roctracer-dev/roctracer-dev_1.0.0.50000-49_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.0/pool/main/r/rocm-dev/rocm-dev_5.0.0.50000-49_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.0/pool/main/h/hsa-amd-aqlprofile/hsa-amd-aqlprofile_1.0.0.50000-49_amd64.deb"
# Proprietary
"https://repo.radeon.com/amdgpu/21.50/ubuntu/pool/proprietary/o/opencl-legacy-amdgpu-pro/opencl-legacy-amdgpu-pro-icd_21.50-1373477_amd64.deb"
#"https://repo.radeon.com/amdgpu/21.50/ubuntu/pool/proprietary/c/clinfo-amdgpu-pro/clinfo-amdgpu-pro_21.40.2-1350682_amd64.deb"
#"https://repo.radeon.com/amdgpu/21.50/ubuntu/pool/proprietary/o/ocl-icd-amdgpu-pro/ocl-icd-libopencl1-amdgpu-pro_21.40.2-1350682_amd64.deb"
#"https://repo.radeon.com/amdgpu/21.50/ubuntu/pool/proprietary/a/amf-amdgpu-pro/amf-amdgpu-pro_1.4.23-1350682_amd64.deb"
)

sha256sums=(
"0dfb1ad41474ba3a2f32f711b22d4dd4f272bd674c3b3e1260df1a673703a047"

"f09b9391137a11759f59b4135731f9f0d468fd5ac4e0990608bffdd1d7cc2226"
"03905a507d7bab5eddb6b8dd4710693de269a6bcc7bd841f4dec930a204dfe45"
"2ffbd88a5f88d2e15fe69b75616f2f9babe8d953085fe5cc0fa8fbea1867f29e"
"b0540f4cd2440526f3c768eeb487b843fc18951aed69faf2d4c416685b0a88fc"
"b1e3e12146a4dd71e49ec2388013157c6c17636aeba0b332d3520cf792c5ee3f"
"c684dda6df95245caffa499f4865b0dafbdc84533ff39fee90b4a1f518835e18"
"5587abd001e668fd62343c18d49c3d756a83ba0ced3bd3b3e12ce06603f1869a"
"a85373ea40910237092cdfcc3fe9a800b567b9acd669a91b55819b2a945ff82b"
"ff0d3ba4782b41db23f11b449c1028a2fa6985b1005f1e3b1ec33a82fc9a35f2"
"be556ec67bbfe0ac0a073fae4c47755d98ac8631c4ab614821a69abfa4cf89fb"
"c51c93b63fe7afbeb3cfc3f9e1e06a78790a53c55906f79dad2a4186d0d1f485"
"ceed53929c8fb8930324218b7d3a14af9bc705cd94348684b4e06aa9decb9ded"
"953cb10bdb00f281641be2487df4a1c2509e2caf4bb7085c8d0afc88cc113d26"
"da341feaacbf047947ab87199e925ada224d8f378a958303a78c1a7775785679"
"688cf5f8500ef98ce697d437007bf0f83380c1b6eb240b158b93deca5219a200"
"5cdeb3c8c537c0392dab84ccd4a09c8d1eeba976924ca737726ad9c3f59b117d"
"f80bad7599ff0c26f9077fc81724d2ee3785b9b19b2d66f75eba27d3cbc956f6"

"151a50a7b8ff3a5fe5f8da64bfdd5ad10d0b4d7fb97190a6ff4f980078b4ddc2"
"e9fcf1e3a4273063fdf7e37182bb3a7111f3f5daf5ed871984d95d729451b341"
"0c1376323bb7cef34e77b6bef7b22c3f811d9be978563e1df0f3c6d36803c59f"
"2f420277b1fa02c3bda0c8556b1fb64f26f931b7e3e7a9eb4d7ba733cd239a8a"
"4fa94de940e9993e53b61f3cd1e68770fe4d9abf43e96e7c838512bc71b0232f"
"73ef493ecad15ff349e21228e62efeb0a9802af686ac37560cc621eb01de5d2e"
"32bfb3c1a8adce9d9e6260d0ec1c0230bfd8b5756778be7526da8b24c822c85c"
"67814fb94dfe1fcaece5a4b17adefd453d1647a6567186432415a2cae4a8582b"
"57f0cd6533bc16029eab668a96b557bc22f578e7bac9ded2935b1c46f04e684d"
"0002daa341530a0af2c621cc3f906f3aa549a990c53da34aa5cc2d27a60fb170"
"6bc80b20f7fc998cb7bb26d03063e25b9bc307af3213333e2d08e75e9bb4b932"
"9f3fa9a2bc3d40117370bef2b416d2c8d87bd040f70980e66973340bc86706df"
"912e23664895382d8268ce320a8f3493c8f8ad2165aaba8cd7a20c19b72c218f"
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
	egz "${srcdir}/rocm-core_5.0.0.50000-49_amd64.deb"
	egz "${srcdir}/comgr_2.4.0.50000-49_amd64.deb"
	egz "${srcdir}/hip-dev_5.0.13601.50000-49_amd64.deb"
	egz "${srcdir}/hip-doc_5.0.13601.50000-49_amd64.deb"
	egz "${srcdir}/hip-samples_5.0.13601.50000-49_amd64.deb"
	egz "${srcdir}/hsakmt-roct-dev_20211222.1.5.50000-49_amd64.deb"
	egz "${srcdir}/hsa-rocr_1.5.0.50000-49_amd64.deb"
	egz "${srcdir}/hsa-rocr-dev_1.5.0.50000-49_amd64.deb"
	egz "${srcdir}/rocminfo_1.0.0.50000-49_amd64.deb"
	egz "${srcdir}/hip-runtime-amd_5.0.13601.50000-49_amd64.deb"
	egz "${srcdir}/rocm-device-libs_1.0.0.50000-49_amd64.deb"
	egz "${srcdir}/rocm-language-runtime_5.0.0.50000-49_amd64.deb"
	egz "${srcdir}/rocm-hip-runtime_5.0.0.50000-49_amd64.deb"
	egz "${srcdir}/rocm-ocl-icd_2.0.0.50000-49_amd64.deb"
	egz "${srcdir}/rocm-opencl_2.0.0.50000-49_amd64.deb"
	egz "${srcdir}/rocm-opencl-dev_2.0.0.50000-49_amd64.deb"
	egz "${srcdir}/rocm-opencl-runtime_5.0.0.50000-49_amd64.deb"
	egz "${srcdir}/rocm-clang-ocl_0.5.0.50000-49_amd64.deb"
	egz "${srcdir}/rocm-smi-lib_5.0.0.50000-49_amd64.deb"
	egz "${srcdir}/rocm-cmake_0.6.1.50000-49_amd64.deb"
	egz "${srcdir}/rocm-dbgapi_0.62.1.50000-49_amd64.deb"
	egz "${srcdir}/rocm-debug-agent_2.0.1.50000-49_amd64.deb"
	egz "${srcdir}/rocm-utils_5.0.0.50000-49_amd64.deb"
	egz "${srcdir}/rocprofiler-dev_1.0.0.50000-49_amd64.deb"
	egz "${srcdir}/roctracer-dev_1.0.0.50000-49_amd64.deb"
	egz "${srcdir}/rocm-dev_5.0.0.50000-49_amd64.deb"
	egz "${srcdir}/hsa-amd-aqlprofile_1.0.0.50000-49_amd64.deb"
	exz "${srcdir}/libdrm-amdgpu-amdgpu1_2.4.107.50000-1373477_amd64.deb"
	exz "${srcdir}/openmp-extras_13.50.0.50000-49_amd64.deb"
	exz "${srcdir}/rocm-gdb_11.1.50000-49_amd64.deb"
	exz "${srcdir}/opencl-legacy-amdgpu-pro-icd_21.50-1373477_amd64.deb"

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
	ln -s "/opt/rocm-5.0.0" "$pkgdir/opt/rocm"
	ln -s "/opt/rocm-5.0.0/hip/bin/.hipVersion" "$pkgdir/opt/rocm-5.0.0/bin/.hipVersion"

	mkdir -p "${pkgdir}/opt/amdgpu/share/libdrm"
	cd "${pkgdir}/opt/amdgpu/share/libdrm"
	ln -s /usr/share/libdrm/amdgpu.ids amdgpu.ids		

	mkdir -p ${pkgdir}/etc/OpenCL/vendors	
	echo libamdocl64.so > "${pkgdir}/etc/OpenCL/vendors/amdocl64.icd"
	echo libamdocl-orca64.so > "${pkgdir}/etc/OpenCL/vendors/amdocl-orca64.icd"

	mkdir -p ${pkgdir}/etc/ld.so.conf.d
	echo /opt/rocm-5.0.0/opencl/lib > "$pkgdir/etc/ld.so.conf.d/opencl-amd.conf"
	echo /opt/rocm-5.0.0/lib >> "$pkgdir/etc/ld.so.conf.d/opencl-amd.conf"

	mkdir -p ${pkgdir}/etc/profile.d
	echo export PATH="$PATH:/opt/rocm-5.0.0/bin:/opt/rocm-5.0.0/hip/bin" > "$pkgdir/etc/profile.d/opencl-amd.sh"
}
