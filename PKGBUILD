# Maintainer: Carson Rueter <roachh at proton mail dot com>
# Co-Maintainer: George Sofianos

# Release notes https://docs.amd.com/bundle/ROCm-Release-Notes-v5.1/page/About_This_Document.html
amdgpu_install='22.10.3.50103'
amdgpu_version='22.10.3'
rocm_version='50103'
amdgpu_build_id='1420322'
rocm_build_id='66'
amdgpu_repo='https://repo.radeon.com/amdgpu/22.10.3/ubuntu'
rocm_repo='https://repo.radeon.com/rocm/apt/5.1.3'
opencl_lib='opt/rocm-5.1.3/opencl/lib'
rocm_lib='opt/rocm-5.1.3/lib'
hip_lib='opt/rocm-5.1.3/hip/lib/'
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
"https://repo.radeon.com/amdgpu/22.10.3/ubuntu/pool/main/libd/libdrm-amdgpu/libdrm-amdgpu-amdgpu1_2.4.109.50103-1420322_amd64.deb"
# ROCM
"https://repo.radeon.com/rocm/apt/5.1.3/pool/main/r/rocm-core/rocm-core_5.1.3.50103-66_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1.3/pool/main/c/comgr/comgr_2.4.0.50103-66_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1.3/pool/main/h/hip-dev/hip-dev_5.1.20532.50103-66_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1.3/pool/main/h/hip-doc/hip-doc_5.1.20532.50103-66_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1.3/pool/main/h/hip-samples/hip-samples_5.1.20532.50103-66_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1.3/pool/main/h/hsakmt-roct-dev/hsakmt-roct-dev_20220128.1.7.50103-66_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1.3/pool/main/h/hsa-rocr/hsa-rocr_1.5.0.50103-66_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1.3/pool/main/h/hsa-rocr-dev/hsa-rocr-dev_1.5.0.50103-66_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1.3/pool/main/r/rocminfo/rocminfo_1.0.0.50103-66_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1.3/pool/main/h/hip-runtime-amd/hip-runtime-amd_5.1.20532.50103-66_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1.3/pool/main/r/rocm-device-libs/rocm-device-libs_1.0.0.50103-66_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1.3/pool/main/r/rocm-language-runtime/rocm-language-runtime_5.1.3.50103-66_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1.3/pool/main/r/rocm-hip-runtime/rocm-hip-runtime_5.1.3.50103-66_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1.3/pool/main/r/rocm-ocl-icd/rocm-ocl-icd_2.0.0.50103-66_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1.3/pool/main/r/rocm-opencl/rocm-opencl_2.0.0.50103-66_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1.3/pool/main/r/rocm-opencl-dev/rocm-opencl-dev_2.0.0.50103-66_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1.3/pool/main/r/rocm-opencl-runtime/rocm-opencl-runtime_5.1.3.50103-66_amd64.deb"
# ROCM DEV
"https://repo.radeon.com/rocm/apt/5.1.3/pool/main/r/rocm-clang-ocl/rocm-clang-ocl_0.5.0.50103-66_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1.3/pool/main/o/openmp-extras/openmp-extras_13.51.0.50103-66_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1.3/pool/main/r/rocm-smi-lib/rocm-smi-lib_5.0.0.50103-66_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1.3/pool/main/r/rocm-cmake/rocm-cmake_0.7.2.50103-66_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1.3/pool/main/r/rocm-dbgapi/rocm-dbgapi_0.64.0.50103-66_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1.3/pool/main/r/rocm-debug-agent/rocm-debug-agent_2.0.3.50103-66_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1.3/pool/main/r/rocm-gdb/rocm-gdb_11.2.50103-66_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1.3/pool/main/r/rocm-utils/rocm-utils_5.1.3.50103-66_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1.3/pool/main/r/rocprofiler-dev/rocprofiler-dev_1.0.0.50103-66_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1.3/pool/main/r/roctracer-dev/roctracer-dev_1.0.0.50103-66_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1.3/pool/main/r/rocm-dev/rocm-dev_5.1.3.50103-66_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.1.3/pool/main/h/hsa-amd-aqlprofile/hsa-amd-aqlprofile_1.0.0.50103-66_amd64.deb"
# Proprietary
"https://repo.radeon.com/amdgpu/22.10.3/ubuntu/pool/proprietary/o/opencl-legacy-amdgpu-pro/opencl-legacy-amdgpu-pro-icd_22.10.3-1420322_amd64.deb"
#"https://repo.radeon.com/amdgpu/22.10.3/ubuntu/pool/proprietary/c/clinfo-amdgpu-pro/clinfo-amdgpu-pro_22.10-1420322_amd64.deb"
#"https://repo.radeon.com/amdgpu/22.10.3/ubuntu/pool/proprietary/o/ocl-icd-amdgpu-pro/ocl-icd-libopencl1-amdgpu-pro_22.10-1420322_amd64.deb"
#"https://repo.radeon.com/amdgpu/22.10.3/ubuntu/pool/proprietary/a/amf-amdgpu-pro/amf-amdgpu-pro_1.4.24-1420322_amd64.deb"
)

sha256sums=(
"7eb38776a06e76e6081d3185de3709f04594fcf2ff5c87145cae0a75a6f52ca7"

"99a4631736fc9d0a88db6e76886b68e066a33a4e673ab350c0fba07010ba52c8"
"8f0d53be604e56317b73574dfd546bac9b785a4c231b28e2d52e0839cf1ad48a"
"2bb1613b50fd39eb37db9da0b4968c1c3b319c17bb01160e7ee3e75dba35b280"
"f2c57a353c5830a4537c9230ccf448549dd2fdefd97be313349538c552a6e567"
"d6c219b5b158cf1b48e23ffabe18ab88cc43d8a00e622c3f17510dcc4c5f2ef3"
"7bd9b611296fabc0ef03a21411c2c8d9a91c784760ce425a1247698f9dfc5470"
"608eacf2962fddda580068fbe95b713d8ab2241d824aae0a7180d066c7e3e21f"
"a5d3edd0bb04d79f9085f2d81fb60c0ad12e58fb05f76f9a03dd48e0b454c9bf"
"e1fdd92ab552a0f0613d7ff6b051cce14a436c8e1aaa8d32c963f41fa13b6422"
"b70beba5f0369a5a87295e6930c4fb129c09a0908ddbd26b95e272cbcb7d5e1c"
"0df10f31dd315bded880bf9fa7689fdb5c8ddf848669b6d7f72d2bfe9166dde8"
"7dba7c8a534f75ba5a0e2f97a8fbc1dc4f44e514b7ba3b97a34a34f0b529adf0"
"5317c160b427eecc8136e91ca1508f4dd911102d22608d4af63f638233cc5d37"
"a8e6bc040bccb21a59d437dec9825509624d8851c41268b8fb3961d0df45ea84"
"c4029925eade8bab0909607bebe1539d79c06bba2c44f3426a07cbfaca3a6f29"
"7476b48f36ac7273271902f55177400eef573d69c3be566dbed0d42db02f3a42"
"ddd980c286d54864ad227f67623a9b952cfd9afe551b241da0ca9261fdeacf66"

"6d170a7af7d128a1cb371abde167c50ef1ade7493a247251ad2232f10e175e21"
"8f4c7dfe73454594587f1447b57824e344e29db967aa4c982a4e1de44e5f1cd7"
"3e27e27a4563f6bfd3df9ea42a85d12985f1c5bf2133774ece68acbdd57a89a6"
"26e31d362b9d204f45312d0984fa5a15608a2c2f27cc452629c68edb1694e024"
"da3dad444d19bd9495fdbe1a64fccb2360cb8af6ed1360dc739719c7df80bb7f"
"513123a02aab9b8685e02b50596d32d500a2406f1b75205d0304ff66c19fcabe"
"cc4cf3944c409cf2557588101e3af937e46b5344b55792df63963223ee186d04"
"d95ddb13ed1b2360dde1fa1ea22c9489fe135884e89fc8e1507d75a2414e04d8"
"fcc515dc0c214e9b5948373a434b2d7577dca0e3303c0df213333470d9591c10"
"05c4e355516f86ed056b40975a77672c4f513c6378ee9470d41e1554930b3d8c"
"db5494287db2a044a511b871092275a9f2fe53948e1604fc849f921a1864cadc"
"ba76a30f078cfd2d4927fd43840f22265ebc0dfd1c03ac3bc36f637b67ec4119"
"da7775df904c0c430237f161c081953091ddecce6b02c02f16e1c800cd215b11"
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
	egz "${srcdir}/rocm-core_5.1.3.50103-66_amd64.deb"
	egz "${srcdir}/comgr_2.4.0.50103-66_amd64.deb"
	egz "${srcdir}/hip-dev_5.1.20532.50103-66_amd64.deb"
	egz "${srcdir}/hip-doc_5.1.20532.50103-66_amd64.deb"
	egz "${srcdir}/hip-samples_5.1.20532.50103-66_amd64.deb"
	egz "${srcdir}/hsakmt-roct-dev_20220128.1.7.50103-66_amd64.deb"
	egz "${srcdir}/hsa-rocr_1.5.0.50103-66_amd64.deb"
	egz "${srcdir}/hsa-rocr-dev_1.5.0.50103-66_amd64.deb"
	egz "${srcdir}/rocminfo_1.0.0.50103-66_amd64.deb"
	egz "${srcdir}/hip-runtime-amd_5.1.20532.50103-66_amd64.deb"
	egz "${srcdir}/rocm-device-libs_1.0.0.50103-66_amd64.deb"
	egz "${srcdir}/rocm-language-runtime_5.1.3.50103-66_amd64.deb"
	egz "${srcdir}/rocm-hip-runtime_5.1.3.50103-66_amd64.deb"
	egz "${srcdir}/rocm-ocl-icd_2.0.0.50103-66_amd64.deb"
	egz "${srcdir}/rocm-opencl_2.0.0.50103-66_amd64.deb"
	egz "${srcdir}/rocm-opencl-dev_2.0.0.50103-66_amd64.deb"
	egz "${srcdir}/rocm-opencl-runtime_5.1.3.50103-66_amd64.deb"
	egz "${srcdir}/rocm-clang-ocl_0.5.0.50103-66_amd64.deb"
	egz "${srcdir}/rocm-smi-lib_5.0.0.50103-66_amd64.deb"
	egz "${srcdir}/rocm-cmake_0.7.2.50103-66_amd64.deb"
	egz "${srcdir}/rocm-dbgapi_0.64.0.50103-66_amd64.deb"
	egz "${srcdir}/rocm-debug-agent_2.0.3.50103-66_amd64.deb"
	egz "${srcdir}/rocm-utils_5.1.3.50103-66_amd64.deb"
	egz "${srcdir}/rocprofiler-dev_1.0.0.50103-66_amd64.deb"
	egz "${srcdir}/roctracer-dev_1.0.0.50103-66_amd64.deb"
	egz "${srcdir}/rocm-dev_5.1.3.50103-66_amd64.deb"
	egz "${srcdir}/hsa-amd-aqlprofile_1.0.0.50103-66_amd64.deb"
	exz "${srcdir}/libdrm-amdgpu-amdgpu1_2.4.109.50103-1420322_amd64.deb"
	exz "${srcdir}/openmp-extras_13.51.0.50103-66_amd64.deb"
	exz "${srcdir}/rocm-gdb_11.2.50103-66_amd64.deb"
	exz "${srcdir}/opencl-legacy-amdgpu-pro-icd_22.10.3-1420322_amd64.deb"

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
	ln -s "/opt/rocm-5.1.3" "$pkgdir/opt/rocm"
	ln -s "/opt/rocm-5.1.3/hip/bin/.hipVersion" "$pkgdir/opt/rocm-5.1.3/bin/.hipVersion"

	mkdir -p "${pkgdir}/opt/amdgpu/share/libdrm"
	cd "${pkgdir}/opt/amdgpu/share/libdrm"
	ln -s /usr/share/libdrm/amdgpu.ids amdgpu.ids		

	mkdir -p ${pkgdir}/etc/OpenCL/vendors	
	echo libamdocl64.so > "${pkgdir}/etc/OpenCL/vendors/amdocl64.icd"
	echo libamdocl-orca64.so > "${pkgdir}/etc/OpenCL/vendors/amdocl-orca64.icd"

	mkdir -p ${pkgdir}/etc/ld.so.conf.d
	echo /opt/rocm-5.1.3/opencl/lib > "$pkgdir/etc/ld.so.conf.d/opencl-amd.conf"
	echo /opt/rocm-5.1.3/lib >> "$pkgdir/etc/ld.so.conf.d/opencl-amd.conf"
	echo /opt/rocm-5.1.3/hip/lib >> "$pkgdir/etc/ld.so.conf.d/opencl-amd.conf"

	mkdir -p ${pkgdir}/etc/profile.d
	echo export PATH="\${PATH}:/opt/rocm-5.1.3/bin:/opt/rocm-5.1.3/hip/bin" > "$pkgdir/etc/profile.d/opencl-amd.sh"
}
