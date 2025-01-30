# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Maintainer: Torsten Keßler <tpkessler@archlinux.org>
# Contributor: Stephen Zhang <zsrkmyn at gmail dot com>
# Contributor: Zhirui Dai <daizhirui at hotmail dot com>

_pkgname=pytorch
pkgbase="python-${_pkgname}-cxx11abi"
pkgname=("${pkgbase}" "${pkgbase}-opt" "${pkgbase}-cuda" "${pkgbase}-opt-cuda" "${pkgbase}-rocm" "${pkgbase}-opt-rocm")
# When updating pytorch, also check the compatibility table for torchvision
# https://github.com/pytorch/vision?tab=readme-ov-file#installation
pkgver=2.6.0
_pkgver=2.6.0
pkgrel=1
_pkgdesc='Tensors and Dynamic neural networks in Python with strong GPU acceleration (with CXX11 ABI)'
pkgdesc="${_pkgdesc}"
arch=('x86_64')
url="https://pytorch.org"
license=('BSD')
depends=('google-glog' 'gflags' 'opencv' 'openmp' 'openmpi' 'pybind11' 'python' 'python-yaml' 'libuv'
         'python-numpy' 'python-sympy' 'protobuf' 'ffmpeg' 'qt6-base' 'eigen'
         'intel-oneapi-mkl' 'python-typing_extensions' 'numactl' 'python-jinja'
         'python-networkx' 'python-filelock')
# https://github.com/ROCm/aotriton/blob/main/requirements-dev.txt
_aotriton_deps=('python-iniconfig' 'python-packaging' 'python-pluggy' 'python-wheel' 'python-tqdm' 'python-textual')
makedepends=('python' 'python-setuptools' 'python-yaml' 'python-numpy' 'cmake' 'cuda' 'gcc13'
             'nccl' 'cudnn' 'git' 'rocm-hip-sdk' 'hipblaslt' 'roctracer' 'miopen-hip' 'magma-cuda' 'magma-hip'
             'ninja' 'pkgconfig' 'doxygen' 'vulkan-headers' 'shaderc' 'onednn' "${_aotriton_deps[@]}")
source=("${_pkgname}::git+https://github.com/pytorch/pytorch.git#tag=v$pkgver"
        # generated using parse-submodules
        "${pkgname}-FP16::git+https://github.com/Maratyszcza/FP16.git"
        "${pkgname}-FXdiv::git+https://github.com/Maratyszcza/FXdiv.git"
        "${pkgname}-NNPACK::git+https://github.com/Maratyszcza/NNPACK.git"
        "${pkgname}-NVTX::git+https://github.com/NVIDIA/NVTX.git"
        "${pkgname}-PeachPy::git+https://github.com/malfet/PeachPy.git"
        "${pkgname}-VulkanMemoryAllocator::git+https://github.com/GPUOpen-LibrariesAndSDKs/VulkanMemoryAllocator.git"
        "${pkgname}-XNNPACK::git+https://github.com/google/XNNPACK.git"
        "${pkgname}-benchmark::git+https://github.com/google/benchmark.git"
        "${pkgname}-cpp-httplib::git+https://github.com/yhirose/cpp-httplib.git"
        "${pkgname}-cpuinfo::git+https://github.com/pytorch/cpuinfo.git"
        "${pkgname}-cudnn-frontend::git+https://github.com/NVIDIA/cudnn-frontend.git"
        "${pkgname}-cutlass::git+https://github.com/NVIDIA/cutlass.git"
        "${pkgname}-eigen::git+https://gitlab.com/libeigen/eigen.git"
        "${pkgname}-fbgemm::git+https://github.com/pytorch/fbgemm"
        "${pkgname}-fbjni::git+https://github.com/facebookincubator/fbjni.git"
        "${pkgname}-flatbuffers::git+https://github.com/google/flatbuffers.git"
        "${pkgname}-fmt::git+https://github.com/fmtlib/fmt.git"
        "${pkgname}-gemmlowp::git+https://github.com/google/gemmlowp.git"
        "${pkgname}-gloo::git+https://github.com/facebookincubator/gloo"
        "${pkgname}-googletest::git+https://github.com/google/googletest.git"
        "${pkgname}-ideep::git+https://github.com/intel/ideep"
        "${pkgname}-ittapi::git+https://github.com/intel/ittapi.git"
        "${pkgname}-json::git+https://github.com/nlohmann/json.git"
        "${pkgname}-kineto::git+https://github.com/pytorch/kineto"
        "${pkgname}-mimalloc::git+https://github.com/microsoft/mimalloc.git"
        "${pkgname}-nccl::git+https://github.com/NVIDIA/nccl"
        "${pkgname}-onnx::git+https://github.com/onnx/onnx.git"
        "${pkgname}-opentelemetry-cpp::git+https://github.com/open-telemetry/opentelemetry-cpp.git"
        "${pkgname}-pocketfft::git+https://github.com/mreineck/pocketfft"
        "${pkgname}-protobuf::git+https://github.com/protocolbuffers/protobuf.git"
        "${pkgname}-psimd::git+https://github.com/Maratyszcza/psimd.git"
        "${pkgname}-pthreadpool::git+https://github.com/Maratyszcza/pthreadpool.git"
        "${pkgname}-pybind11::git+https://github.com/pybind/pybind11.git"
        "${pkgname}-sleef::git+https://github.com/shibatch/sleef"
        "${pkgname}-tensorpipe::git+https://github.com/pytorch/tensorpipe.git"
        fix_include_system.patch
        use-system-libuv.patch
        87773.patch
        disable-werror1.patch
        disable-werror2.patch
        disable-werror4.patch
        glog-0.7.patch
        pytorch-rocm-jit.patch
        pytorch-missing-iostream.patch
        pytorch-remove-caffe2-binaries.patch
        fix_cmake_prefix_path.patch)
