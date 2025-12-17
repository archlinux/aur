# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Maintainer: Torsten Keßler <tpkessler@archlinux.org>
# Maintainer: Jakub Klinkovský <lahwaacz at archlinux dot org>
# Contributor: Stephen Zhang <zsrkmyn at gmail dot com>

_pkgname=pytorch
pkgbase="python-${_pkgname}"
pkgname=("${pkgbase}" "${pkgbase}-opt" "${pkgbase}-cuda" "${pkgbase}-opt-cuda" "${pkgbase}-rocm" "${pkgbase}-opt-rocm")
# When updating pytorch, also check the compatibility table for torchvision
# https://github.com/pytorch/vision?tab=readme-ov-file#installation
pkgver=2.9.1
pkgrel=7
_pkgdesc='Tensors and Dynamic neural networks in Python with strong GPU acceleration'
pkgdesc="${_pkgdesc}"
arch=('x86_64')
url="https://pytorch.org"
license=('BSD-3-Clause-Modification')
depends=(
  abseil-cpp
  eigen
  gcc-libs
  gflags
  glibc
  google-glog
  intel-oneapi-mkl
  libuv
  numactl
  openmp
  openmpi
  protobuf
  pybind11
  python
  python-filelock
  python-fsspec
  python-jinja
  python-networkx
  python-numpy
  python-sympy
  python-typing_extensions
  python-yaml
  qt6-base
  vulkan-icd-loader
)
# https://github.com/ROCm/aotriton/blob/main/requirements-dev.txt
makedepends=(
  cmake
  cuda
  cudnn
  doxygen
  git
  hipblaslt
  magma-cuda
  magma-hip
  miopen-hip
  nccl
  ninja
  onednn
  pkgconfig
  python-aotriton
  python-build
  python-installer
  python-setuptools
  python-triton
  python-yaml
  rocm-hip-sdk
  rocm-toolchain
  roctracer
  shaderc
  vulkan-headers
)
optdepends=(
  'python-onnxscript: for the ONNX exporter'
)
source=("${_pkgname}::git+https://github.com/pytorch/pytorch.git#tag=v$pkgver"
        # generated using parse-submodules
        "${pkgname}-FP16::git+https://github.com/Maratyszcza/FP16.git"
        "${pkgname}-FXdiv::git+https://github.com/Maratyszcza/FXdiv.git"
        "${pkgname}-NNPACK::git+https://github.com/Maratyszcza/NNPACK.git"
        "${pkgname}-NVTX::git+https://github.com/NVIDIA/NVTX.git"
        "${pkgname}-PeachPy::git+https://github.com/malfet/PeachPy.git"
        "${pkgname}-VulkanMemoryAllocator::git+https://github.com/GPUOpen-LibrariesAndSDKs/VulkanMemoryAllocator.git"
        "${pkgname}-aiter::git+https://github.com/ROCm/aiter.git"
        "${pkgname}-XNNPACK::git+https://github.com/google/XNNPACK.git"
        "${pkgname}-benchmark::git+https://github.com/google/benchmark.git"
        "${pkgname}-composable_kernel::git+https://github.com/ROCm/composable_kernel.git"
        "${pkgname}-cpp-httplib::git+https://github.com/yhirose/cpp-httplib.git"
        "${pkgname}-cpuinfo::git+https://github.com/pytorch/cpuinfo.git"
        "${pkgname}-cudnn-frontend::git+https://github.com/NVIDIA/cudnn-frontend.git"
        "${pkgname}-cutlass::git+https://github.com/NVIDIA/cutlass.git"
        "${pkgname}-fbgemm::git+https://github.com/pytorch/fbgemm"
        "${pkgname}-fbjni::git+https://github.com/facebookincubator/fbjni.git"
        "${pkgname}-flash-attention::git+https://github.com/Dao-AILab/flash-attention.git"
        "${pkgname}-flatbuffers::git+https://github.com/google/flatbuffers.git"
        "${pkgname}-fmt::git+https://github.com/fmtlib/fmt.git"
        "${pkgname}-gemmlowp::git+https://github.com/google/gemmlowp.git"
        "${pkgname}-gloo::git+https://github.com/pytorch/gloo"
        "${pkgname}-googletest::git+https://github.com/google/googletest.git"
        "${pkgname}-ideep::git+https://github.com/intel/ideep"
        "${pkgname}-ittapi::git+https://github.com/intel/ittapi.git"
        "${pkgname}-json::git+https://github.com/nlohmann/json.git"
        "${pkgname}-kineto::git+https://github.com/pytorch/kineto"
        "${pkgname}-kleidiai::git+https://github.com/ARM-software/kleidiai.git"
        "${pkgname}-mimalloc::git+https://github.com/microsoft/mimalloc.git"
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
        glog-0.7.patch
        pytorch-rocm-jit.patch
        fix_cmake_prefix_path.patch
        add_gpu_targets_rocm.patch
        aotriton_disable_install.patch
        pyproject.patch
        )
