# Maintainer: Orion-zhen <https://github.com/Orion-zhen>
# Contributer: darkbasic <niccolo.belli@linuxsystems.it>

pkgname=llama.cpp-hip-gfx1151
_pkgname=llama.cpp
pkgver=b10938
pkgrel=1
_upstream_commit=f1e44dcc11d8802d107bd7331a3d3fd3e6f57b93
_mtp_graph_base=dbeb37548e25abc6e54961c4c99e63f191367809
_mtp_graph_commit=33ed43518d078174b895a5b459a8f7018e433916
_mtp_commit=1d8de7c1b0c7d2febf8f983174d8e6a711e2b1af
_mtp_mixer_export_commit=57bb668674d9fb0d382885e5b04911c6437f8e83
_mtp_reset_commit=7abbba20a8ac5bf32477bfd7cd6fa6061067e590
_server_recurrent_rollback_commit=13e4cfe53ff3dc2e786a9264ee552da53e0a41c4
_ggml_nbytes_overflow_commit=0a2e89adb99d86cf11d694327b942e9408a1b769
_rpc_invalid_graph_node_commit=181b1999205fd0e7c3e0db2874856649a0612d3f
_hipcub_base_commit=d7bd3bfcad3e29c7e49fd26f38c79ee3e9a3fd6b
_hipcub_commit=861abb2b2e333744d565e07985de8f6f6feaff65
_ple_row_prefetch_commit=c911e6bb5eb956a759e740fb14db8ca639b7d3e7
_rdna35_mmq_commit=c6381ea95667b5b7a98a709ec6c1e47135928f5f

_rollback_probe_commit=f3996edac998f8b6ccde86f65d5940e1d00ab115
_gguf_pad_commit=8aa2a949347762f21987aba06f92e0e19034e66f
_ui_tools_probe_commit=b1a28b91ce67ef6c82623e98ffd65e4085824434
_hip_padding_stream_commit=678a3f9f8e137e68a69777b7e6aca4ad02be0754
_nemotron_mtp_latent_commit=d99608f83cf2e0288d2f190532e4fbedd098e841
_nemotron_mtp_divisor_commit=2043d359ce66eb016af3d837a98b96cd38e318b9