b2sums=('087a803a0d16f069129d63e9c6dbfdce29a2912f7c96f08a9d9d1148fa3ae9d5bcb3ddc315e6be67c320c2f556fd16af01b7e28ed286e0fde1a4501f8ff93c06'
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
        '400270990c63a248f9ad298580c9efe8c7757bcec111375ffeb8fbae79d1b855ab8bfd270b7efbccbf442bcdb2a9336e08de8a3e458533b3d7ccffbb6d1d43bc'
        'af8c724ed80898ae3875a295ad6bd4d18d90f8a9124f6cff6d1b2f525bf7806fe61306e739c1f7362fbd8d0e4f8ba57d0e3bf925ea3f7a78a0a98f26722db147'
        '0a8fc110a306e81beeb9ddfb3a1ddfd26aeda5e3f7adfb0f7c9bc3fd999c2dde62e0b407d3eca573097a53fd97329214e30e8767fb38d770197c7ec2b53daf18'
        '844d0b7b39777492a6d456fa845d5399f673b4bb37b62473393449c9ad0c29dca3c33276dc3980f2e766680100335c0acfb69d51781b79575f4da112d9c4018c'
        '985e331b2025e1ca5a4fba5188af0900f1f38bd0fd32c9173deb8bed7358af01e387d4654c7e0389e5f98b6f7cbed053226934d180b8b3b1270bdbbb36fc89b2'
        'eea86bbed0a37e1661035913536456f90e0cd1e687c7e4103011f0688bc8347b6fc2ff82019909c41e7c89ddbc3b80dde641e88abf406f4faebc71b0bb693d25'
        '20d044c5c80354af5ed63847fa4332e96cbfc32a351788f6458fb92b322de7f64b10c188ff26e4f34e422cfe30e082c3ca23ee3e9094616c142aa53588dd451e'
        'e19fbb32da5a3bdd9d1505b2ba79ff0d765b241da819c96a380a5c871be4f5a78dcad000e01a315d936cfebb7860150f8111e60aed17cbb9337896a0831df0fe'
        '77458fa568692020ae4e437b1ebae6ebbf59f040b3414ba03e32cc829f1befb9f39dde6e0c0525e30d42dd08d482d2f213dd8294a9877476c7d0d6aabb0f08d3'
        '4514a3b50581a35aa11daaf06c8d4b4b04dee9518bb8239667a5ef758660355f9ebf27ef6796d1369fca97c98278d05cab19ed3d8d52790325331113df65182c'
        '12e2f94b25d8c473f064223b120c339245fce931c835b88aa66236899909745700e59dd787474588292798a0333e321150cc00d4eb2b5530b324ad2fb143a626')
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
  git config submodule."third_party/NVTX".url "${srcdir}/${pkgname}"-NVTX
  git config submodule."third_party/VulkanMemoryAllocator".url "${srcdir}/${pkgname}"-VulkanMemoryAllocator
  git config submodule."third_party/XNNPACK".url "${srcdir}/${pkgname}"-XNNPACK
  git config submodule."third_party/benchmark".url "${srcdir}/${pkgname}"-benchmark
  git config submodule."third_party/cpp-httplib".url "${srcdir}/${pkgname}"-cpp-httplib
  git config submodule."third_party/cpuinfo".url "${srcdir}/${pkgname}"-cpuinfo
  git config submodule."third_party/cudnn_frontend".url "${srcdir}/${pkgname}"-cudnn-frontend
  git config submodule."third_party/cutlass".url "${srcdir}/${pkgname}"-cutlass
  git config submodule."third_party/eigen".url "${srcdir}/${pkgname}"-eigen
  git config submodule."third_party/fbgemm".url "${srcdir}/${pkgname}"-fbgemm
  git config submodule."third_party/flatbuffers".url "${srcdir}/${pkgname}"-flatbuffers
  git config submodule."third_party/fmt".url "${srcdir}/${pkgname}"-fmt
  git config submodule."third_party/gemmlowp/gemmlowp".url "${srcdir}/${pkgname}"-gemmlowp
  git config submodule."third_party/gloo".url "${srcdir}/${pkgname}"-gloo
  git config submodule."third_party/googletest".url "${srcdir}/${pkgname}"-googletest
  git config submodule."third_party/ideep".url "${srcdir}/${pkgname}"-ideep
  git config submodule."third_party/ittapi".url "${srcdir}/${pkgname}"-ittapi
  git config submodule."third_party/kineto".url "${srcdir}/${pkgname}"-kineto
  git config submodule."third_party/mimalloc".url "${srcdir}/${pkgname}"-mimalloc
  git config submodule."third_party/nccl/nccl".url "${srcdir}/${pkgname}"-nccl
  git config submodule."third_party/nlohmann".url "${srcdir}/${pkgname}"-json
  git config submodule."third_party/onnx".url "${srcdir}/${pkgname}"-onnx
  git config submodule."third_party/opentelemetry-cpp".url "${srcdir}/${pkgname}"-opentelemetry-cpp
  git config submodule."third_party/pocketfft".url "${srcdir}/${pkgname}"-pocketfft
  git config submodule."third_party/protobuf".url "${srcdir}/${pkgname}"-protobuf
  git config submodule."third_party/pybind11".url "${srcdir}/${pkgname}"-pybind11
  git config submodule."third_party/python-peachpy".url "${srcdir}/${pkgname}"-PeachPy
  git config submodule."third_party/sleef".url "${srcdir}/${pkgname}"-sleef
  git config submodule."third_party/tensorpipe".url "${srcdir}/${pkgname}"-tensorpipe

  git -c protocol.file.allow=always submodule update --init --recursive

  # Fix cmake prefix path (FS#78665)
  patch -Np1 -i "${srcdir}"/fix_cmake_prefix_path.patch

  # https://bugs.archlinux.org/task/64981
  patch -N torch/utils/cpp_extension.py "${srcdir}"/fix_include_system.patch

  # Use system libuv
  patch -Np1 -i "${srcdir}"/use-system-libuv.patch

  # Fix building against glog 0.6
  patch -Np1 -i "${srcdir}/87773.patch"

  # Fix building against glog 0.7
  patch -p1 -i "${srcdir}/glog-0.7.patch"

  # Disable -Werror
  patch -Np1 -d third_party/fbgemm -i "${srcdir}/disable-werror1.patch"
  patch -Np1 -d third_party/benchmark -i "${srcdir}/disable-werror2.patch"
  patch -Np1 -i "${srcdir}/disable-werror4.patch"

  # protobuf 23 requires C++17
  find -name CMakeLists.txt | xargs sed -e 's|CXX_STANDARD 14|CXX_STANDARD 17|' -e 's|CXX_STANDARD 11|CXX_STANDARD 17|' -i

  patch -Np1 -i "${srcdir}/pytorch-missing-iostream.patch"

  patch -Np1 -i "${srcdir}/pytorch-remove-caffe2-binaries.patch"

  # Reduce number of targets for ahead-of-time compilation to fix linker errors
  sed -e '25a-DTARGET_GPUS=Navi31' -i cmake/External/aotriton.cmake

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
  # copied from rocBLAS
  # https://github.com/ROCm/rocBLAS/blob/9c8a7dfeb3d0a808321541567447b5c1d17cd070/CMakeLists.txt#L114
  export PYTORCH_ROCM_ARCH="gfx900;gfx906:xnack-;gfx908:xnack-;gfx90a:xnack+;gfx90a:xnack-;gfx940;gfx941;gfx942;gfx1010;gfx1012;gfx1030;gfx1100;gfx1101;gfx1102"
  # 1. Compile source code for supported GPU archs in parallel
  # 2. Use gcc 13 toolchain as ROCm is not compatible with gcc 14.
  # 3. Use --offload-comress to reduce the size of the generated binaries.
  #    Otherwise we run into the 32 bit offset limit, see
  #    https://github.com/ROCm/rocBLAS/issues/1448#issuecomment-2372524901
  export HIPCC_COMPILE_FLAGS_APPEND="-parallel-jobs=$(nproc) --gcc-install-dir=$(dirname $(gcc-13 -print-libgcc-file-name)) --offload-compress"
  export HIPCC_LINK_FLAGS_APPEND="-parallel-jobs=$(nproc)"
  # Force aotriton to use system deps
  # export PIP_NO_INDEX=1
}