b2sums=('b11ed3fe133f4d75de45b26db565a431236c73005e68d8ba47a48b6657553df88d0a97686c4c24a6b810a9b2d4ce1aad9105cd4dce18a484b9d41150df00de3e'
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
        '400270990c63a248f9ad298580c9efe8c7757bcec111375ffeb8fbae79d1b855ab8bfd270b7efbccbf442bcdb2a9336e08de8a3e458533b3d7ccffbb6d1d43bc'
        'af8c724ed80898ae3875a295ad6bd4d18d90f8a9124f6cff6d1b2f525bf7806fe61306e739c1f7362fbd8d0e4f8ba57d0e3bf925ea3f7a78a0a98f26722db147'
        '0a8fc110a306e81beeb9ddfb3a1ddfd26aeda5e3f7adfb0f7c9bc3fd999c2dde62e0b407d3eca573097a53fd97329214e30e8767fb38d770197c7ec2b53daf18'
        '20d044c5c80354af5ed63847fa4332e96cbfc32a351788f6458fb92b322de7f64b10c188ff26e4f34e422cfe30e082c3ca23ee3e9094616c142aa53588dd451e'
        'e19fbb32da5a3bdd9d1505b2ba79ff0d765b241da819c96a380a5c871be4f5a78dcad000e01a315d936cfebb7860150f8111e60aed17cbb9337896a0831df0fe'
        'eb1a4305c9e753774ce27256f8e7f35ae52986c8dfefddb71062f7abc71eec04eaae80cd03b9cb362150465000728390b7bfd0e539f772761c0a8d5dd8dbe980'
        '007fc33064c55b1a080f8c3dcb0c03acc21629d7034426d0622b56ace3936ae07e0f4bca578327542fa3333cc127ef2e2379ebc8e1f97b561ee54de58ce84d3c'
        'ec9aea1481c6ae85288d7ab7c709af80ab919face22c17710cfadd80f07111fe53c3241f278fc76c43f28813581a4be0280a5590f8a8fd6dd6b46bc8d2ea25e0'
        'a9b0c8897a898344b0d41c1a3fb1df21a5acd3fee27fe2be3aafd250cf7004d8bb34f4d700262cae3ce66137172772d63758202d5991a2d5ac39202c49baf1e0')
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
  git config submodule."third_party/aiter".url "${srcdir}/${pkgname}"-aiter
  git config submodule."third_party/benchmark".url "${srcdir}/${pkgname}"-benchmark
  git config submodule."third_party/composable_kernel".url "${srcdir}/${pkgname}"-composable_kernel
  git config submodule."third_party/cpp-httplib".url "${srcdir}/${pkgname}"-cpp-httplib
  git config submodule."third_party/cpuinfo".url "${srcdir}/${pkgname}"-cpuinfo
  git config submodule."third_party/cudnn_frontend".url "${srcdir}/${pkgname}"-cudnn-frontend
  git config submodule."third_party/cutlass".url "${srcdir}/${pkgname}"-cutlass
  git config submodule."third_party/fbgemm".url "${srcdir}/${pkgname}"-fbgemm
  git config submodule."third_party/flash-attention".url "${srcdir}/${pkgname}"-flash-attention
  git config submodule."third_party/flatbuffers".url "${srcdir}/${pkgname}"-flatbuffers
  git config submodule."third_party/fmt".url "${srcdir}/${pkgname}"-fmt
  git config submodule."third_party/gemmlowp/gemmlowp".url "${srcdir}/${pkgname}"-gemmlowp
  git config submodule."third_party/gloo".url "${srcdir}/${pkgname}"-gloo
  git config submodule."third_party/googletest".url "${srcdir}/${pkgname}"-googletest
  git config submodule."third_party/ideep".url "${srcdir}/${pkgname}"-ideep
  git config submodule."third_party/ittapi".url "${srcdir}/${pkgname}"-ittapi
  git config submodule."third_party/kineto".url "${srcdir}/${pkgname}"-kineto
  git config submodule."third_party/kleidiai".url "${srcdir}/${pkgname}"-kleidiai
  git config submodule."third_party/mimalloc".url "${srcdir}/${pkgname}"-mimalloc
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

  # Use system libuv
  patch -Np1 -i "${srcdir}"/use-system-libuv.patch

  # Fix building against glog 0.6
  patch -Np1 -i "${srcdir}/87773.patch"

  # Fix building against glog 0.7
  patch -p1 -i "${srcdir}/glog-0.7.patch"

  # ROCm 6.4.2+ requires architectures to appear as cmake arguments too
  patch -p1 -i "${srcdir}/add_gpu_targets_rocm.patch"

  # If using prebuilt aotriton, pytorch attempts to copy /usr/lib and /user/include
  # into the torch folder. Disable this behavior.
  patch -p1 -i "${srcdir}/aotriton_disable_install.patch"

  # Fix build with CUDA 13 (CCCL headers path changed)
  sed -i 's|${CUDA_TOOLKIT_INCLUDE}|${CUDA_TOOLKIT_INCLUDE}/cccl|' cmake/Modules/FindCUB.cmake

  # Update flash-attention module for CUDA 13
  # https://github.com/Dao-AILab/flash-attention/commit/dfb664994c1e5056961c90d5e4f70bf7acc8af10
  cd third_party/flash-attention
  git checkout dfb664994c1e5056961c90d5e4f70bf7acc8af10
  cd ../..

  # https://bugs.archlinux.org/task/64981
  patch -N torch/utils/cpp_extension.py "${srcdir}"/fix_include_system.patch

  # patch python dependencies in pyproject.toml
  patch -p1 -i "${srcdir}/pyproject.patch"

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
  export BUILD_TEST=OFF  # do not build tests
  export ATEN_NO_TEST=ON  # do not build ATen tests
  export USE_MKLDNN=ON
  export BUILD_CUSTOM_PROTOBUF=OFF
  export USE_GFLAGS=ON
  export USE_GLOG=ON
  export USE_VULKAN=ON
  export USE_OBSERVERS=ON
  export USE_MAGMA=ON
  # export USE_SYSTEM_LIBS=ON  # experimental, not all libs present in repos
  # USE_SYSTEM_ONNX=ON does not work and onnx itself should be removed from pytorch: https://github.com/pytorch/pytorch/issues/166546#issuecomment-3463370459
  export USE_NCCL=ON
  export USE_SYSTEM_NCCL=ON
  export USE_SYSTEM_PYBIND11=ON
  export USE_SYSTEM_EIGEN_INSTALL=ON
  export USE_GOLD_LINKER=ON
  export NCCL_VERSION=$(pkg-config nccl --modversion)
  export NCCL_VER_CODE=$(sed -n 's/^#define NCCL_VERSION_CODE\s*\(.*\).*/\1/p' /usr/include/nccl.h)
  # export BUILD_SPLIT_CUDA=ON  # modern preferred build, but splits libs and symbols, ABI break
  export USE_CUPTI_SO=ON  # make sure cupti.so is used as shared lib
  export CC="${NVCC_CCBIN/++/cc}"
  export CXX="$NVCC_CCBIN"
  export CXXFLAGS+=" -Wno-error=maybe-uninitialized"
  export CUDAHOSTCXX="${NVCC_CCBIN}"
  export CUDA_HOST_COMPILER="${CUDAHOSTCXX}"
  export CUDA_HOME=/opt/cuda
  # hide build-time CUDA devices
  export CUDA_VISIBLE_DEVICES=""
  export CUDNN_LIB_DIR=/usr/lib
  export CUDNN_INCLUDE_DIR=/usr/include
  export TORCH_NVCC_FLAGS="-Xfatbin -compress-all"
  # the list of supported archs is in torch/utils/cpp_extension.py
  # https://github.com/pytorch/pytorch/blob/f9074c7332c3dfd43fe39e8733ec98f7f29b3e61/torch/utils/cpp_extension.py#L2417-L2420
  # (note that 8.8 is not supported)
  export TORCH_CUDA_ARCH_LIST="7.5 8.0 8.6 8.7 8.9 9.0 10.0 10.3 11.0 12.0 12.1"

  export ROCM_PATH=/opt/rocm
  export HIP_ROOT_DIR=/opt/rocm
  # gfx950 lacks support for 128 bit atomics
  export PYTORCH_ROCM_ARCH="$(rocm-supported-gfx -e gfx950)"
  # Composable kernels is not supported for all architectures.
  # https://github.com/pytorch/pytorch/issues/150187
  export USE_ROCM_CK_GEMM=OFF
  export USE_ROCM_CK_SDPA=OFF
  export USE_FBGEMM_GENAI=OFF

  # Compile source code for supported GPU archs in parallel (but using too many jobs is not helpful)
  export HIPCC_COMPILE_FLAGS_APPEND="-parallel-jobs=4 --gcc-install-dir=$(dirname $($CC -print-libgcc-file-name))"
  export HIPCC_LINK_FLAGS_APPEND="-parallel-jobs=4"

  export AOTRITON_INSTALLED_PREFIX=/usr

  # Fix build issues for onnx with cmake 4.0
  export CMAKE_POLICY_VERSION_MINIMUM=3.5

  # Fix ROCm build with glog (these macros are defined in /usr/lib/cmake/glog/glog-targets.cmake but for some reason
  # this target is not applied when building some *.hip files)
  HIPCC_COMPILE_FLAGS_APPEND+=" -DGLOG_USE_GLOG_EXPORT -DGLOG_USE_GFLAGS"
}

