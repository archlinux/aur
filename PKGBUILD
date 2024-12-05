# Maintainer: Carson Rueter <roachh at proton mail dot com>
# Co-Maintainer: George Sofianos

# Release notes https://rocm.docs.amd.com/en/latest/about/release-notes.html
_amdgpu_repo='https://repo.radeon.com/amdgpu/6.3/ubuntu'
_rocm_repo='https://repo.radeon.com/rocm/apt/6.3'
_opencl_lib='opt/rocm-6.3.0/opencl/lib'
_rocm_lib='opt/rocm-6.3.0/lib'
_hip_lib='opt/rocm-6.3.0/hip/lib/'
_amdgpu="opt/amdgpu/lib/x86_64-linux-gnu"
_amdgpu_pro="opt/amdgpu-pro/lib/x86_64-linux-gnu/"

pkgname=opencl-amd
pkgdesc="ROCm components repackaged from AMD's Ubuntu releases (ROCr runtime, ROCm runtime, HIP runtime) - This package is intended to work along with the free amdgpu stack."
pkgver=6.3.0
pkgrel=1
epoch=1
arch=('x86_64')
url='http://www.amd.com'
license=('custom:AMD')
makedepends=('wget')
depends=('libdrm' 'ocl-icd' 'gcc-libs' 'numactl')
provides=('opencl-driver' 'libdrm-amdgpu-amdgpu1' 'rocm-core' 'comgr' 'hip' 'hipcc' 'hip-dev' 'hip-doc' 'hip-samples' 'hsa-rocr' 'hsa-rocr-dev' 'rocminfo' 'hip-runtime-amd' 'rocm-device-libs' 'rocm-language-runtime' 
	'rocm-hip-runtime' 'rocdecode' 'rocdecode-dev' 'rocm-ocl-icd' 'rocm-opencl-icd-loader' 'rocm-opencl' 'rocm-opencl-dev' 'rocm-opencl-runtime' 'rocm-dbgapi' 'rocm-debug-agent' 'rocm-gdb' 'rocprofiler' 'rocprofiler-dev' 'rocprofiler-plugins'
	'rocprofiler-register' 'roctracer' 'roctracer-dev' 'hsa-amd-aqlprofile' 'openmp-extras-runtime' 'rocm-cmake' 'rocm-utils' 'rocm-smi-lib' 'amd-smi-lib')
conflicts=('rocm-opencl-runtime' 'libdrm-amdgpu-amdgpu1' 'rocm-core' 'comgr' 'hip' 'hipcc' 'hip-dev' 'hip-doc' 'hip-samples' 'hsa-rocr' 'hsa-rocr-dev' 'rocminfo' 'hip-runtime-amd' 'rocm-device-libs' 'rocm-language-runtime' 
	'rocm-hip-runtime' 'rocdecode' 'rocdecode-dev' 'rocm-ocl-icd' 'rocm-opencl-icd-loader' 'rocm-opencl' 'rocm-opencl-dev' 'rocm-opencl-runtime' 'rocm-dbgapi' 'rocm-debug-agent' 'rocm-gdb' 'rocprofiler' 'rocprofiler-dev' 'rocprofiler-plugins'
	'rocprofiler-register' 'roctracer' 'roctracer-dev' 'hsa-amd-aqlprofile' 'openmp-extras-runtime' 'rocm-cmake' 'rocm-utils' 'rocm-smi-lib' 'amd-smi-lib')
optdepends=('clinfo' 'opencl-amd-dev')

source=(
# LIBDRM
"https://repo.radeon.com/amdgpu/6.3/ubuntu/pool/main/libd/libdrm-amdgpu/libdrm-amdgpu-amdgpu1_2.4.123.60300-2084815.24.04_amd64.deb"
# ROCM
"https://repo.radeon.com/rocm/apt/6.3/pool/main/r/rocm-core/rocm-core_6.3.0.60300-39~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3/pool/main/c/comgr/comgr_2.8.0.60300-39~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3/pool/main/h/hipcc/hipcc_1.1.1.60300-39~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3/pool/main/h/hip-dev/hip-dev_6.3.42131.60300-39~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3/pool/main/h/hip-doc/hip-doc_6.3.42131.60300-39~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3/pool/main/h/hip-samples/hip-samples_6.3.42131.60300-39~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3/pool/main/h/hsa-rocr/hsa-rocr_1.14.0.60300-39~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3/pool/main/h/hsa-rocr-dev/hsa-rocr-dev_1.14.0.60300-39~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3/pool/main/r/rocminfo/rocminfo_1.0.0.60300-39~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3/pool/main/h/hip-runtime-amd/hip-runtime-amd_6.3.42131.60300-39~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3/pool/main/r/rocm-device-libs/rocm-device-libs_1.0.0.60300-39~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3/pool/main/r/rocm-language-runtime/rocm-language-runtime_6.3.0.60300-39~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3/pool/main/r/rocm-hip-runtime/rocm-hip-runtime_6.3.0.60300-39~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3/pool/main/r/rocdecode/rocdecode_0.8.0.60300-39~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3/pool/main/r/rocdecode-dev/rocdecode-dev_0.8.0.60300-39~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3/pool/main/r/rocjpeg/rocjpeg_0.6.0.60300-39~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3/pool/main/r/rocjpeg-dev/rocjpeg-dev_0.6.0.60300-39~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3/pool/main/r/rocm-opencl/rocm-opencl_2.0.0.60300-39~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3/pool/main/r/rocm-opencl-dev/rocm-opencl-dev_2.0.0.60300-39~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3/pool/main/r/rocm-opencl-runtime/rocm-opencl-runtime_6.3.0.60300-39~24.04_amd64.deb"
# ROCM DEV
"https://repo.radeon.com/rocm/apt/6.3/pool/main/o/openmp-extras-runtime/openmp-extras-runtime_18.63.0.60300-39~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3/pool/main/r/rocm-smi-lib/rocm-smi-lib_7.4.0.60300-39~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3/pool/main/a/amd-smi-lib/amd-smi-lib_24.7.1.60300-39~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3/pool/main/r/rocm-cmake/rocm-cmake_0.14.0.60300-39~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3/pool/main/r/rocm-dbgapi/rocm-dbgapi_0.77.0.60300-39~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3/pool/main/r/rocm-debug-agent/rocm-debug-agent_2.0.3.60300-39~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3/pool/main/r/rocm-gdb/rocm-gdb_15.2.60300-39~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3/pool/main/r/rocm-utils/rocm-utils_6.3.0.60300-39~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3/pool/main/r/rocprofiler/rocprofiler_2.0.60300.60300-39~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3/pool/main/r/rocprofiler-dev/rocprofiler-dev_2.0.60300.60300-39~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3/pool/main/r/rocprofiler-plugins/rocprofiler-plugins_2.0.60300.60300-39~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3/pool/main/r/rocprofiler-register/rocprofiler-register_0.4.0.60300-39~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3/pool/main/r/roctracer/roctracer_4.1.60300.60300-39~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3/pool/main/r/roctracer-dev/roctracer-dev_4.1.60300.60300-39~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3/pool/main/r/rocm-dev/rocm-dev_6.3.0.60300-39~24.04_amd64.deb"
"https://repo.radeon.com/rocm/apt/6.3/pool/main/h/hsa-amd-aqlprofile/hsa-amd-aqlprofile_1.0.0.60300-39~24.04_amd64.deb"
# Proprietary
"https://repo.radeon.com/amdgpu/5.7.1/ubuntu/pool/proprietary/o/opencl-legacy-amdgpu-pro/opencl-legacy-amdgpu-pro-icd_23.20-1664987.22.04_amd64.deb"
)

sha256sums=(
"6ab559e7d240c7f1294b886711f4c209e1bec0d38dc4e0d3f64bd6f41844d943"

"6457e61f4df6792f68b1d1b6de6f06e95a6c21a742cf0aebbc9a12f1dfbb9daa"
"f8e46cde99e0fa34eb9c1ba992e6df74bbb3a5b5f14ed2792757cd19f561140f"
"9c7d1795dfc1d74fa3bcd23a051c847b1849fda7a4fcc018bc08ca50a4236165"
"6a21f31932de4d4888c2c3c4d2165ebaea9c25f92d182f836246124645b17fc1"
"0aa1583965336713502e7bd2786389225e04ea8dfa0d5ba1790061fb61324071"
"b4843c18284eaea9213a9261c2818a03dc2a6e7418f0c4846ba4662c60d7984a"
"756581e709988c2bcd80506477833c70bfa1314ebe2652d7c877009e4df9a5a0"
"b05549663b4f91a42976af2f9a9a0c44498ff48e91a40f077b50ef4df347734a"
"2935834b6daf06c6a58bac506e2397301c281d38178a687186d1b23dfd8b1d7c"
"6c1fd61a084d42f3258a98f9cc593260e1b7f12e4c1176b130e2926f8a9eec24"
"994ff9f62b8224cdd880e695fe8cabcd7804493630cd700dcc74171aebf10492"
"91186b3af56ef4ea906a6745c6c02f3600e0fc5cfa3d7ce15e7c766f65356470"
"cfa8584d02a3b405ff1a45125cfd54628a965be820ca82d5b4b19600d9175c7b"
"0fcabfc79d094e5facd5fd932e76c8300b9f5c63fb1abf1f9e12418b7577052a"
"cd3a2c32dc6529c96e7313baf363a339a364c7f010fa22ca1be60cd7eff51cc9"
"f0fe7c93b6674db99bcee84c7950426ca4fdd619f45b9125c147fd000417283a"
"d4baba2293cb994583a1f0d3618a0cdf34cec067a1d32c7704d5ee0520421627"
"2880e68f9167e9fb302781024f2e6389af89ae7b28d40a8c0095dea052537316"
"a275b68fdf3109d9865fa8d66f6285f04a445567667792ccdb057d735ce1850b"
"54f4e4d09ef59582507eaa2bcb5f78e4dbed69dc507c418e0183029f8171606a"
# ROCM DEV
"653cdb375fe3d5fb6e38cb4f5f1652a116d350b8eb664ccae2a79ba5a5e7e1b7"
"97c0d2bdcf661c2a6352179f3264ed1ee5dcb497bba6be917f71fa5a3c91e300"
"e93442cbadea189530f5106bbe8223d52255282a5cf03c52e3ad1001ef42616b"
"1a0a2069ac6422ffd22be3a2206ab1a0b059317c6fdb972adf78f46bb54fd3fa"
"cb3334be0a0d7124b74028c5f11623f3f3eacb5aabccfecc3828a187208248eb"
"d942db95f518c3fa7fac9cbc994f4fe05909df70294589c6d2f86bea381b923c"
"38a2fc38b2d156422a5d91098c39ae27d54ffe302008a41db1a43c307e2d1040"
"b0ec11a3f85fbd769fea67f6260ef17f264fddeae206eb15bd95d0db69600bf6"
"1c9721c44fe33fe7b5e57fd4133d062e709afe6e46cd48c6ff2dafec7b83aa18"
"1aea28d9e4bea03eaccd4459588159b7406d2448a09b34e861fbebcae3b107b3"
"37be28d16bcecaf7d896cffe06889a71d5fa1bfadad248bbd6af277aff99886c"
"e5735af00ac978f9d1ec2015390bdac455f0a263937d1d31f834429db5cfded2"
"09ce4da442cfba19f2253da486a762bd9f90e59c354c179bdf00b44e811c58fe"
"5b386b3026036c999666479e6f76f5e22a0512c1528eecb0164c4d023f215a5c"
"efa8af04a6f44e8368fc76cfb5bb7a7fa21d9272aca593bfa00d0e4884a1bf09"
"32478625298a9ef0802e1e5ce0cf2470f04d6166be91cb80be22e1169dafe224"
# Proprietary
"194bf41a21b40f8305f532818a5d2491dca0f6f0750b3d2b538c54f57dbb2dfd"
)

package() {
	for p in *.deb; do
		ar x "${p}"
		if [[ -f data.tar.gz ]]; then
			# echo gz: "${srcdir}/${p}"
			tar xfx data.tar.gz
			rm data.tar.gz
		elif [[ -f data.tar.xz ]]; then
			# echo xz: "${srcdir}/${p}"
			tar xJf data.tar.xz
			rm data.tar.xz
		fi
	done

	cd "${srcdir}/${_amdgpu_pro}"
	sed -i "s|libdrm_amdgpu|libdrm_amdgpo|g" libamdocl-orca64.so

	cd "${srcdir}/${_amdgpu}"
	rm "libdrm_amdgpu.so.1"
	mv "libdrm_amdgpu.so.1.123.0" "libdrm_amdgpo.so.1.0.0"
	ln -s "libdrm_amdgpo.so.1.0.0" "libdrm_amdgpo.so.1"	

	# legacy
	mkdir -p "${pkgdir}/usr/lib"
	mv "${srcdir}/${_amdgpu_pro}/libamdocl-orca64.so" "${pkgdir}/usr/lib/"
	mv "${srcdir}/${_amdgpu}/libdrm_amdgpo.so.1.0.0" "${pkgdir}/usr/lib/"
	mv "${srcdir}/${_amdgpu}/libdrm_amdgpo.so.1" "${pkgdir}/usr/lib/"

	mv "${srcdir}/opt/" "${pkgdir}/"
	ln -s "/opt/rocm-6.3.0" "$pkgdir/opt/rocm"
	#ln -s "/opt/rocm-6.3.0/hip/bin/.hipVersion" "$pkgdir/opt/rocm-6.3.0/bin/.hipVersion"

	mkdir -p "${pkgdir}/opt/amdgpu/share/libdrm"
	cd "${pkgdir}/opt/amdgpu/share/libdrm"
	ln -s /usr/share/libdrm/amdgpu.ids amdgpu.ids		

	mkdir -p "${pkgdir}/etc/OpenCL/vendors"
	echo libamdocl64.so > "${pkgdir}/etc/OpenCL/vendors/amdocl64.icd"
	echo libamdocl-orca64.so > "${pkgdir}/etc/OpenCL/vendors/amdocl-orca64.icd"

	mkdir -p "${pkgdir}/etc/ld.so.conf.d"
	# echo /opt/rocm-6.3.0/opencl/lib > "$pkgdir/etc/ld.so.conf.d/opencl-amd.conf"
	echo /opt/rocm-6.3.0/lib >> "$pkgdir/etc/ld.so.conf.d/opencl-amd.conf"
	echo /opt/rocm-6.3.0/hip/lib >> "$pkgdir/etc/ld.so.conf.d/opencl-amd.conf"

	mkdir -p "${pkgdir}/etc/profile.d"
	echo export PATH="\${PATH}:/opt/rocm-6.3.0/bin:/opt/rocm-6.3.0/hip/bin" > "$pkgdir/etc/profile.d/opencl-amd.sh"
}