# GitHub can regenerate diff headers without changing the pinned commits.
# Include each checksum in its source alias so yay/paru/SRCDEST caches fetch
# changed bytes instead of reusing an older file and failing verification.
_mtp_graph_sha256=3a347bd98e80e581bcd687797e7f9d76e68e862b39125cdba982565a4a4b80d4
_mtp_sha256=2589fda61cee19deba67d44ed8e4988cf12d3ba2efa2a4b6fe886d5bacc79602
_mtp_mixer_export_sha256=e0e465911f38e86dc4719c6a4d927d59176813ee29a6bd321bc95cfc0a13c707
_mtp_reset_sha256=f6751cb25e7b389e64811e7a1a8f69117f9af85a5c2cb791e3107aae285fb6e8
_server_recurrent_rollback_sha256=5600f12e0aa4128884d2d83d22f4d06a1a71ed40b8fb092783f6bab2cf617647
_ggml_nbytes_overflow_sha256=594912e3c8d471e8203c1c849bb0cb0ddad9639d85cf091f3c0ced4e89d59caf
_rpc_invalid_graph_node_sha256=52b24b7daaeb64f0d3863544c41b2eabf45757c6fa574d8cd2eee492709dc54d
_hipcub_sha256=cb7c9ce5a13cd6f72ebd056dbdba8b9fd908e627fef031e24059e79aec2bfb24
_ple_row_prefetch_sha256=0f8c6be00fcc7d59c0c67ed205f3b71bba9a9e9ee7b3350fac4d234e92ede069
_rdna35_mmq_sha256=9226be6cbdf00d7963321b395374dcc58a7386c7cba75db7a42aed3e60725834
_rollback_probe_sha256=6e43d4e0c88ecb0268db75670c765fa0676d6699e0bd42a474c537ed1f00f35d
_gguf_pad_sha256=fab0ed3fc7dca2f8583d610c073a2e126df0467758b60bef5f22346725094284
_ui_tools_probe_sha256=9346f8952b7e7d7b4482b96f31afd9aa8778e28a4ccd205a55bd3d442c30c170
_hip_padding_stream_sha256=658e5eea1a342f78b024d57678d85dd6756b34798111581dac2d518f644453e0
_nemotron_mtp_latent_sha256=87969161074cfa3cc9cfcaf3a398142686e03ceca34789749d02f2bd4a90661e
_nemotron_mtp_divisor_sha256=cd00a6a72379907b2158be7347e1190b7be3d81fded159a9de46e6f35e5159bd
pkgdesc="Port of Facebook's LLaMA model in C/C++ (Optimized for gfx1151, ROCm)"
arch=(x86_64)
url='https://github.com/ggml-org/llama.cpp'
license=('MIT')
depends=(
  curl
  gcc-libs
  glibc
  python
  openmp
  hip-runtime-amd
  hipblas
  rocblas
)
makedepends=(
  cmake
  git
  hipcub
  nodejs
  npm
  rocm-hip-sdk
)
optdepends=(
  'python-numpy: needed for convert_hf_to_gguf.py'
  'python-safetensors: needed for convert_hf_to_gguf.py'
  'python-sentencepiece: needed for convert_hf_to_gguf.py'
  'python-pytorch: needed for convert_hf_to_gguf.py'
  'python-transformers: needed for convert_hf_to_gguf.py'
  'python-gguf: needed for convert_hf_to_gguf.py'
)
provides=(${_pkgname} ${_pkgname}-hip llama-cpp libggml ggml ggml-rocm)
conflicts=(${_pkgname} ${_pkgname}-hip ${_pkgname}-vulkan llama-cpp libggml ggml ggml-rocm ggml-vulkan stable-diffusion.cpp)
options=(lto !debug)
backup=("etc/conf.d/llama.cpp")
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/ggml-org/llama.cpp/archive/refs/tags/${pkgver}.tar.gz"
  "mtp-graph-reuse-${_mtp_graph_commit}-${_mtp_graph_sha256}.patch::https://github.com/ggml-org/llama.cpp/compare/${_mtp_graph_base}...${_mtp_graph_commit}.diff"
  "qwen4exp-mtp-${_mtp_commit}-${_mtp_sha256}.patch::https://github.com/ggml-org/llama.cpp/compare/e70802a01f03f0ed31a26338a5664796f3824371...${_mtp_commit}.diff"
  "qwen4exp-mtp-mixer-export-${_mtp_mixer_export_commit}-${_mtp_mixer_export_sha256}.patch::https://github.com/rmonsurate/llama.cpp/commit/${_mtp_mixer_export_commit}.diff"
  "qwen4exp-mtp-b10938.patch"
  "qwen4exp-mtp-mixed-f16-b10938.patch"
  "nemotron-mtp-latent-${_nemotron_mtp_latent_commit}-${_nemotron_mtp_latent_sha256}.patch::https://github.com/ggml-org/llama.cpp/commit/${_nemotron_mtp_latent_commit}.diff"
  "nemotron-mtp-divisor-${_nemotron_mtp_divisor_commit}-${_nemotron_mtp_divisor_sha256}.patch::https://github.com/ggml-org/llama.cpp/commit/${_nemotron_mtp_divisor_commit}.diff"
  "mtp-reset-sequence-${_mtp_reset_commit}-${_mtp_reset_sha256}.patch::https://github.com/ggml-org/llama.cpp/commit/${_mtp_reset_commit}.diff"
  "rollback-capability-probe-${_rollback_probe_commit}-${_rollback_probe_sha256}.patch::https://github.com/ggml-org/llama.cpp/commit/${_rollback_probe_commit}.diff"
  "server-recurrent-rollback-${_server_recurrent_rollback_commit}-${_server_recurrent_rollback_sha256}.patch::https://github.com/ggml-org/llama.cpp/commit/${_server_recurrent_rollback_commit}.diff"
  "ggml-nbytes-overflow-${_ggml_nbytes_overflow_commit}-${_ggml_nbytes_overflow_sha256}.patch::https://github.com/ggml-org/llama.cpp/commit/${_ggml_nbytes_overflow_commit}.diff"
  "gguf-padding-overflow-${_gguf_pad_commit}-${_gguf_pad_sha256}.patch::https://github.com/ggml-org/llama.cpp/commit/${_gguf_pad_commit}.diff"
  "rpc-invalid-graph-node-${_rpc_invalid_graph_node_commit}-${_rpc_invalid_graph_node_sha256}.patch::https://github.com/ggml-org/llama.cpp/commit/${_rpc_invalid_graph_node_commit}.diff"
  "rpc-graph-shape-validation-b10938.patch"
  "hipcub-rocm-${_hipcub_commit}-${_hipcub_sha256}.patch::https://github.com/ggml-org/llama.cpp/compare/${_hipcub_base_commit}...${_hipcub_commit}.diff"
  "rdna35-mmq-${_rdna35_mmq_commit}-${_rdna35_mmq_sha256}.patch::https://github.com/ggml-org/llama.cpp/commit/${_rdna35_mmq_commit}.diff"
  "hip-padding-stream-${_hip_padding_stream_commit}-${_hip_padding_stream_sha256}.patch::https://github.com/ggml-org/llama.cpp/commit/${_hip_padding_stream_commit}.diff"
  "gfx1151-fa-wmma-d256-fallback-b10938.patch"
  "qwen4exp-ple-row-prefetch-${_ple_row_prefetch_commit}-${_ple_row_prefetch_sha256}.patch::https://github.com/Aristo94/EngramHalo.cpp/commit/${_ple_row_prefetch_commit}.diff"
  "qwen4exp-ple-row-prefetch-b10938.patch"
  "ui-tools-forbidden-probe-${_ui_tools_probe_commit}-${_ui_tools_probe_sha256}.patch::https://github.com/ggml-org/llama.cpp/commit/${_ui_tools_probe_commit}.diff"
  "json-schema-numeric-bounds-b10938.patch"
  # 提升性能的妙妙工具
  # "llama-gfx1151.patch::https://gist.githubusercontent.com/pedapudi/0da060d2a3b49a51155dbf00db61fea0/raw/aaaee0a96656ec0fc49bdfa76acd2b4edbfcbfb9/gistfile1.txt"
  "https://raw.githubusercontent.com/Orion-zhen/aur-packages/refs/heads/main/assets/llama.cpp/llama.cpp.service"
  "https://raw.githubusercontent.com/Orion-zhen/aur-packages/refs/heads/main/assets/llama.cpp/llama.cpp.conf"
  "https://raw.githubusercontent.com/Orion-zhen/aur-packages/refs/heads/main/assets/llama.cpp/llama.cpp.sysusers"
  "https://raw.githubusercontent.com/Orion-zhen/aur-packages/refs/heads/main/assets/llama.cpp/llama.cpp.tmpfiles"
)
sha256sums=('f243da3fd85c18038f31b13fcd219e4acf8c656aad92e90cc10d223c8463c026'
            "${_mtp_graph_sha256}"
            "${_mtp_sha256}"
            "${_mtp_mixer_export_sha256}"
            'a291fc7c1ff8dae2b6df8f2d42c061096d0830c780a9e4eda997b4802ef501b0'
            'b054dfda7aee1384b01173da1b189b37145e110daa0725616d56dec312e3655c'
            "${_nemotron_mtp_latent_sha256}"
            "${_nemotron_mtp_divisor_sha256}"
            "${_mtp_reset_sha256}"
            "${_rollback_probe_sha256}"
            "${_server_recurrent_rollback_sha256}"
            "${_ggml_nbytes_overflow_sha256}"
            "${_gguf_pad_sha256}"
            "${_rpc_invalid_graph_node_sha256}"
            '560885fc3b0929e574111120b2413a471bac7e3a707daec168e20c135bae5ade'
            "${_hipcub_sha256}"
            "${_rdna35_mmq_sha256}"
            "${_hip_padding_stream_sha256}"
            'f73f392ce87c09f51d76b46adf415d9e8731864a77553bc0cd51066850eb60ee'
            "${_ple_row_prefetch_sha256}"
            'ee2ec47507d2c5571bfb38891fa3c828a38c39d522c7e5a377f74fc337ceb7f1'
            "${_ui_tools_probe_sha256}"
            '4dd9e7aafe811e54b96463af428e604c7b1dbbac439f282892b27fb69518dece'
            'b481dcaa07d8b912b32066da4ee48341cb521852eb16d76a6cf7a8216402e101'
            'bd43b307d55a74bc64b88d95e1f37d0b12ddd2935563fc893835a91e2b8c10b5'
            '8349878d7e61819fe3da6e8a25c46c7dd66592c9a5736a7f66eb475c7a51068c'
            '027600188395ed3d721ed6f32c6fa954138fb25212154ceeadc2ff16076b1194')

prepare() {
  ln -sf "${_pkgname}-${pkgver}" llama.cpp

  # Keep MTP output and no-output batches in separate graph metadata arenas.
  # Carry the complete reviewed PR #28549 series, including its field rename.
  patch -d "${_pkgname}" -Np1 --fuzz=0 --no-backup-if-mismatch \
    -i "${srcdir}/mtp-graph-reuse-${_mtp_graph_commit}-${_mtp_graph_sha256}.patch"

  # Qwen3.8-Flash-Next MTP. b10938 already contains merged PR #27941,
  # whose loader hardening overlaps the old qwen4exp.cpp hunk. Apply the
  # unaffected upstream files, then the no-fuzz local rebase that combines
  # the PR's runtime graph with detached-head commit a82a58a.
  GIT_CEILING_DIRECTORIES="${srcdir}" git -C "${_pkgname}" apply --no-index \
    --exclude='src/models/qwen4exp.cpp' \
    "${srcdir}/qwen4exp-mtp-${_mtp_commit}-${_mtp_sha256}.patch"
  patch -d "${_pkgname}" -Np1 --fuzz=0 --no-backup-if-mismatch -i "${srcdir}/qwen4exp-mtp-mixer-export-${_mtp_mixer_export_commit}-${_mtp_mixer_export_sha256}.patch"
  patch -d "${_pkgname}" -Np1 --fuzz=0 --no-backup-if-mismatch \
    -i "${srcdir}/qwen4exp-mtp-b10938.patch"

  # Keep valid F16 integrated-head gamma tensors from entering unsupported
  # F32 x F16 binary-op dispatch in the CPU or shared HIP/CUDA backend.
  GIT_CEILING_DIRECTORIES="${srcdir}" git -C "${_pkgname}" apply --no-index \
    "${srcdir}/qwen4exp-mtp-mixed-f16-b10938.patch"

  # PR #28764: load and use the optional Nemotron MTPv2 latent FFN pair.
  patch -d "${_pkgname}" -Np1 --fuzz=0 --no-backup-if-mismatch \
    -i "${srcdir}/nemotron-mtp-latent-${_nemotron_mtp_latent_commit}-${_nemotron_mtp_latent_sha256}.patch"
  # PR #28779: report missing NextN FFN metadata instead of dividing by zero.
  patch -d "${_pkgname}" -Np1 --fuzz=0 --no-backup-if-mismatch \
    -i "${srcdir}/nemotron-mtp-divisor-${_nemotron_mtp_divisor_commit}-${_nemotron_mtp_divisor_sha256}.patch"

  # A fresh sequence must not inherit a prior request's pending MTP carrier.
  # This is the narrow reset from PR #28333; it does not relax --np 1.
  patch -d "${_pkgname}" -Np1 --fuzz=0 --no-backup-if-mismatch \
    -i "${srcdir}/mtp-reset-sequence-${_mtp_reset_commit}-${_mtp_reset_sha256}.patch"

  # PR #28749: return known rollback capability before clearing/probing a context.
  patch -d "${_pkgname}" -Np1 --fuzz=0 --no-backup-if-mismatch \
    -i "${srcdir}/rollback-capability-probe-${_rollback_probe_commit}-${_rollback_probe_sha256}.patch"

  # Upstream #28330 now omits Qwen4-Exp's unused indexer V cache.

  # Reprocess instead of aborting or retaining stale recurrent state when a
  # hybrid target or draft cannot roll back far enough.
  patch -d "${_pkgname}" -Np1 --fuzz=0 --no-backup-if-mismatch \
    -i "${srcdir}/server-recurrent-rollback-${_server_recurrent_rollback_commit}-${_server_recurrent_rollback_sha256}.patch"

  # Avoid a pre-division size wrap for malformed block-quantized tensors.
  patch -d "${_pkgname}" -Np1 --fuzz=0 --no-backup-if-mismatch \
    -i "${srcdir}/ggml-nbytes-overflow-${_ggml_nbytes_overflow_commit}-${_ggml_nbytes_overflow_sha256}.patch"

  # PR #24759, recovered as #28810: reject sizes that would wrap during GGUF alignment padding.
  patch -d "${_pkgname}" -Np1 --fuzz=0 --no-backup-if-mismatch \
    -i "${srcdir}/gguf-padding-overflow-${_gguf_pad_commit}-${_gguf_pad_sha256}.patch"

  # Upstream #28739 already skips empty expert-ID tensors before offload.

  # Reject malformed top-level RPC graph nodes instead of dereferencing null.
  patch -d "${_pkgname}" -Np1 --fuzz=0 --no-backup-if-mismatch \
    -i "${srcdir}/rpc-invalid-graph-node-${_rpc_invalid_graph_node_commit}-${_rpc_invalid_graph_node_sha256}.patch"

  # Extend PR #26933 after the preceding null-node guard without fuzzy patching.
  # Mirror the complete SET_ROWS/GET_ROWS constructor invariants before RPC
  # execution; the PR's original two checks had ASan-confirmed bypasses.
  patch -d "${_pkgname}" -Np1 --fuzz=0 --no-backup-if-mismatch \
    -i "${srcdir}/rpc-graph-shape-validation-b10938.patch"

  # Upstream #28604 now disables direct host-buffer compute on HIP itself;
  # the former #25863 capability workaround is no longer needed.

  # Prefer hipCUB with rocPRIM >= 4.4; older ROCm keeps b10938's upstream
  # native HIP radix fallback.
  # The extracted source is untracked inside an AUR Git clone. Stop Git at
  # $srcdir so its subdirectory prefix cannot silently skip every patch path.
  GIT_CEILING_DIRECTORIES="${srcdir}" git -C "${_pkgname}" apply --no-index \
    --exclude='.github/workflows/build-cuda-ubuntu.yml' \
    --exclude='.github/workflows/hip-quality-check.yml' \
    --exclude='tests/test-backend-ops.cpp' \
    "${srcdir}/hipcub-rocm-${_hipcub_commit}-${_hipcub_sha256}.patch"

  # Reviewed gfx1151 MMQ tile tuning (#28195); IQ4_XS entries are unchanged.
  patch -d "${_pkgname}" -Np1 --fuzz=0 --no-backup-if-mismatch \
    -i "${srcdir}/rdna35-mmq-${_rdna35_mmq_commit}-${_rdna35_mmq_sha256}.patch"

  # PR #28782: avoid legacy-stream padding memset during parallel HIP capture.
  # Keep the synchronous return contract; omit the unrelated CI follow-up.
  patch -d "${_pkgname}" -Np1 --fuzz=0 --no-backup-if-mismatch \
    -i "${srcdir}/hip-padding-stream-${_hip_padding_stream_commit}-${_hip_padding_stream_sha256}.patch"

  # Keep #28102's other tuning, but use the established gfx1151 D=256 path
  # pending controlled validation of the new multi-image corruption report.
  patch -d "${_pkgname}" -Np1 --fuzz=0 --no-backup-if-mismatch \
    -i "${srcdir}/gfx1151-fa-wmma-d256-fallback-b10938.patch"

  # Queue the sparse PLE rows before each graph and support its 160-wide IQ4_NL
  # rows in the HIP GET_ROWS kernel. The small second patch hooks that row
  # prefetch into b10938's upstream lazy-tensor bookkeeping.
  GIT_CEILING_DIRECTORIES="${srcdir}" git -C "${_pkgname}" apply --no-index \
    --exclude='src/llama-model-loader.cpp' \
    --exclude='src/llama-model-loader.h' \
    "${srcdir}/qwen4exp-ple-row-prefetch-${_ple_row_prefetch_commit}-${_ple_row_prefetch_sha256}.patch"
  patch -d "${_pkgname}" -Np1 --fuzz=0 --no-backup-if-mismatch \
    -i "${srcdir}/qwen4exp-ple-row-prefetch-b10938.patch"

  # PR #28646: cache a forbidden /tools response instead of repeatedly probing.
  patch -d "${_pkgname}" -Np1 --fuzz=0 --no-backup-if-mismatch \
    -i "${srcdir}/ui-tools-forbidden-probe-${_ui_tools_probe_commit}-${_ui_tools_probe_sha256}.patch"

  # b10938 includes merged #28747 router framing and #28787 cpp-httplib 0.56.0.

  # Guard numeric narrowing/overflow inherited with #28736's schema parser.
  patch -d "${_pkgname}" -Np1 --fuzz=0 --no-backup-if-mismatch \
    -i "${srcdir}/json-schema-numeric-bounds-b10938.patch"

  # Tailwind v4's oxide scanner walks up looking for the nearest .git to anchor
  # .gitignore lookup. In AUR helpers (yay/paru) the parent .git is the AUR
  # clone, whose .gitignore is `*` + an allowlist for PKGBUILD/.SRCINFO. That
  # rule ignores tools/ui/src/lib/**/*.svelte, so Tailwind scans zero files and
  # the built bundle.css ships without any utility classes. An empty .git in
  # the extracted source tree stops the upward walk before that point.
  mkdir -p "${_pkgname}/.git"

  # patch -d "${srcdir}/llama.cpp" -Np1 -i "${srcdir}/llama-gfx1151.patch"
}

build() {
  pushd "${_pkgname}/tools/ui"
  npm ci
  npm run build
  popd

  # 配置环境
  if [[ -z "${ROCM_PATH}" ]]; then
    source /etc/profile
  fi
  export HIP_PATH="$(hipconfig -R)"
  export HIPCXX="$(hipconfig -l)/amdclang"
  export HIP_PLATFORM=amd
  # 清除核显上的函数调用开销
  # export HIP_CLANG_FLAGS="--offload-arch=gfx1151 -mllvm -amdgpu-early-inline-all=true -mllvm -amdgpu-function-calls=false"

  local _cmake_options=(
    -B build
    -S "${_pkgname}"
    -DCMAKE_BUILD_TYPE=Release
    -DCMAKE_INSTALL_PREFIX='/usr'
    -DBUILD_SHARED_LIBS=ON
    -DCMAKE_SKIP_RPATH=ON # Avoid an empty/CWD RUNPATH from CMake plus amdclang
    -DLLAMA_BUILD_TESTS=OFF
    -DLLAMA_USE_SYSTEM_GGML=OFF
    -DLLAMA_BUILD_WEBUI=ON
    -DGGML_ALL_WARNINGS=OFF
    -DGGML_ALL_WARNINGS_3RD_PARTY=OFF
    -DGGML_BUILD_EXAMPLES=OFF
    -DGGML_BUILD_TESTS=OFF
    -DGGML_LTO=ON
    -DGGML_RPC=ON
    # ROCm part
    # 偏向 512 宽度, 因为 zen5 原生支持 AVX-512
    # 激进的内联程度, 因为 zen5 的宽流水线需要减少函数边界
    # 更多的循环展开, 因为 zen5 的大型重排序缓冲区能够维持这些额外指令的在途执行
    -DCMAKE_HIP_FLAGS="-mprefer-vector-width=512 -mllvm -inline-threshold=600 -mllvm -unroll-threshold=150"
    -DAMDGPU_TARGETS="gfx1151"
    -DGGML_HIP=ON
    -DGGML_HIP_GRAPHS=ON
    -DGGML_HIP_NO_VMM=ON # Conservative default; retest VMM with each ROCm nightly
    -DGGML_CUDA_FORCE_MMQ=ON # 强制使用自定义乘法内核而非 fp16 cuBLAS. 可以加一点速并省一点显存
    # -DGGML_HIP_ROCWMMA_FATTN=ON # rocWMMA 开了也没啥用
    -DHIP_PLATFORM=amd # 手动指定 AMD 平台, 防止因 rocm-nightly 禁用自动检测而报错
    # HIP-only variant
    -DGGML_VULKAN=OFF

    -DGGML_CUDA_FA_QUANTS=all
    -DLLAMA_BUILD_NUMBER="${pkgver#b}" # 修正版本号
    -DLLAMA_BUILD_COMMIT="${_upstream_commit:0:7}"
    -Wno-dev
  )

  # 检查是否在 CI 环境中构建
  if [ -n "$CI" ] && [ "$CI" != 0 ]; then
    msg2 "CI = $CI detected, building universal package"
    # 启用通用构建
    _cmake_options+=(
      -DGGML_BACKEND_DL=ON
      -DGGML_CPU_ALL_VARIANTS=ON
      -DGGML_NATIVE=OFF
      # -DGGML_HIP_EXPORT_METRICS=ON # 允许内核 perf metrics

      # -DGGML_ZENDNN=ON
    )
  else
    # 本地构建, 针对当前设备优化
    _cmake_options+=(
      -DGGML_NATIVE=ON
    )
  fi

  # 允许用户自定义构建选项
  if [[ -n "$LLAMA_BUILD_EXTRA_ARGS" ]]; then
    msg2 "Applied custom CMake build args: $LLAMA_BUILD_EXTRA_ARGS"
    _cmake_options+=($LLAMA_BUILD_EXTRA_ARGS)
  fi

  # Do not let CMake's build-info probes mistake the parent AUR checkout for
  # the extracted upstream source repository.
  GIT_CEILING_DIRECTORIES="${srcdir}" cmake "${_cmake_options[@]}"
  cmake --build build -- -j $(nproc)
}

package() {
  DESTDIR="${pkgdir}" cmake --install build

  install -Dm644 "${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "llama.cpp.conf" "${pkgdir}/etc/conf.d/llama.cpp"
  install -Dm644 "llama.cpp.service" "${pkgdir}/usr/lib/systemd/system/llama.cpp.service"
  install -Dm644 "llama.cpp.sysusers" "${pkgdir}/usr/lib/sysusers.d/llama.cpp.conf"
  install -Dm644 "llama.cpp.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/llama.cpp.conf"

  msg2 "llama.cpp.service is now available"
  msg2 "llama-server arguments are in /etc/conf.d/llama.cpp"
}