build() {
  cd "${srcdir}/${_pkgname}"
  echo "Building without cuda or rocm and without non-x86-64 optimizations"
  _prepare
  export USE_CUDA=0
  export USE_CUDNN=0
  export USE_ROCM=0
  export GLIBCXX_USE_CXX11_ABI=1
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
  export GLIBCXX_USE_CXX11_ABI=1
  echo "add_definitions(-march=x86-64-v3)" >> cmake/MiscCheck.cmake
  # same horrible hack as above
  python setup.py build || python setup.py build

  cd "${srcdir}/${_pkgname}-cuda"
  echo "Building with cuda and without non-x86-64 optimizations"
  _prepare
  export USE_CUDA=1
  export USE_CUDNN=1
  export USE_ROCM=0
  export GLIBCXX_USE_CXX11_ABI=1
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
  export GLIBCXX_USE_CXX11_ABI=1
  export MAGMA_HOME=/opt/cuda/targets/x86_64-linux
  _prepare
  echo "add_definitions(-march=x86-64-v3)" >> cmake/MiscCheck.cmake
  # same horrible hack as above
  python setup.py build || python setup.py build

  cd "${srcdir}/${_pkgname}-rocm"
  echo "Building with rocm and without non-x86-64 optimizations"
  # -fcf-protection is not supported by HIP, see
  # https://rocm.docs.amd.com/projects/llvm-project/en/latest/reference/rocmcc.html#support-status-of-other-clang-options
  CXXFLAGS+=" -fcf-protection=none"
  _prepare
  export USE_CUDA=0
  export USE_CUDNN=0
  export USE_ROCM=1
  export GLIBCXX_USE_CXX11_ABI=1
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
  export GLIBCXX_USE_CXX11_ABI=1
  export MAGMA_HOME=/opt/rocm
  echo "add_definitions(-march=x86-64-v3)" >> cmake/MiscCheck.cmake
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

package_python-pytorch-cxx11abi() {
  pkgdesc="${_pkgdesc}"
  conflicts=(python-pytorch)
  provides=(python-pytorch=${pkgver})
  cd "${srcdir}/${_pkgname}"
  _package
}

package_python-pytorch-cxx11abi-opt() {
  pkgdesc="${_pkgdesc} (with AVX2 CPU optimizations)"
  conflicts=(python-pytorch)
  provides=(python-pytorch=${pkgver})

  cd "${srcdir}/${_pkgname}-opt"
  _package
}

package_python-pytorch-cxx11abi-cuda() {
  pkgdesc="${_pkgdesc} (with CUDA)"
  depends+=(cuda nccl cudnn magma-cuda onednn)
  conflicts=(python-pytorch)
  provides=(python-pytorch=${pkgver})

  cd "${srcdir}/${_pkgname}-cuda"
  _package
}

package_python-pytorch-cxx11abi-opt-cuda() {
  pkgdesc="${_pkgdesc} (with CUDA and AVX2 CPU optimizations)"
  depends+=(cuda nccl cudnn magma-cuda onednn)
  conflicts=(python-pytorch)
  provides=(python-pytorch=${pkgver} python-pytorch-cuda=${pkgver})

  cd "${srcdir}/${_pkgname}-opt-cuda"
  _package
}

package_python-pytorch-cxx11abi-rocm() {
  pkgdesc="${_pkgdesc} (with ROCm)"
  depends+=(rocm-hip-sdk hipblaslt roctracer miopen-hip magma-hip onednn)
  conflicts=(python-pytorch)
  provides=(python-pytorch=${pkgver})

  cd "${srcdir}/${_pkgname}-rocm"
  _package
}

package_python-pytorch-cxx11abi-opt-rocm() {
  pkgdesc="${_pkgdesc} (with ROCm and AVX2 CPU optimizations)"
  depends+=(rocm-hip-sdk hipblaslt roctracer miopen-hip magma-hip onednn)
  conflicts=(python-pytorch)
  provides=(python-pytorch=${pkgver} python-pytorch-rocm=${pkgver})

  cd "${srcdir}/${_pkgname}-opt-rocm"
  _package
}

# vim:set ts=2 sw=2 et:
