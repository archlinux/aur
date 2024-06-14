# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Maintainer: Torsten Keßler <tpkessler@archlinux.org>
# Contributor: Stephen Zhang <zsrkmyn at gmail dot com>

_pkgname=pytorch
pkgbase="python-${_pkgname}"
pkgname=("${pkgbase}" "${pkgbase}-opt" "${pkgbase}-cuda" "${pkgbase}-opt-cuda" "${pkgbase}-rocm" "${pkgbase}-opt-rocm")
# When updating pytorch, also check the compatibility table for torchvision
# https://github.com/pytorch/vision?tab=readme-ov-file#installation
pkgver=2.3.1
_pkgver=2.3.1
pkgrel=1
_pkgdesc='Tensors and Dynamic neural networks in Python with strong GPU acceleration'
pkgdesc="${_pkgdesc}"
arch=('x86_64')
url="https://pytorch.org"
license=('BSD')
depends=('google-glog' 'gflags' 'opencv' 'openmp' 'openmpi' 'pybind11' 'python' 'python-yaml' 'libuv'
         'python-numpy' 'python-sympy' 'protobuf' 'ffmpeg' 'python-future' 'qt6-base' 'eigen'
         'intel-oneapi-mkl' 'python-typing_extensions' 'numactl' 'python-jinja'
         'python-networkx' 'python-filelock')
makedepends=('python' 'python-setuptools' 'python-yaml' 'python-numpy' 'cmake' 'cuda' 'gcc13'
             'nccl' 'cudnn' 'git' 'rocm-hip-sdk' 'hipblaslt' 'roctracer' 'miopen' 'magma-cuda' 'magma-hip'
             'ninja' 'pkgconfig' 'doxygen' 'vulkan-headers' 'shaderc' 'onednn')
source=("${_pkgname}::git+https://github.com/pytorch/pytorch.git#tag=v$_pkgver"
        # generated using parse-submodules
        "${pkgname}-ARM_NEON_2_x86_SSE::git+https://github.com/intel/ARM_NEON_2_x86_SSE.git"
        "${pkgname}-FP16::git+https://github.com/Maratyszcza/FP16.git"
        "${pkgname}-FXdiv::git+https://github.com/Maratyszcza/FXdiv.git"
        "${pkgname}-NNPACK::git+https://github.com/Maratyszcza/NNPACK.git"
        "${pkgname}-PeachPy::git+https://github.com/malfet/PeachPy.git"
        "${pkgname}-QNNPACK::git+https://github.com/pytorch/QNNPACK"
        "${pkgname}-VulkanMemoryAllocator::git+https://github.com/GPUOpen-LibrariesAndSDKs/VulkanMemoryAllocator.git"
        "${pkgname}-XNNPACK::git+https://github.com/google/XNNPACK.git"
        "${pkgname}-benchmark::git+https://github.com/google/benchmark.git"
        "${pkgname}-cpuinfo::git+https://github.com/pytorch/cpuinfo.git"
        "${pkgname}-cub::git+https://github.com/NVlabs/cub.git"
        "${pkgname}-cudnn-frontend::git+https://github.com/NVIDIA/cudnn-frontend.git"
        "${pkgname}-cutlass::git+https://github.com/NVIDIA/cutlass.git"
        "${pkgname}-eigen::git+https://gitlab.com/libeigen/eigen.git"
        "${pkgname}-fbgemm::git+https://github.com/pytorch/fbgemm"
        "${pkgname}-fbjni::git+https://github.com/facebookincubator/fbjni.git"
        "${pkgname}-flatbuffers::git+https://github.com/google/flatbuffers.git"
        "${pkgname}-fmt::git+https://github.com/fmtlib/fmt.git"
        "${pkgname}-foxi::git+https://github.com/houseroad/foxi.git"
        "${pkgname}-gemmlowp::git+https://github.com/google/gemmlowp.git"
        "${pkgname}-gloo::git+https://github.com/facebookincubator/gloo"
        "${pkgname}-googletest::git+https://github.com/google/googletest.git"
        "${pkgname}-ideep::git+https://github.com/intel/ideep"
        "${pkgname}-ios-cmake::git+https://github.com/Yangqing/ios-cmake.git"
        "${pkgname}-ittapi::git+https://github.com/intel/ittapi.git"
        "${pkgname}-json::git+https://github.com/nlohmann/json.git"
        "${pkgname}-kineto::git+https://github.com/pytorch/kineto"
        "${pkgname}-mimalloc::git+https://github.com/microsoft/mimalloc.git"
        "${pkgname}-nccl::git+https://github.com/NVIDIA/nccl"
        "${pkgname}-onnx-tensorrt::git+https://github.com/onnx/onnx-tensorrt"
        "${pkgname}-onnx::git+https://github.com/onnx/onnx.git"
        "${pkgname}-opentelemetry-cpp::git+https://github.com/open-telemetry/opentelemetry-cpp.git"
        "${pkgname}-pocketfft::git+https://github.com/mreineck/pocketfft"
        "${pkgname}-protobuf::git+https://github.com/protocolbuffers/protobuf.git"
        "${pkgname}-psimd::git+https://github.com/Maratyszcza/psimd.git"
        "${pkgname}-pthreadpool::git+https://github.com/Maratyszcza/pthreadpool.git"
        "${pkgname}-pybind11::git+https://github.com/pybind/pybind11.git"
        "${pkgname}-sleef::git+https://github.com/shibatch/sleef"
        "${pkgname}-tbb::git+https://github.com/01org/tbb"
        "${pkgname}-tensorpipe::git+https://github.com/pytorch/tensorpipe.git"
        "${pkgname}-zstd::git+https://github.com/facebook/zstd.git"
        fix_include_system.patch
        use-system-libuv.patch
        fix-building-for-torchvision.patch
        87773.patch
        123377.patch
        disable-werror1.patch
        disable-werror2.patch
        disable-werror4.patch
        rocblas-batched.patch
        protobuf-23.patch
        glog-0.7.patch
        pytorch-rocm-jit.patch
        pytorch-missing-iostream.patch
        python-pytorch-ffmpeg6.patch
        python-pytorch-aotriton-include.patch
        pytorch-remove-caffe2-binaries.patch)
b2sums=('f54764fa53423910cf8f1c6115698269aaf819641fc2b592cb10369f052fdd17a7ffec668d9a64066231d74d57d620c979eec147e8a5d96c1726bf442bb4b74f'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        '77f85808e480bd37dfb5f072d565466ae30a8f827f49ef97591fc2fc03bea54944eb1adeaa4a1e3466518a5640f575eda88d15b4c4d549a6f41f0bf4f2cfb086'
        'af8c724ed80898ae3875a295ad6bd4d18d90f8a9124f6cff6d1b2f525bf7806fe61306e739c1f7362fbd8d0e4f8ba57d0e3bf925ea3f7a78a0a98f26722db147'
        'fdea0b815d7750a4233c1d4668593020da017aea43cf4cb63b4c00d0852c7d34f0333e618fcf98b8df2185313a2089b8c2e9fe8ec3cfb0bf693598f9c61461a8'
        '0a8fc110a306e81beeb9ddfb3a1ddfd26aeda5e3f7adfb0f7c9bc3fd999c2dde62e0b407d3eca573097a53fd97329214e30e8767fb38d770197c7ec2b53daf18'
        'eccdd0cbb50c3d44a12020ad00e17ffc26723218edfebee6dbe4ec83764767a8f1144ebf7f040b7807c600d8ee36b964010f6c3d2a2a7cb7d4dbdcfab614a3c5'
        '844d0b7b39777492a6d456fa845d5399f673b4bb37b62473393449c9ad0c29dca3c33276dc3980f2e766680100335c0acfb69d51781b79575f4da112d9c4018c'
        '985e331b2025e1ca5a4fba5188af0900f1f38bd0fd32c9173deb8bed7358af01e387d4654c7e0389e5f98b6f7cbed053226934d180b8b3b1270bdbbb36fc89b2'
        'eea86bbed0a37e1661035913536456f90e0cd1e687c7e4103011f0688bc8347b6fc2ff82019909c41e7c89ddbc3b80dde641e88abf406f4faebc71b0bb693d25'
        '232d2aca7cae8da511d1451890f8696d47da72276929ac5731a1a1a481d2a515fa7288bf33730d8ea2c892616551a74ca2439b53de6b1dfee156c30919120741'
        '738199e7a11940c839a43ac4e3152d84e15b9cde638227d3d87ecb45f82c5e76630a56c49bcfb08e841f92be1b2311f2fad4fafdcc17f5b00b7a8ef6d962f250'
        '20d044c5c80354af5ed63847fa4332e96cbfc32a351788f6458fb92b322de7f64b10c188ff26e4f34e422cfe30e082c3ca23ee3e9094616c142aa53588dd451e'
        'e19fbb32da5a3bdd9d1505b2ba79ff0d765b241da819c96a380a5c871be4f5a78dcad000e01a315d936cfebb7860150f8111e60aed17cbb9337896a0831df0fe'
        '77458fa568692020ae4e437b1ebae6ebbf59f040b3414ba03e32cc829f1befb9f39dde6e0c0525e30d42dd08d482d2f213dd8294a9877476c7d0d6aabb0f08d3'
        'c17c2d2c085795861cb46974e8e251a0eb576c35a1dd2d75bcb880119bcc800c49bf6bc25c8f671c984b48787b5b919ef946352e299dc13d3ff763ae1bcc33a4'
        'f22d47070baf40ed05b1a7777102da4b0d78fd9a75618623c6061614d319f8c955c74ee5fd55e23210b84c9ef35aa2838844119f877baf646a3bafff362a698b'
        '21e9922ed1c0b555316a655067a789ef81a93b173e35446ecd2d06d976d49ad6b4a0aaa7339fd647758e821c15bec7ffda3d6e4804c8e858a888f0171cd2a9cb')
options=('!lto' '!debug')

get_pyver () {
  python -c 'import sys; print(str(sys.version_info[0]) + "." + str(sys.version_info[1]))'
}

prepare() {
  cd "${srcdir}/${_pkgname}"

  # generated using parse-submodules
  git submodule init

  git config submodule."android/libs/fbjni".url "${srcdir}/${pkgname}"-fbjni
  git config submodule."third_party/NNPACK".url "${srcdir}/${pkgname}"-NNPACK
  git config submodule."third_party/NNPACK_deps/FP16".url "${srcdir}/${pkgname}"-FP16
  git config submodule."third_party/NNPACK_deps/FXdiv".url "${srcdir}/${pkgname}"-FXdiv
  git config submodule."third_party/NNPACK_deps/psimd".url "${srcdir}/${pkgname}"-psimd
  git config submodule."third_party/NNPACK_deps/pthreadpool".url "${srcdir}/${pkgname}"-pthreadpool
  git config submodule."third_party/QNNPACK".url "${srcdir}/${pkgname}"-QNNPACK
  git config submodule."third_party/VulkanMemoryAllocator".url "${srcdir}/${pkgname}"-VulkanMemoryAllocator
  git config submodule."third_party/XNNPACK".url "${srcdir}/${pkgname}"-XNNPACK
  git config submodule."third_party/benchmark".url "${srcdir}/${pkgname}"-benchmark
  git config submodule."third_party/cpuinfo".url "${srcdir}/${pkgname}"-cpuinfo
  git config submodule."third_party/cub".url "${srcdir}/${pkgname}"-cub
  git config submodule."third_party/cudnn_frontend".url "${srcdir}/${pkgname}"-cudnn-frontend
  git config submodule."third_party/cutlass".url "${srcdir}/${pkgname}"-cutlass
  git config submodule."third_party/eigen".url "${srcdir}/${pkgname}"-eigen
  git config submodule."third_party/fbgemm".url "${srcdir}/${pkgname}"-fbgemm
  git config submodule."third_party/flatbuffers".url "${srcdir}/${pkgname}"-flatbuffers
  git config submodule."third_party/fmt".url "${srcdir}/${pkgname}"-fmt
  git config submodule."third_party/foxi".url "${srcdir}/${pkgname}"-foxi
  git config submodule."third_party/gemmlowp/gemmlowp".url "${srcdir}/${pkgname}"-gemmlowp
  git config submodule."third_party/gloo".url "${srcdir}/${pkgname}"-gloo
  git config submodule."third_party/googletest".url "${srcdir}/${pkgname}"-googletest
  git config submodule."third_party/ideep".url "${srcdir}/${pkgname}"-ideep
  git config submodule."third_party/ios-cmake".url "${srcdir}/${pkgname}"-ios-cmake
  git config submodule."third_party/ittapi".url "${srcdir}/${pkgname}"-ittapi
  git config submodule."third_party/kineto".url "${srcdir}/${pkgname}"-kineto
  git config submodule."third_party/mimalloc".url "${srcdir}/${pkgname}"-mimalloc
  git config submodule."third_party/nccl/nccl".url "${srcdir}/${pkgname}"-nccl
  git config submodule."third_party/neon2sse".url "${srcdir}/${pkgname}"-ARM_NEON_2_x86_SSE
  git config submodule."third_party/nlohmann".url "${srcdir}/${pkgname}"-json
  git config submodule."third_party/onnx".url "${srcdir}/${pkgname}"-onnx
  git config submodule."third_party/onnx-tensorrt".url "${srcdir}/${pkgname}"-onnx-tensorrt
  git config submodule."third_party/opentelemetry-cpp".url "${srcdir}/${pkgname}"-opentelemetry-cpp
  git config submodule."third_party/pocketfft".url "${srcdir}/${pkgname}"-pocketfft
  git config submodule."third_party/protobuf".url "${srcdir}/${pkgname}"-protobuf
  git config submodule."third_party/pybind11".url "${srcdir}/${pkgname}"-pybind11
  git config submodule."third_party/python-peachpy".url "${srcdir}/${pkgname}"-PeachPy
  git config submodule."third_party/sleef".url "${srcdir}/${pkgname}"-sleef
  git config submodule."third_party/tbb".url "${srcdir}/${pkgname}"-tbb
  git config submodule."third_party/tensorpipe".url "${srcdir}/${pkgname}"-tensorpipe
  git config submodule."third_party/zstd".url "${srcdir}/${pkgname}"-zstd

  git -c protocol.file.allow=always submodule update --init --recursive

  # Fix cmake prefix path (FS#78665)
  sed -i "s|cmake_prefix_path = _osp.*|cmake_prefix_path = '/usr/lib/cmake'|g" torch/utils/__init__.py

  # https://bugs.archlinux.org/task/64981
  patch -N torch/utils/cpp_extension.py "${srcdir}"/fix_include_system.patch

  # Use system libuv
  patch -Np1 -i "${srcdir}"/use-system-libuv.patch

  # fix https://github.com/pytorch/vision/issues/3695
  patch -Np1 -i "${srcdir}/fix-building-for-torchvision.patch"

  # Fix building against glog 0.6
  patch -Np1 -i "${srcdir}/87773.patch"

  # Fix building against glog 0.7
  patch -p1 -i "${srcdir}/glog-0.7.patch"

  # Disable -Werror
  patch -Np1 -d third_party/fbgemm -i "${srcdir}/disable-werror1.patch"
  patch -Np1 -d third_party/benchmark -i "${srcdir}/disable-werror2.patch"
  patch -Np1 -i "${srcdir}/disable-werror4.patch"

  # fix https://github.com/pytorch/pytorch/issues/97640
  patch -Np1 -i "${srcdir}/rocblas-batched.patch"

  # protobuf 23 requires C++17
  find -name CMakeLists.txt | xargs sed -e 's|CXX_STANDARD 14|CXX_STANDARD 17|' -e 's|CXX_STANDARD 11|CXX_STANDARD 17|' -i
  # Promote bool and {u,i}nit8 types to 16 bit as 8 bit types throw an exception in protobuf/abseil,
  # https://github.com/protocolbuffers/protobuf/blob/92619cdd433c5eed314d6b871060ac2340f52906/src/google/protobuf/repeated_field.h#L122-L129
  patch -Np1 -i "${srcdir}/protobuf-23.patch"

  patch -Np1 -i "${srcdir}/pytorch-missing-iostream.patch"

  # build against ffmpeg 6
  patch -Np1 -i "${srcdir}/python-pytorch-ffmpeg6.patch"

  patch -Np1 -i "${srcdir}/pytorch-remove-caffe2-binaries.patch"

  # cuda 12.4
  patch -Np1 -i "${srcdir}/123377.patch"

  patch -Np1 -i "${srcdir}/python-pytorch-aotriton-include.patch"

  cd "${srcdir}"

  cp -r "${_pkgname}" "${_pkgname}-opt"
  cp -r "${_pkgname}" "${_pkgname}-cuda"
  cp -r "${_pkgname}" "${_pkgname}-opt-cuda"
  cp -r "${_pkgname}" "${_pkgname}-rocm"
  cp -r "${_pkgname}" "${_pkgname}-opt-rocm"
}

# Common build configuration, called in all package() functions.
_prepare() {
  export VERBOSE=1
  export PYTORCH_BUILD_VERSION="${pkgver}"
  export PYTORCH_BUILD_NUMBER=1

  # Check tools/setup_helpers/cmake.py, setup.py and CMakeLists.txt for a list of flags that can be set via env vars.
  export ATEN_NO_TEST=ON  # do not build ATen tests
  export USE_MKLDNN=ON
  export BUILD_CUSTOM_PROTOBUF=OFF
  # Caffe2 support was removed from pytorch with version 2.2.0
  export BUILD_CAFFE2=OFF
  export BUILD_CAFFE2_OPS=OFF
  # export BUILD_SHARED_LIBS=OFF
  export USE_FFMPEG=ON
  export USE_GFLAGS=ON
  export USE_GLOG=ON
  export USE_VULKAN=ON
  export BUILD_BINARY=ON
  export USE_OBSERVERS=ON
  export USE_OPENCV=ON
  # export USE_SYSTEM_LIBS=ON  # experimental, not all libs present in repos
  export USE_SYSTEM_NCCL=ON
  export USE_SYSTEM_PYBIND11=ON
  export USE_SYSTEM_EIGEN_INSTALL=ON
  export NCCL_VERSION=$(pkg-config nccl --modversion)
  export NCCL_VER_CODE=$(sed -n 's/^#define NCCL_VERSION_CODE\s*\(.*\).*/\1/p' /usr/include/nccl.h)
  # export BUILD_SPLIT_CUDA=ON  # modern preferred build, but splits libs and symbols, ABI break
  # export USE_FAST_NVCC=ON  # parallel build with nvcc, spawns too many processes
  export USE_CUPTI_SO=ON  # make sure cupti.so is used as shared lib
  export CC=/usr/bin/gcc-13
  export CXX=/usr/bin/g++-13
  export CUDAHOSTCXX="${NVCC_CCBIN}"
  export CUDA_HOST_COMPILER="${CUDAHOSTCXX}"
  export CUDA_HOME=/opt/cuda
  # hide build-time CUDA devices
  export CUDA_VISIBLE_DEVICES=""
  export CUDNN_LIB_DIR=/usr/lib
  export CUDNN_INCLUDE_DIR=/usr/include
  export TORCH_NVCC_FLAGS="-Xfatbin -compress-all"
  # CUDA arch 8.7 is not supported (needed by Jetson boards, etc.)
  export TORCH_CUDA_ARCH_LIST="5.2;5.3;6.0;6.1;6.2;7.0;7.2;7.5;8.0;8.6;8.9;9.0;9.0+PTX"  #include latest PTX for future compat
  export OVERRIDE_TORCH_CUDA_ARCH_LIST="${TORCH_CUDA_ARCH_LIST}"
  export ROCM_PATH=/opt/rocm
  export HIP_ROOT_DIR=/opt/rocm
  export PYTORCH_ROCM_ARCH="gfx906;gfx908;gfx90a;gfx940;gfx941;gfx942;gfx1010;gfx1012;gfx1030;gfx1100;gfx1101;gfx1102"
  # Compile source code for supported GPU archs in parallel
  # Use gcc 13 toolchain as ROCm is not compatible with gcc 14.
  export HIPCC_COMPILE_FLAGS_APPEND="-parallel-jobs=$(nproc) --gcc-install-dir=/usr/lib/gcc/x86_64-pc-linux-gnu/13.3.0/"
  export HIPCC_LINK_FLAGS_APPEND="-parallel-jobs=$(nproc)"
}

build() {
  cd "${srcdir}/${_pkgname}"
  echo "Building without cuda or rocm and without non-x86-64 optimizations"
  _prepare
  export USE_CUDA=0
  export USE_CUDNN=0
  export USE_ROCM=0
  echo "add_definitions(-march=x86-64)" >> cmake/MiscCheck.cmake
  # this horrible hack is necessary because the current release
  # ships inconsistent CMake which tries to build objects before
  # their dependencies, build twice when dependencies are available
  python setup.py build || python setup.py build

  cd "${srcdir}/${_pkgname}-opt"
  echo "Building without cuda or rocm and with non-x86-64 optimizations"
  _prepare
  export USE_CUDA=0
  export USE_CUDNN=0
  export USE_ROCM=0
  echo "add_definitions(-march=haswell)" >> cmake/MiscCheck.cmake
  # same horrible hack as above
  python setup.py build || python setup.py build

  cd "${srcdir}/${_pkgname}-cuda"
  echo "Building with cuda and without non-x86-64 optimizations"
  _prepare
  export USE_CUDA=1
  export USE_CUDNN=1
  export USE_ROCM=0
  export MAGMA_HOME=/opt/cuda/targets/x86_64-linux
  cd "${srcdir}/${_pkgname}-cuda"
  echo "add_definitions(-march=x86-64)" >> cmake/MiscCheck.cmake
  # same horrible hack as above
  python setup.py build || python setup.py build

  cd "${srcdir}/${_pkgname}-opt-cuda"
  echo "Building with cuda and with non-x86-64 optimizations"
  export USE_CUDA=1
  export USE_CUDNN=1
  export USE_ROCM=0
  export MAGMA_HOME=/opt/cuda/targets/x86_64-linux
  _prepare
  echo "add_definitions(-march=haswell)" >> cmake/MiscCheck.cmake
  # same horrible hack as above
  python setup.py build || python setup.py build

  cd "${srcdir}/${_pkgname}-rocm"
  echo "Building with rocm and without non-x86-64 optimizations"
  _prepare
  export USE_CUDA=0
  export USE_CUDNN=0
  export USE_ROCM=1
  export MAGMA_HOME=/opt/rocm
  echo "add_definitions(-march=x86-64)" >> cmake/MiscCheck.cmake
  # Conversion of CUDA to ROCm source files
  python tools/amd_build/build_amd.py
  patch -Np1 -i "$srcdir/pytorch-rocm-jit.patch"
  # same horrible hack as above
  python setup.py build || python setup.py build
  
  cd "${srcdir}/${_pkgname}-opt-rocm"
  echo "Building with rocm and with non-x86-64 optimizations"
  _prepare
  export USE_CUDA=0
  export USE_CUDNN=0
  export USE_ROCM=1
  export MAGMA_HOME=/opt/rocm
  echo "add_definitions(-march=haswell)" >> cmake/MiscCheck.cmake
  # Conversion of CUDA to ROCm source files
  python tools/amd_build/build_amd.py
  patch -Np1 -i "$srcdir/pytorch-rocm-jit.patch"
  # same horrible hack as above
  python setup.py build || python setup.py build
}