build() {
  cd "${srcdir}/${_pkgname}"
  echo "Building without cuda or rocm and without non-x86-64 optimizations"
  _prepare
  export USE_CUDA=0
  export USE_CUDNN=0
  export USE_ROCM=0
  echo "add_definitions(-march=x86-64)" >> cmake/MiscCheck.cmake
  python -m build --wheel --no-isolation

  cd "${srcdir}/${_pkgname}-opt"
  echo "Building without cuda or rocm and with non-x86-64 optimizations"
  _prepare
  export USE_CUDA=0
  export USE_CUDNN=0
  export USE_ROCM=0
  echo "add_definitions(-march=x86-64-v3)" >> cmake/MiscCheck.cmake
  python -m build --wheel --no-isolation

  cd "${srcdir}/${_pkgname}-cuda"
  echo "Building with cuda and without non-x86-64 optimizations"
  _prepare
  export USE_CUDA=1
  export USE_CUDNN=1
  export USE_ROCM=0
  export MAGMA_HOME=/opt/cuda/targets/x86_64-linux
  cd "${srcdir}/${_pkgname}-cuda"
  echo "add_definitions(-march=x86-64)" >> cmake/MiscCheck.cmake
  python -m build --wheel --no-isolation

  cd "${srcdir}/${_pkgname}-opt-cuda"
  echo "Building with cuda and with non-x86-64 optimizations"
  export USE_CUDA=1
  export USE_CUDNN=1
  export USE_ROCM=0
  export MAGMA_HOME=/opt/cuda/targets/x86_64-linux
  _prepare
  echo "add_definitions(-march=x86-64-v3)" >> cmake/MiscCheck.cmake
  python -m build --wheel --no-isolation

  cd "${srcdir}/${_pkgname}-rocm"
  echo "Building with rocm and without non-x86-64 optimizations"
  # -fcf-protection is not supported by HIP, see
  # https://rocm.docs.amd.com/projects/llvm-project/en/latest/reference/rocmcc.html#support-status-of-other-clang-options
  CXXFLAGS+=" -fcf-protection=none"
  _prepare
  export USE_CUDA=0
  export USE_CUDNN=0
  export USE_ROCM=1
  export MAGMA_HOME=/opt/rocm
  echo "add_definitions(-march=x86-64)" >> cmake/MiscCheck.cmake
  # Conversion of CUDA to ROCm source files
  python tools/amd_build/build_amd.py
  patch -Np1 -i "$srcdir/pytorch-rocm-jit.patch"
  python -m build --wheel --no-isolation

  cd "${srcdir}/${_pkgname}-opt-rocm"
  echo "Building with rocm and with non-x86-64 optimizations"
  _prepare
  export USE_CUDA=0
  export USE_CUDNN=0
  export USE_ROCM=1
  export MAGMA_HOME=/opt/rocm
  echo "add_definitions(-march=x86-64-v3)" >> cmake/MiscCheck.cmake
  # Conversion of CUDA to ROCm source files
  python tools/amd_build/build_amd.py
  patch -Np1 -i "$srcdir/pytorch-rocm-jit.patch"
  python -m build --wheel --no-isolation
}

_package() {
  python -m installer --destdir="$pkgdir" dist/*.whl

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
  rm -vrf $(ls -d "${pkgdir}"/usr/include/* | grep -v "/ATen$\|/caffe2$\|/c10$\|/torch$\|/tensorpipe$")

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
  depends+=(rocm-hip-sdk hipblaslt roctracer miopen-hip magma-hip onednn python-triton python-aotriton)
  conflicts=(python-pytorch)
  provides=(python-pytorch=${pkgver})

  cd "${srcdir}/${_pkgname}-rocm"
  _package
}

package_python-pytorch-opt-rocm() {
  pkgdesc="${_pkgdesc} (with ROCm and AVX2 CPU optimizations)"
  depends+=(rocm-hip-sdk hipblaslt roctracer miopen-hip magma-hip onednn python-triton python-aotriton)
  conflicts=(python-pytorch)
  provides=(python-pytorch=${pkgver} python-pytorch-rocm=${pkgver})

  cd "${srcdir}/${_pkgname}-opt-rocm"
  _package
}

# vim:set ts=2 sw=2 et:
