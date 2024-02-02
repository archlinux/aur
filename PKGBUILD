# Maintainer: Carson Rueter <roachh at proton mail dot com>
# Co-Maintainer: George Sofianos

# Release notes https://rocm.docs.amd.com/en/latest/about/CHANGELOG.html#rocm-6-0-2
amdgpu_repo='https://repo.radeon.com/amdgpu/6.0.2/ubuntu'
rocm_repo='https://repo.radeon.com/rocm/apt/6.0.2'
opencl_lib='opt/rocm-6.0.2/opencl/lib'
rocm_lib='opt/rocm-6.0.2/lib'
hip_lib='opt/rocm-6.0.2/hip/lib/'
amdgpu="opt/amdgpu/lib/x86_64-linux-gnu"
amdgpu_pro="opt/amdgpu-pro/lib/x86_64-linux-gnu/"

pkgname=opencl-amd
pkgdesc="ROCr OpenCL stack, supports Vega 10 and later products - Legacy OpenCL stack (Proprietary), supports legacy products older than Vega 10 - This package is intended to work along with the free amdgpu stack."            
pkgver=6.0.2
pkgrel=1
epoch=1
arch=('x86_64')
url='http://www.amd.com'
license=('custom:AMD')
makedepends=('wget')
depends=('libdrm' 'ocl-icd' 'gcc-libs' 'numactl')
provides=('opencl-driver' 'libdrm-amdgpu-amdgpu1' 'rocm-core' 'comgr' 'hip' 'hipcc' 'hip-dev' 'hip-doc' 'hip-samples' 'hsakmt-roct' 'hsakmt-roct-dev' 'hsa-rocr' 'hsa-rocr-dev' 'rocminfo' 'hip-runtime-amd' 'rocm-device-libs' 'rocm-language-runtime' 
	'rocm-hip-runtime' 'rocm-ocl-icd' 'rocm-opencl' 'rocm-opencl-dev' 'rocm-opencl-runtime' 'rocm-clang-ocl' 'rocm-dbgapi' 'rocm-debug-agent' 'rocm-gdb' 'rocprofiler' 'rocprofiler-dev' 'rocprofiler-plugins' 'roctracer' 'roctracer-dev' 'hsa-amd-aqlprofile' 'openmp-extras-runtime' 'rocm-cmake' 'rocm-utils' 'rocm-smi-lib')
conflicts=('rocm-opencl-runtime' 'libdrm-amdgpu-amdgpu1' 'rocm-core' 'comgr' 'hip' 'hipcc' 'hip-dev' 'hip-doc' 'hip-samples' 'hsakmt-roct' 'hsakmt-roct-dev' 'hsa-rocr' 'hsa-rocr-dev' 'rocminfo' 'hip-runtime-amd' 'rocm-device-libs' 'rocm-language-runtime' 
	'rocm-hip-runtime' 'rocm-ocl-icd' 'rocm-opencl' 'rocm-opencl-dev' 'rocm-opencl-runtime' 'rocm-clang-ocl' 'rocm-dbgapi' 'rocm-debug-agent' 'rocm-gdb' 'rocprofiler' 'rocprofiler-dev' 'rocprofiler-plugins' 'roctracer' 'roctracer-dev' 'hsa-amd-aqlprofile' 'openmp-extras-runtime' 'rocm-cmake' 'rocm-utils' 'rocm-smi-lib')
optdepends=('clinfo' 'opencl-amd-dev')

source=(
# LIBDRM
"https://repo.radeon.com/amdgpu/6.0.2/ubuntu/pool/main/libd/libdrm-amdgpu/libdrm-amdgpu-amdgpu1_2.4.116.60002-1718217.22.04_amd64.deb"
# ROCM
"https://repo.radeon.com/rocm/apt/6.0.2/pool/main/r/rocm-core/rocm-core_6.0.2.60002-115~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.0.2/pool/main/c/comgr/comgr_2.6.0.60002-115~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.0.2/pool/main/h/hipcc/hipcc_1.0.0.60002-115~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.0.2/pool/main/h/hip-dev/hip-dev_6.0.32831.60002-115~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.0.2/pool/main/h/hip-doc/hip-doc_6.0.32831.60002-115~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.0.2/pool/main/h/hip-samples/hip-samples_6.0.32831.60002-115~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.0.2/pool/main/h/hsakmt-roct-dev/hsakmt-roct-dev_20231016.2.245.60002-115~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.0.2/pool/main/h/hsa-rocr/hsa-rocr_1.12.0.60002-115~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.0.2/pool/main/h/hsa-rocr-dev/hsa-rocr-dev_1.12.0.60002-115~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.0.2/pool/main/r/rocminfo/rocminfo_1.0.0.60002-115~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.0.2/pool/main/h/hip-runtime-amd/hip-runtime-amd_6.0.32831.60002-115~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.0.2/pool/main/r/rocm-device-libs/rocm-device-libs_1.0.0.60002-115~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.0.2/pool/main/r/rocm-language-runtime/rocm-language-runtime_6.0.2.60002-115~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.0.2/pool/main/r/rocm-hip-runtime/rocm-hip-runtime_6.0.2.60002-115~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.0.2/pool/main/r/rocm-ocl-icd/rocm-ocl-icd_2.0.0.60002-115~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.0.2/pool/main/r/rocm-opencl/rocm-opencl_2.0.0.60002-115~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.0.2/pool/main/r/rocm-opencl-dev/rocm-opencl-dev_2.0.0.60002-115~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.0.2/pool/main/r/rocm-opencl-runtime/rocm-opencl-runtime_6.0.2.60002-115~22.04_amd64.deb"
# ROCM DEV
"https://repo.radeon.com/rocm/apt/6.0.2/pool/main/r/rocm-clang-ocl/rocm-clang-ocl_0.5.0.60002-115~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.0.2/pool/main/o/openmp-extras-runtime/openmp-extras-runtime_17.60.0.60002-115~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.0.2/pool/main/r/rocm-smi-lib/rocm-smi-lib_6.0.0.60002-115~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.0.2/pool/main/r/rocm-cmake/rocm-cmake_0.11.0.60002-115~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.0.2/pool/main/r/rocm-dbgapi/rocm-dbgapi_0.71.0.60002-115~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.0.2/pool/main/r/rocm-debug-agent/rocm-debug-agent_2.0.3.60002-115~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.0.2/pool/main/r/rocm-gdb/rocm-gdb_13.2.60002-115~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.0.2/pool/main/r/rocm-utils/rocm-utils_6.0.2.60002-115~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.0.2/pool/main/r/rocprofiler/rocprofiler_2.0.60002.60002-115~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.0.2/pool/main/r/rocprofiler-dev/rocprofiler-dev_2.0.60002.60002-115~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.0.2/pool/main/r/rocprofiler-plugins/rocprofiler-plugins_2.0.60002.60002-115~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.0.2/pool/main/r/roctracer/roctracer_4.1.60002.60002-115~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.0.2/pool/main/r/roctracer-dev/roctracer-dev_4.1.60002.60002-115~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.0.2/pool/main/r/rocm-dev/rocm-dev_6.0.2.60002-115~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.0.2/pool/main/h/hsa-amd-aqlprofile/hsa-amd-aqlprofile_1.0.0.60002.60002-115~22.04_amd64.deb"
# Proprietary
"https://repo.radeon.com/amdgpu/5.7.1/ubuntu/pool/proprietary/o/opencl-legacy-amdgpu-pro/opencl-legacy-amdgpu-pro-icd_23.20-1664987.22.04_amd64.deb"
)

sha256sums=(
"3bda8ecb552e14ac35479335431da5674ed09e20988b0b5464d887fe7d020633"

"07b3554f96663b4a8895340706f62f67dfd4821b7f362096ad7531aad6b7fa2a"
"f721da9f619cb4d424918b4a1614f26fee523d0368ecf4083295135c3c81e6e0"
"3c764a8dcf43c5c4cbdf99b3aae8d9ea0a178aa1a71348355ddba92a1d6cb72d"
"b4a27482b986d2d08cac4d61f4f920584f17a72578d576262c39cbc545040ee6"
"b6721341b523085cc2015e1450bbc62962a81ba00723cf142860627a99542560"
"d6f152593bf27e69d5022497c5a978af5e525caf6a99fc39547cad42c4166e32"
"97837eeceb36d2562bc3b6e54c2baf0d2c2d6ce9538fe77ecea19ba3fa2417c9"
"2ee9ded0145177ca2a6ad627a4782e9d7ce357d0f1106d0a0250cfd48ec8144a"
"d83dfe2a5ba3b021f5a85604d204b7370d8e4229401e40c2ccc9f4124d38a8ba"
"243f69316827ab1a754e4aeae0e195212cb2780eb195dfddd01384223ea8245e"
"df70624a36774764fa28af670787ffb013dd1f2dbd19ef193aaccde645a475dc"
"02feb9e107c7b3c567e73bab6671c3c67c94376cb1e93dd598f069e961f6ea81"
"0b711435b3880b24e6963270be344a6367619bcd7f087f5fc119b9f8bc00cab6"
"fe6fb876feb76b328d60c3aca240312257d0fb31add27a915f3927b569f89eed"
"560682529dc7ae5de250ba9544455ec925ad4177052d0bbaa04901916edc83d0"
"9d6db26045967134a4ff78b4f21b12fbc220108dfe3b5ceac9727e716cdda01a"
"e0516b2a0fa53e19a2bc0003b122b29b87419a860aab6485de702bbd5153d717"
"3e7ca7e7e6b2000e6d3a3389a2d823f2a2e5c005a989d75c16939ca9a5b481dd"

"02eeba4b20ebf0465ae0b69d0cc57d46ad6b4141e6449abbf3748a82535ee73a"
"ec27bafe4f013fb7b5fa0de2598b2eba2904622738b269ca2aaf944413f81c3d"
"3fbfab7db3d2031b069695b06886d288067cdf6fbdf03e9e335d4f562ca0610c"
"fb6d5323283488edd582a745ac09570d5063c972b186bf3f55f4f783bd82babd"
"8b0849bc504332d7ae7229a850fa5bcc894051b49037606c460e7a584e931909"
"d4cacbfd2107b3f266f7620d98ab5672e752f13c8f4ae3f86fc27f564baf44b3"
"5cbf625ab7e6439161808206055652c244ebc98a18d914aba400d6b5f4d56fac"
"67d429714fa77f8171fc42a6b4e774e5315c245c9ebba4658cd9104b5f31477a"
"7490bd12bf0ff7b89c58bb43124c15f383462f62597f63458388ffaffbded06b"
"86cfb7aa69e999f872925bda388597f8ce91e43231fdc3ad66944647dcb5501b"
"adf67157fca383a2326ce8b2c150bf544daf78490610c0a61b48305bf1264477"
"69e1453cee6911edf95a7d6bf04df796b32cf1e10e722370889c0adce8883881"
"a247f5bef6c494efdfae9da67e9883fb1f28ad3449f313c757f8752529cdca10"
"5c4dc6dbcbfaeb5c867a5489a754c5d48c215eead319d482001bd307d7eacfdb"
"d1778a50a6a87f9a52312fd480bc2e9810c1620c87fe909ec7d8d58942843576"
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
	egz "${srcdir}/rocm-core_6.0.2.60002-115~22.04_amd64.deb"
	egz "${srcdir}/comgr_2.6.0.60002-115~22.04_amd64.deb"
	egz "${srcdir}/hipcc_1.0.0.60002-115~22.04_amd64.deb"
	egz "${srcdir}/hip-dev_6.0.32831.60002-115~22.04_amd64.deb"
	egz "${srcdir}/hip-doc_6.0.32831.60002-115~22.04_amd64.deb"
	egz "${srcdir}/hip-samples_6.0.32831.60002-115~22.04_amd64.deb"
	egz "${srcdir}/hsakmt-roct-dev_20231016.2.245.60002-115~22.04_amd64.deb"
	egz "${srcdir}/hsa-rocr_1.12.0.60002-115~22.04_amd64.deb"
	egz "${srcdir}/hsa-rocr-dev_1.12.0.60002-115~22.04_amd64.deb"
	egz "${srcdir}/rocminfo_1.0.0.60002-115~22.04_amd64.deb"
	egz "${srcdir}/hip-runtime-amd_6.0.32831.60002-115~22.04_amd64.deb"
	egz "${srcdir}/rocm-device-libs_1.0.0.60002-115~22.04_amd64.deb"
	egz "${srcdir}/rocm-language-runtime_6.0.2.60002-115~22.04_amd64.deb"
	egz "${srcdir}/rocm-hip-runtime_6.0.2.60002-115~22.04_amd64.deb"
	egz "${srcdir}/rocm-ocl-icd_2.0.0.60002-115~22.04_amd64.deb"
	egz "${srcdir}/rocm-opencl_2.0.0.60002-115~22.04_amd64.deb"
	egz "${srcdir}/rocm-opencl-dev_2.0.0.60002-115~22.04_amd64.deb"
	egz "${srcdir}/rocm-opencl-runtime_6.0.2.60002-115~22.04_amd64.deb"
	exz "${srcdir}/rocm-clang-ocl_0.5.0.60002-115~22.04_amd64.deb"
	egz "${srcdir}/rocm-smi-lib_6.0.0.60002-115~22.04_amd64.deb"
	exz "${srcdir}/rocm-cmake_0.11.0.60002-115~22.04_amd64.deb"
	egz "${srcdir}/rocm-dbgapi_0.71.0.60002-115~22.04_amd64.deb"
	egz "${srcdir}/rocm-debug-agent_2.0.3.60002-115~22.04_amd64.deb"
	egz "${srcdir}/rocm-utils_6.0.2.60002-115~22.04_amd64.deb"
	egz "${srcdir}/rocprofiler_2.0.60002.60002-115~22.04_amd64.deb"
	egz "${srcdir}/rocprofiler-dev_2.0.60002.60002-115~22.04_amd64.deb"
	egz "${srcdir}/rocprofiler-plugins_2.0.60002.60002-115~22.04_amd64.deb"
	egz "${srcdir}/roctracer_4.1.60002.60002-115~22.04_amd64.deb"
	egz "${srcdir}/roctracer-dev_4.1.60002.60002-115~22.04_amd64.deb"
	egz "${srcdir}/rocm-dev_6.0.2.60002-115~22.04_amd64.deb"
	egz "${srcdir}/hsa-amd-aqlprofile_1.0.0.60002.60002-115~22.04_amd64.deb"
	exz "${srcdir}/libdrm-amdgpu-amdgpu1_2.4.116.60002-1718217.22.04_amd64.deb"
	egz "${srcdir}/openmp-extras-runtime_17.60.0.60002-115~22.04_amd64.deb"
	egz "${srcdir}/rocm-gdb_13.2.60002-115~22.04_amd64.deb"
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
	ln -s "/opt/rocm-6.0.2" "$pkgdir/opt/rocm"
	#ln -s "/opt/rocm-6.0.2/hip/bin/.hipVersion" "$pkgdir/opt/rocm-6.0.2/bin/.hipVersion"

	mkdir -p "${pkgdir}/opt/amdgpu/share/libdrm"
	cd "${pkgdir}/opt/amdgpu/share/libdrm"
	ln -s /usr/share/libdrm/amdgpu.ids amdgpu.ids		

	mkdir -p ${pkgdir}/etc/OpenCL/vendors	
	echo libamdocl64.so > "${pkgdir}/etc/OpenCL/vendors/amdocl64.icd"
	echo libamdocl-orca64.so > "${pkgdir}/etc/OpenCL/vendors/amdocl-orca64.icd"

	mkdir -p ${pkgdir}/etc/ld.so.conf.d
	echo /opt/rocm-6.0.2/opencl/lib > "$pkgdir/etc/ld.so.conf.d/opencl-amd.conf"
	echo /opt/rocm-6.0.2/lib >> "$pkgdir/etc/ld.so.conf.d/opencl-amd.conf"
	echo /opt/rocm-6.0.2/hip/lib >> "$pkgdir/etc/ld.so.conf.d/opencl-amd.conf"

	mkdir -p ${pkgdir}/etc/profile.d
	echo export PATH="\${PATH}:/opt/rocm-6.0.2/bin:/opt/rocm-6.0.2/hip/bin" > "$pkgdir/etc/profile.d/opencl-amd.sh"
}
