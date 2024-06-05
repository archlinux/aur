# Maintainer: Carson Rueter <roachh at proton mail dot com>
# Co-Maintainer: George Sofianos

# Release notes https://rocm.docs.amd.com/en/latest/about/CHANGELOG.html#rocm-6-1-2
amdgpu_repo='https://repo.radeon.com/amdgpu/6.1.2/ubuntu'
rocm_repo='https://repo.radeon.com/rocm/apt/6.1.2'
opencl_lib='opt/rocm-6.1.2/opencl/lib'
rocm_lib='opt/rocm-6.1.2/lib'
hip_lib='opt/rocm-6.1.2/hip/lib/'
amdgpu="opt/amdgpu/lib/x86_64-linux-gnu"
amdgpu_pro="opt/amdgpu-pro/lib/x86_64-linux-gnu/"

pkgname=opencl-amd
pkgdesc="ROCm components repackaged from AMD's Ubuntu releases (ROCr runtime, ROCm runtime, HIP runtime) - This package is intended to work along with the free amdgpu stack."
pkgver=6.1.2
pkgrel=1
epoch=1
arch=('x86_64')
url='http://www.amd.com'
license=('custom:AMD')
makedepends=('wget')
depends=('libdrm' 'ocl-icd' 'gcc-libs' 'numactl')
provides=('opencl-driver' 'libdrm-amdgpu-amdgpu1' 'rocm-core' 'comgr' 'hip' 'hipcc' 'hip-dev' 'hip-doc' 'hip-samples' 'hsakmt-roct' 'hsakmt-roct-dev' 'hsa-rocr' 'hsa-rocr-dev' 'rocminfo' 'hip-runtime-amd' 'rocm-device-libs' 'rocm-language-runtime' 
	'rocm-hip-runtime' 'rocdecode' 'rocdecode-dev' 'rocm-ocl-icd' 'rocm-opencl-icd-loader' 'rocm-opencl' 'rocm-opencl-dev' 'rocm-opencl-runtime' 'rocm-clang-ocl' 'rocm-dbgapi' 'rocm-debug-agent' 'rocm-gdb' 'rocprofiler' 'rocprofiler-dev' 'rocprofiler-plugins'
	'rocprofiler-register' 'roctracer' 'roctracer-dev' 'hsa-amd-aqlprofile' 'openmp-extras-runtime' 'rocm-cmake' 'rocm-utils' 'rocm-smi-lib' 'amd-smi-lib')
conflicts=('rocm-opencl-runtime' 'libdrm-amdgpu-amdgpu1' 'rocm-core' 'comgr' 'hip' 'hipcc' 'hip-dev' 'hip-doc' 'hip-samples' 'hsakmt-roct' 'hsakmt-roct-dev' 'hsa-rocr' 'hsa-rocr-dev' 'rocminfo' 'hip-runtime-amd' 'rocm-device-libs' 'rocm-language-runtime' 
	'rocm-hip-runtime' 'rocdecode' 'rocdecode-dev' 'rocm-ocl-icd' 'rocm-opencl-icd-loader' 'rocm-opencl' 'rocm-opencl-dev' 'rocm-opencl-runtime' 'rocm-clang-ocl' 'rocm-dbgapi' 'rocm-debug-agent' 'rocm-gdb' 'rocprofiler' 'rocprofiler-dev' 'rocprofiler-plugins'
	'rocprofiler-register' 'roctracer' 'roctracer-dev' 'hsa-amd-aqlprofile' 'openmp-extras-runtime' 'rocm-cmake' 'rocm-utils' 'rocm-smi-lib' 'amd-smi-lib')
optdepends=('clinfo' 'opencl-amd-dev')

source=(
# LIBDRM
"https://repo.radeon.com/amdgpu/6.1.2/ubuntu/pool/main/libd/libdrm-amdgpu/libdrm-amdgpu-amdgpu1_2.4.120.60102-1781449.22.04_amd64.deb"
# ROCM
"https://repo.radeon.com/rocm/apt/6.1.2/pool/main/r/rocm-core/rocm-core_6.1.2.60102-119~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.2/pool/main/c/comgr/comgr_2.7.0.60102-119~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.2/pool/main/h/hipcc/hipcc_1.0.0.60102-119~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.2/pool/main/h/hip-dev/hip-dev_6.1.40093.60102-119~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.2/pool/main/h/hip-doc/hip-doc_6.1.40093.60102-119~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.2/pool/main/h/hip-samples/hip-samples_6.1.40093.60102-119~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.2/pool/main/h/hsakmt-roct-dev/hsakmt-roct-dev_20240125.5.08.60102-119~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.2/pool/main/h/hsa-rocr/hsa-rocr_1.13.0.60102-119~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.2/pool/main/h/hsa-rocr-dev/hsa-rocr-dev_1.13.0.60102-119~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.2/pool/main/r/rocminfo/rocminfo_1.0.0.60102-119~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.2/pool/main/h/hip-runtime-amd/hip-runtime-amd_6.1.40093.60102-119~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.2/pool/main/r/rocm-device-libs/rocm-device-libs_1.0.0.60102-119~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.2/pool/main/r/rocm-language-runtime/rocm-language-runtime_6.1.2.60102-119~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.2/pool/main/r/rocm-hip-runtime/rocm-hip-runtime_6.1.2.60102-119~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.2/pool/main/r/rocdecode/rocdecode_0.6.0.60102-119~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.2/pool/main/r/rocdecode-dev/rocdecode-dev_0.6.0.60102-119~22.04_amd64.deb"
#"https://repo.radeon.com/rocm/apt/6.1.2/pool/main/r/rocm-ocl-icd/rocm-ocl-icd_2.0.0.60102-119~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.2/pool/main/r/rocm-opencl-icd-loader/rocm-opencl-icd-loader_1.2.60102-119~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.2/pool/main/r/rocm-opencl/rocm-opencl_2.0.0.60102-119~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.2/pool/main/r/rocm-opencl-dev/rocm-opencl-dev_2.0.0.60102-119~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.2/pool/main/r/rocm-opencl-runtime/rocm-opencl-runtime_6.1.2.60102-119~22.04_amd64.deb"
# ROCM DEV
"https://repo.radeon.com/rocm/apt/6.1.2/pool/main/r/rocm-clang-ocl/rocm-clang-ocl_0.5.0.60102-119~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.2/pool/main/o/openmp-extras-runtime/openmp-extras-runtime_17.60.0.60102-119~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.2/pool/main/r/rocm-smi-lib/rocm-smi-lib_7.2.0.60102-119~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.2/pool/main/a/amd-smi-lib/amd-smi-lib_24.5.1.60102-119~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.2/pool/main/r/rocm-cmake/rocm-cmake_0.12.0.60102-119~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.2/pool/main/r/rocm-dbgapi/rocm-dbgapi_0.71.0.60102-119~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.2/pool/main/r/rocm-debug-agent/rocm-debug-agent_2.0.3.60102-119~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.2/pool/main/r/rocm-gdb/rocm-gdb_14.1.60102-119~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.2/pool/main/r/rocm-utils/rocm-utils_6.1.2.60102-119~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.2/pool/main/r/rocprofiler/rocprofiler_2.0.60102.60102-119~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.2/pool/main/r/rocprofiler-dev/rocprofiler-dev_2.0.60102.60102-119~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.2/pool/main/r/rocprofiler-plugins/rocprofiler-plugins_2.0.60102.60102-119~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.2/pool/main/r/rocprofiler-register/rocprofiler-register_0.3.0.60102-119~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.2/pool/main/r/roctracer/roctracer_4.1.60102.60102-119~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.2/pool/main/r/roctracer-dev/roctracer-dev_4.1.60102.60102-119~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.2/pool/main/r/rocm-dev/rocm-dev_6.1.2.60102-119~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.1.2/pool/main/h/hsa-amd-aqlprofile/hsa-amd-aqlprofile_1.0.0.60102.60102-119~22.04_amd64.deb"
# Proprietary
"https://repo.radeon.com/amdgpu/5.7.1/ubuntu/pool/proprietary/o/opencl-legacy-amdgpu-pro/opencl-legacy-amdgpu-pro-icd_23.20-1664987.22.04_amd64.deb"
)

sha256sums=(
"9f4f4fa0603451f7d84c6b202618e72605efd0e979b249cff34c51b634af8ac9"

"c95ac0a0e8ac071bbe3ad8b10f4587bc625865f7582cdadab3ee65805cfdc166"
"6d4a2c34f0ddf729ab2eb831f3586d006931963870042f55082537dcea5c929d"
"936f1798deeb729720c9859c54d4540422f4acc7b508e0b0759719a5d0c31b52"
"1c934bf37d2c06e0c774fbb0378748f6b06e73c13d2f17530ef4e7042ff0e66d"
"def461b303cc96567be3de97a09a9ac7def91656728aa7be8146ccc697874fe1"
"4c577e55eca399473afcc34397dc2456564761a42260acce01c53a253645cedd"
"de56e125ec360f348b67033e33717b0732cca0b0faba7439ce0c94000ddcfc95"
"4fb66b59662e2850aeb4b712dea983eb309d9fde4f0af14a4778da1ecdd15afb"
"41b1ed984a1b52111c95670bf5199c6d34f88c4d458ce17b45e4b7148c6df98c"
"c7e58cb6e0a7a4e87649f31c6b235f6d77e34689193629a6103189ee7057c2bf"
"82f46e6503dd59dd75a52ca58062bce669c6a74643e08083c67cbe2e5e46d89e"
"d638b0e07c5b02c1a93993d3ee149dc64b49cd7284554f9e1dfdceaacaa95aef"
"6c05f7722e41f219b7859c219cde236f337380ecca2ca1b12e1a19117de5d415"
"e8a63687fc7fc8de67236f79b6f4d5e9d6302814f9c9cb464bd41ba188db4d34"
"04cff96fd580bcf9b2aeeb139721cbf018f72f8935b388a5d7bea07c2144087e"
"9edfcfb5154f1e3a37bd399a48f579e3c11aca994645b22fcab51f17311374e6"
"9bca982b20de3846b2e19d0fe38ff930100712d002fc23b6a805ea646f9fd97d"
"fb46fbab46b344f6ee20c81d95af01dd052adbfaf9b5adcb082cea8244c61c15"
"b62e4492e27012032efa995c80a6c0f7a3205f7559837ab140e0bd49f6f5e4ab"
"44a6a3be64ec2f660f8a1fdf7c0311a914b73d82fcd3421b467c2e3f160b3671"

"92171971022bc982315271faa583bda18b30036814fa6b6e6ca9ac2a27674186"
"f6067bda85e28fff6b107c2a29af16df7fed7c532f51ad85990ed5a0fa056d2d"
"84ec18b4c188f894874bf9f32327d8523a2de6fff5d51bec9e569cfb97b3f87f"
"a5b0c1243954e920c899d5d308df69e26a7acb102eddb4a1859d69499279f1d2"
"1427dbdcc392b7aac1a88638121b0286b3f6d7e5c3e375ff98263fccef2c5b6f"
"f4d13284099a0607d53e0445ff5a3a6c38ba7b50290ad2a6527caa5d97ed25e5"
"44ecaebe0b27966e47c5f3c47a3e13b6986730aee2d31bf5baaba7e492240b36"
"bb2eada9e02c5b39ca2ce7a3ee4b79d67c4f7eec358620dec2b0511583719fd3"
"b345e3ee866c152c26a4dd1e07c764354a0356fb489cb5094339831ca4dae9c5"
"31c6d6f86f53cae16c36d12f3c9c5b8701b9b50efaa46f1fd49d6aff026aedb3"
"abf74fef3d4ca2702bdf3bf0108a05dadf1aa6da4e2cb9c884e41eb8b653d3d6"
"1b409e68982c97d5b3d2df7a3e433fec29294147f2ee22a2c4ad0e6a3a30270c"
"95ca1946563f710333cbcda5f29d1a14898e41108b9740d6c9421db828f1adfd"
"4a076cada0f3beb79451aca47a86bfc5575a28ffbd67726870402f73d0fb383e"
"9b73816c79513f282e28828889b1755f40677e6e69f426397d80a8b98a3e116c"
"6dd4d30bacc36fd9ae346b4262c9eeeccf2777a8c5e140a80d4e95ad58f04715"
"5a3b98ca1df2830330138b3628b7173797117381b405b5b1ed1a34275b56fd05"
# Proprietary
"194bf41a21b40f8305f532818a5d2491dca0f6f0750b3d2b538c54f57dbb2dfd"
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
	egz "${srcdir}/rocm-core_6.1.2.60102-119~22.04_amd64.deb"
	egz "${srcdir}/comgr_2.7.0.60102-119~22.04_amd64.deb"
	egz "${srcdir}/hipcc_1.0.0.60102-119~22.04_amd64.deb"
	egz "${srcdir}/hip-dev_6.1.40093.60102-119~22.04_amd64.deb"
	egz "${srcdir}/hip-doc_6.1.40093.60102-119~22.04_amd64.deb"
	egz "${srcdir}/hip-samples_6.1.40093.60102-119~22.04_amd64.deb"
	egz "${srcdir}/hsakmt-roct-dev_20240125.5.08.60102-119~22.04_amd64.deb"
	egz "${srcdir}/hsa-rocr_1.13.0.60102-119~22.04_amd64.deb"
	egz "${srcdir}/hsa-rocr-dev_1.13.0.60102-119~22.04_amd64.deb"
	egz "${srcdir}/rocminfo_1.0.0.60102-119~22.04_amd64.deb"
	egz "${srcdir}/hip-runtime-amd_6.1.40093.60102-119~22.04_amd64.deb"
	egz "${srcdir}/rocm-device-libs_1.0.0.60102-119~22.04_amd64.deb"
	egz "${srcdir}/rocm-language-runtime_6.1.2.60102-119~22.04_amd64.deb"
	egz "${srcdir}/rocm-hip-runtime_6.1.2.60102-119~22.04_amd64.deb"
	egz "${srcdir}/rocdecode_0.6.0.60102-119~22.04_amd64.deb"
	egz "${srcdir}/rocdecode-dev_0.6.0.60102-119~22.04_amd64.deb"
	#egz "${srcdir}/rocm-ocl-icd_2.0.0.60102-119~22.04_amd64.deb"
	egz "${srcdir}/rocm-opencl-icd-loader_1.2.60102-119~22.04_amd64.deb"
	egz "${srcdir}/rocm-opencl_2.0.0.60102-119~22.04_amd64.deb"
	egz "${srcdir}/rocm-opencl-dev_2.0.0.60102-119~22.04_amd64.deb"
	egz "${srcdir}/rocm-opencl-runtime_6.1.2.60102-119~22.04_amd64.deb"
	exz "${srcdir}/rocm-clang-ocl_0.5.0.60102-119~22.04_amd64.deb"
	egz "${srcdir}/rocm-smi-lib_7.2.0.60102-119~22.04_amd64.deb"
	egz "${srcdir}/amd-smi-lib_24.5.1.60102-119~22.04_amd64.deb"
	exz "${srcdir}/rocm-cmake_0.12.0.60102-119~22.04_amd64.deb"
	egz "${srcdir}/rocm-dbgapi_0.71.0.60102-119~22.04_amd64.deb"
	egz "${srcdir}/rocm-debug-agent_2.0.3.60102-119~22.04_amd64.deb"
	egz "${srcdir}/rocm-utils_6.1.2.60102-119~22.04_amd64.deb"
	egz "${srcdir}/rocprofiler_2.0.60102.60102-119~22.04_amd64.deb"
	egz "${srcdir}/rocprofiler-dev_2.0.60102.60102-119~22.04_amd64.deb"
	egz "${srcdir}/rocprofiler-plugins_2.0.60102.60102-119~22.04_amd64.deb"
	egz "${srcdir}/rocprofiler-register_0.3.0.60102-119~22.04_amd64.deb"
	egz "${srcdir}/roctracer_4.1.60102.60102-119~22.04_amd64.deb"
	egz "${srcdir}/roctracer-dev_4.1.60102.60102-119~22.04_amd64.deb"
	egz "${srcdir}/rocm-dev_6.1.2.60102-119~22.04_amd64.deb"
	egz "${srcdir}/hsa-amd-aqlprofile_1.0.0.60102.60102-119~22.04_amd64.deb"
	exz "${srcdir}/libdrm-amdgpu-amdgpu1_2.4.120.60102-1781449.22.04_amd64.deb"
	egz "${srcdir}/openmp-extras-runtime_17.60.0.60102-119~22.04_amd64.deb"
	egz "${srcdir}/rocm-gdb_14.1.60102-119~22.04_amd64.deb"
	exz "${srcdir}/opencl-legacy-amdgpu-pro-icd_23.20-1664987.22.04_amd64.deb"	

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
	ln -s "/opt/rocm-6.1.2" "$pkgdir/opt/rocm"
	#ln -s "/opt/rocm-6.1.2/hip/bin/.hipVersion" "$pkgdir/opt/rocm-6.1.2/bin/.hipVersion"

	mkdir -p "${pkgdir}/opt/amdgpu/share/libdrm"
	cd "${pkgdir}/opt/amdgpu/share/libdrm"
	ln -s /usr/share/libdrm/amdgpu.ids amdgpu.ids		

	mkdir -p ${pkgdir}/etc/OpenCL/vendors	
	echo libamdocl64.so > "${pkgdir}/etc/OpenCL/vendors/amdocl64.icd"
	echo libamdocl-orca64.so > "${pkgdir}/etc/OpenCL/vendors/amdocl-orca64.icd"

	mkdir -p ${pkgdir}/etc/ld.so.conf.d
	echo /opt/rocm-6.1.2/opencl/lib > "$pkgdir/etc/ld.so.conf.d/opencl-amd.conf"
	echo /opt/rocm-6.1.2/lib >> "$pkgdir/etc/ld.so.conf.d/opencl-amd.conf"
	echo /opt/rocm-6.1.2/hip/lib >> "$pkgdir/etc/ld.so.conf.d/opencl-amd.conf"

	mkdir -p ${pkgdir}/etc/profile.d
	echo export PATH="\${PATH}:/opt/rocm-6.1.2/bin:/opt/rocm-6.1.2/hip/bin" > "$pkgdir/etc/profile.d/opencl-amd.sh"
}