_package() {
  # Prevent setup.py from re-running CMake and rebuilding
  sed -e 's/RUN_BUILD_DEPS = True/RUN_BUILD_DEPS = False/g' -i setup.py

  python setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  pytorchpath="usr/lib/python$(get_pyver)/site-packages/torch"
  install -d "${pkgdir}/usr/lib"

  # put CMake files in correct place
  mv "${pkgdir}/${pytorchpath}/share/cmake" "${pkgdir}/usr/lib/cmake"

  # put C++ API in correct place
  mv "${pkgdir}/${pytorchpath}/include" "${pkgdir}/usr/include"
  find "${pkgdir}/${pytorchpath}"/lib/ -type f,l \( -iname '*.so' -or -iname '*.so*' \) -print0 | while read -rd $'\0' _lib; do
    mv "${_lib}" "${pkgdir}"/usr/lib/
  done

  # Clean up duplicates with Arch packages
  rm "${pkgdir}"/usr/include/*.h

  # Python module is hardcoded so look there at runtime
  ln -s /usr/include "${pkgdir}/${pytorchpath}/include"
  find "${pkgdir}"/usr/lib -maxdepth 1 -type f,l \( -iname '*.so' -or -iname '*.so*' \) -print0 | while read -rd $'\0' _lib; do
    ln -s ${_lib#"$pkgdir"} "${pkgdir}/${pytorchpath}/lib/"
  done
}

package_python-pytorch() {
  pkgdesc="${_pkgdesc}"

  cd "${srcdir}/${_pkgname}"
  _package
}

package_python-pytorch-opt() {
  pkgdesc="${_pkgdesc} (with AVX2 CPU optimizations)"
  conflicts=(python-pytorch)
  provides=(python-pytorch=${pkgver})

  cd "${srcdir}/${_pkgname}-opt"
  _package
}

package_python-pytorch-cuda() {
  pkgdesc="${_pkgdesc} (with CUDA)"
  depends+=(cuda nccl cudnn magma-cuda onednn)
  conflicts=(python-pytorch)
  provides=(python-pytorch=${pkgver})

  cd "${srcdir}/${_pkgname}-cuda"
  _package
}

package_python-pytorch-opt-cuda() {
  pkgdesc="${_pkgdesc} (with CUDA and AVX2 CPU optimizations)"
  depends+=(cuda nccl cudnn magma-cuda onednn)
  conflicts=(python-pytorch)
  provides=(python-pytorch=${pkgver} python-pytorch-cuda=${pkgver})

  cd "${srcdir}/${_pkgname}-opt-cuda"
  _package
}

package_python-pytorch-rocm() {
  pkgdesc="${_pkgdesc} (with ROCm)"
  depends+=(rocm-hip-sdk hipblaslt roctracer miopen magma-hip onednn)
  conflicts=(python-pytorch)
  provides=(python-pytorch=${pkgver})

  cd "${srcdir}/${_pkgname}-rocm"
  _package
}

package_python-pytorch-opt-rocm() {
  pkgdesc="${_pkgdesc} (with ROCm and AVX2 CPU optimizations)"
  depends+=(rocm-hip-sdk hipblaslt roctracer miopen magma-hip onednn)
  conflicts=(python-pytorch)
  provides=(python-pytorch=${pkgver} python-pytorch-rocm=${pkgver})

  cd "${srcdir}/${_pkgname}-opt-rocm"
  _package
}

# vim:set ts=2 sw=2 et:
