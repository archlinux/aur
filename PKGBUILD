# Maintainer: Carson Rueter <roachh at proton mail dot com>
# Co-Maintainer: George Sofianos

# Release notes https://docs.amd.com/bundle/ROCm-Release-Notes-v5.5/page/About_This_Document.html
amdgpu_repo='https://repo.radeon.com/amdgpu/5.5/ubuntu'
rocm_repo='https://repo.radeon.com/rocm/apt/5.5'
opencl_lib='opt/rocm-5.5.0/opencl/lib'
rocm_lib='opt/rocm-5.5.0/lib'
hip_lib='opt/rocm-5.5.0/hip/lib/'
amdgpu="opt/amdgpu/lib/x86_64-linux-gnu"
amdgpu_pro="opt/amdgpu-pro/lib/x86_64-linux-gnu/"

pkgname=opencl-amd
pkgdesc="ROCr OpenCL stack, supports Vega 10 and later products - Legacy OpenCL stack (Proprietary), supports legacy products older than Vega 10 - This package is intended to work along with the free amdgpu stack."            
pkgver=5.5.0
pkgrel=1
epoch=1
arch=('x86_64')
url='http://www.amd.com'
license=('custom:AMD')
makedepends=('wget')
depends=('libdrm' 'ocl-icd' 'gcc-libs' 'numactl')
provides=('opencl-driver' 'rocm-core' 'hip' 'hip-dev' 'hip-doc' 'hip-samples' 'hsakmt-roct-dev' 'hsa-rocr' 'hsa-rocr-dev' 'rocminfo' 'hip-runtime-amd' 'rocm-device-libs' 'rocm-language-runtime' 
	'rocm-hip-runtime' 'rocm-ocl-icd' 'rocm-opencl' 'rocm-opencl-dev' 'rocm-opencl-runtime' 'rocm-clang-ocl' 'rocprofiler' 'roctracer' 'hsa-amd-aqlprofile' 'openmp-extras-runtime' 'rocm-cmake' 'rocm-utils' 'rocm-smi-lib')
conflicts=('rocm-opencl-runtime' 'rocm-core' 'hip' 'hip-dev' 'hip-doc' 'hip-samples' 'hsakmt-roct-dev' 'hsa-rocr' 'hsa-rocr-dev' 'rocminfo' 'hip-runtime-amd' 'rocm-device-libs' 'rocm-language-runtime' 
	'rocm-hip-runtime' 'rocm-ocl-icd' 'rocm-opencl' 'rocm-opencl-dev' 'rocm-opencl-runtime' 'rocm-clang-ocl' 'rocprofiler' 'roctracer' 'hsa-amd-aqlprofile' 'openmp-extras-runtime' 'rocm-cmake' 'rocm-utils' 'rocm-smi-lib')
optdepends=('clinfo' 'opencl-amd-dev')

source=(
# LIBDRM
"https://repo.radeon.com/amdgpu/5.5/ubuntu/pool/main/libd/libdrm-amdgpu/libdrm-amdgpu-amdgpu1_2.4.114.50500-1581431.22.04_amd64.deb"
# ROCM
"https://repo.radeon.com/rocm/apt/5.5/pool/main/r/rocm-core/rocm-core_5.5.0.50500-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.5/pool/main/c/comgr/comgr_2.5.0.50500-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.5/pool/main/h/hip-dev/hip-dev_5.5.30201.50500-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.5/pool/main/h/hip-doc/hip-doc_5.5.30201.50500-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.5/pool/main/h/hip-samples/hip-samples_5.5.30201.50500-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.5/pool/main/h/hsakmt-roct-dev/hsakmt-roct-dev_20230131.1.695.50500-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.5/pool/main/h/hsa-rocr/hsa-rocr_1.8.0.50500-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.5/pool/main/h/hsa-rocr-dev/hsa-rocr-dev_1.8.0.50500-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.5/pool/main/r/rocminfo/rocminfo_1.0.0.50500-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.5/pool/main/h/hip-runtime-amd/hip-runtime-amd_5.5.30201.50500-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.5/pool/main/r/rocm-device-libs/rocm-device-libs_1.0.0.50500-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.5/pool/main/r/rocm-language-runtime/rocm-language-runtime_5.5.0.50500-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.5/pool/main/r/rocm-hip-runtime/rocm-hip-runtime_5.5.0.50500-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.5/pool/main/r/rocm-ocl-icd/rocm-ocl-icd_2.0.0.50500-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.5/pool/main/r/rocm-opencl/rocm-opencl_2.0.0.50500-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.5/pool/main/r/rocm-opencl-dev/rocm-opencl-dev_2.0.0.50500-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.5/pool/main/r/rocm-opencl-runtime/rocm-opencl-runtime_5.5.0.50500-63~22.04_amd64.deb"
# ROCM DEV
"https://repo.radeon.com/rocm/apt/5.5/pool/main/r/rocm-clang-ocl/rocm-clang-ocl_0.5.0.50500-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.5/pool/main/o/openmp-extras-runtime/openmp-extras-runtime_15.55.0.50500-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.5/pool/main/r/rocm-smi-lib/rocm-smi-lib_5.0.0.50500-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.5/pool/main/r/rocm-cmake/rocm-cmake_0.8.1.50500-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.5/pool/main/r/rocm-dbgapi/rocm-dbgapi_0.70.0.50500-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.5/pool/main/r/rocm-debug-agent/rocm-debug-agent_2.0.3.50500-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.5/pool/main/r/rocm-gdb/rocm-gdb_12.1.50500-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.5/pool/main/r/rocm-utils/rocm-utils_5.5.0.50500-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.5/pool/main/r/rocprofiler-dev/rocprofiler-dev_2.0.0.50500-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.5/pool/main/r/roctracer-dev/roctracer-dev_4.1.0.50500-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.5/pool/main/r/rocm-dev/rocm-dev_5.5.0.50500-63~22.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.5/pool/main/h/hsa-amd-aqlprofile/hsa-amd-aqlprofile_1.0.0.50500-63~22.04_amd64.deb"
# Proprietary
#"https://repo.radeon.com/amdgpu/5.5/ubuntu/pool/proprietary/o/opencl-legacy-amdgpu-pro/opencl-legacy-amdgpu-pro-icd_22.40-1538781.22.04_amd64.deb"
#"https://repo.radeon.com/amdgpu/22.20.3/ubuntu/pool/proprietary/c/clinfo-amdgpu-pro/clinfo-amdgpu-pro_22.10-1462318~22.04_amd64.deb"
#"https://repo.radeon.com/amdgpu/22.20.3/ubuntu/pool/proprietary/o/ocl-icd-amdgpu-pro/ocl-icd-libopencl1-amdgpu-pro_22.10-1462318~22.04_amd64.deb"
#"https://repo.radeon.com/amdgpu/22.20.3/ubuntu/pool/proprietary/a/amf-amdgpu-pro/amf-amdgpu-pro_1.4.24-1462318~22.04_amd64.deb"
)

sha256sums=(
"d48655055ae5c3363abadd7e5ad401f4beb2341b9971821d8aecc7d9d24fb278"

"6d90ad7a1ad652ad093c2c6aa25f042c47920ea53175b9bc9b872ad3151f7f71"
"dd12a00973f8c64f145de87424f0d0fda6024a9572447f339a87565f77fe9d21"
"922c7b58fa3eb27a0aabb9226cc789a2563147ac8eef38885b70a7c451f0d1a5"
"6d90fbf794908a74eb57c00fb62f4bcf3dd591626c9170f172c1bc168933e919"
"b155a5cb2fc8108cae6f9c56d0e18b4165da9504c25fe78ce7b0984fb9cb8e44"
"6f92bb96b248cfef36c9a04e71e962d780dad5f8035ff30d9e79cbf642a0e963"
"12a20b7463db2c2c99d407683f7636315f7a5f6b00b94bd01fe7c37b99031c1c"
"c6b7398c9e7b2914d70f46f60e953117808c7d1c83bcfa22f227a086b728a558"
"c7579f64a37f0ee8b55448abb3e1e420d95c5999492a92ed7768318a192a3621"
"68b27bbeed698f37019b49736f9c952f24425226b68fd25ed83baed815806a8a"
"838ed0d05ab98d598b483cde77eaa9de65550494011874f3ea130cf89d842e08"
"50384bd13b290c0c4fdbba3bbbb79a46790a3afeb8739332fed70110c0130b0e"
"beb1954c05f700978484074078de01475bad2caa25a05b3820efd5b17fa54634"
"dec946abe29bf610ede8bb7be5a467f7bb8f3a2906822b3daa900073c192d79f"
"a328448931cf4200bcddaec08d5ffc5482e58c5b9192450a5855fbce5b159e7d"
"9d1fc6a7961f6ec60047d31ba4f6a4823d4d5318ff0fbee3f154f09f15dc2597"
"67f466ead2b2a27158a2139f64e402b04dd9c9a810bbb4110cd17528954d1f36"

"e6dc8411facf232ee57df1be335c985acb1c423b56cb8e0166d278641c697518"
"cc4f54a67dba6e67bfe803a99965b65a081ea980f8d4c0792c070347ea76fa7a"
"3037238b704c985d31c0845a2e338a7e5eea238b8af1792fe079f450004a5b69"
"604478ba246c616d6f76dac84ca104195896e65e081aa251775e103a78a7b57b"
"692c21dea08d5c3f5e14a9df16551c705ba44a937232767e4660e8e84bd5c3f4"
"9fadbae8d064c2b84f27dd7901883b239a3b069d619e5e0e4309d5a3083fda60"
"c2f16e0ae984b163120735adc5fdbcc87ea5bb75841b9bd55301c4251fbb5f56"
"7a8f7f15c229781f7e2e3bab82d02f35734ba14dda27884e47847037275a252f"
"78f206c6a45661b01b17cce7421c9a8b90041381494732109838ed09f132c6bf"
"8a7056f04b50d04e15e9772e5b461b61d7fe295953479db580d5748a4e6dfe85"
"29118da7cd336a99bcacb190352161e1195d6c85e748af9753a77751156a761e"
"53a4d8a33b363bf70ef383b6e3d54fe2682cf5bc85a8a19990398b6f664fc500"
# Proprietary
#"ecd6fc900fe8d8b1c57e57c6e141230d9ea0584fe9a41234595c1eff850bfd14"
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
	egz "${srcdir}/rocm-core_5.5.0.50500-63~22.04_amd64.deb"
	egz "${srcdir}/comgr_2.5.0.50500-63~22.04_amd64.deb"
	egz "${srcdir}/hip-dev_5.5.30201.50500-63~22.04_amd64.deb"
	egz "${srcdir}/hip-doc_5.5.30201.50500-63~22.04_amd64.deb"
	egz "${srcdir}/hip-samples_5.5.30201.50500-63~22.04_amd64.deb"
	egz "${srcdir}/hsakmt-roct-dev_20230131.1.695.50500-63~22.04_amd64.deb"
	egz "${srcdir}/hsa-rocr_1.8.0.50500-63~22.04_amd64.deb"
	egz "${srcdir}/hsa-rocr-dev_1.8.0.50500-63~22.04_amd64.deb"
	egz "${srcdir}/rocminfo_1.0.0.50500-63~22.04_amd64.deb"
	egz "${srcdir}/hip-runtime-amd_5.5.30201.50500-63~22.04_amd64.deb"
	egz "${srcdir}/rocm-device-libs_1.0.0.50500-63~22.04_amd64.deb"
	egz "${srcdir}/rocm-language-runtime_5.5.0.50500-63~22.04_amd64.deb"
	egz "${srcdir}/rocm-hip-runtime_5.5.0.50500-63~22.04_amd64.deb"
	egz "${srcdir}/rocm-ocl-icd_2.0.0.50500-63~22.04_amd64.deb"
	egz "${srcdir}/rocm-opencl_2.0.0.50500-63~22.04_amd64.deb"
	egz "${srcdir}/rocm-opencl-dev_2.0.0.50500-63~22.04_amd64.deb"
	egz "${srcdir}/rocm-opencl-runtime_5.5.0.50500-63~22.04_amd64.deb"
	exz "${srcdir}/rocm-clang-ocl_0.5.0.50500-63~22.04_amd64.deb"
	egz "${srcdir}/rocm-smi-lib_5.0.0.50500-63~22.04_amd64.deb"
	exz "${srcdir}/rocm-cmake_0.8.1.50500-63~22.04_amd64.deb"
	egz "${srcdir}/rocm-dbgapi_0.70.0.50500-63~22.04_amd64.deb"
	egz "${srcdir}/rocm-debug-agent_2.0.3.50500-63~22.04_amd64.deb"
	egz "${srcdir}/rocm-utils_5.5.0.50500-63~22.04_amd64.deb"
	egz "${srcdir}/rocprofiler-dev_2.0.0.50500-63~22.04_amd64.deb"
	egz "${srcdir}/roctracer-dev_4.1.0.50500-63~22.04_amd64.deb"
	egz "${srcdir}/rocm-dev_5.5.0.50500-63~22.04_amd64.deb"
	egz "${srcdir}/hsa-amd-aqlprofile_1.0.0.50500-63~22.04_amd64.deb"
	exz "${srcdir}/libdrm-amdgpu-amdgpu1_2.4.114.50500-1581431.22.04_amd64.deb"
	egz "${srcdir}/openmp-extras-runtime_15.55.0.50500-63~22.04_amd64.deb"
	egz "${srcdir}/rocm-gdb_12.1.50500-63~22.04_amd64.deb"
	#exz "${srcdir}/opencl-legacy-amdgpu-pro-icd_22.40-1538781.22.04_amd64.deb"

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
	ln -s "/opt/rocm-5.5.0" "$pkgdir/opt/rocm"
	#ln -s "/opt/rocm-5.5.0/hip/bin/.hipVersion" "$pkgdir/opt/rocm-5.5.0/bin/.hipVersion"

	mkdir -p "${pkgdir}/opt/amdgpu/share/libdrm"
	cd "${pkgdir}/opt/amdgpu/share/libdrm"
	ln -s /usr/share/libdrm/amdgpu.ids amdgpu.ids		

	mkdir -p ${pkgdir}/etc/OpenCL/vendors	
	echo libamdocl64.so > "${pkgdir}/etc/OpenCL/vendors/amdocl64.icd"
	echo libamdocl-orca64.so > "${pkgdir}/etc/OpenCL/vendors/amdocl-orca64.icd"

	mkdir -p ${pkgdir}/etc/ld.so.conf.d
	echo /opt/rocm-5.5.0/opencl/lib > "$pkgdir/etc/ld.so.conf.d/opencl-amd.conf"
	echo /opt/rocm-5.5.0/lib >> "$pkgdir/etc/ld.so.conf.d/opencl-amd.conf"
	echo /opt/rocm-5.5.0/hip/lib >> "$pkgdir/etc/ld.so.conf.d/opencl-amd.conf"

	mkdir -p ${pkgdir}/etc/profile.d
	echo export PATH="\${PATH}:/opt/rocm-5.5.0/bin:/opt/rocm-5.5.0/hip/bin" > "$pkgdir/etc/profile.d/opencl-amd.sh"
}
