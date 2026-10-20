# Maintainer: Smoolak <smoolak@gmail.com>

pkgname=python-onnx-simplifier
_pkgname=onnxsim
pkgver=0.8.1
pkgrel=1
pkgdesc='Simplify your ONNX model by removing redundant operators'
arch=('x86_64')
url='https://github.com/onnxsim/onnxsim'
license=('Apache-2.0' 'BSD-2-Clause' 'BSD-3-Clause' 'MIT')
depends=(
    'glibc'
    'libgcc'
    'libstdc++'
    'python'
    'python-numpy'
    'python-onnx'
    'python-onnxruntime'
    'python-protobuf'
    'python-rich'
    'python-typing_extensions'
)
makedepends=(
    'cmake'
    'nanobind'
    'ninja'
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
checkdepends=(
    'python-onnxscript'
    'python-pytest'
    'python-pytorch'
    'python-torchvision'
)
optdepends=(
    'python-pytorch: export and simplify PyTorch models with onnxsim.test_utils'
)
provides=('python-onnxsim')
# The stable-ABI wheel contains no usable debug symbols; makepkg would
# otherwise create an empty debug package with a dangling build-id symlink.
options=('!debug')
_optimizer_commit=8c13b168c37e74b610d0cccba4e9e01618c612a7
_onnx_commit=281e5e6accfd6113fd57d819ce47f32a937bb106
_blake3_commit=77b257eee7da5cd608eaf6be8343d3a4c9776af2
_optimizer_onnx_commit=a675fda12e0cbd4cca3bf33a59c54cf1f469658e
_protobuf_version=31.1
_abseil_version=20250127.0
source=(
    "$_pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
    "onnx-optimizer-$_optimizer_commit.tar.gz::https://github.com/onnxsim/optimizer/archive/$_optimizer_commit.tar.gz"
    "onnx-$_onnx_commit.tar.gz::https://github.com/onnxsim/onnx/archive/$_onnx_commit.tar.gz"
    "protobuf-$_protobuf_version.tar.gz::https://github.com/protocolbuffers/protobuf/releases/download/v$_protobuf_version/protobuf-$_protobuf_version.tar.gz"
    "abseil-cpp-$_abseil_version.tar.gz::https://github.com/abseil/abseil-cpp/archive/refs/tags/$_abseil_version.tar.gz"
    "blake3-$_blake3_commit.tar.gz::https://github.com/BLAKE3-team/BLAKE3/archive/$_blake3_commit.tar.gz"
    "onnx-$_optimizer_onnx_commit.tar.gz::https://github.com/onnxsim/onnx/archive/$_optimizer_onnx_commit.tar.gz"
    'offline-torchvision-tests.patch'
    'portable-qat-oracles.patch'
    'fresh-process-rss.patch'
    'qat-reference.py'
    'qat-reference-before_minibatch-qat.py::https://raw.githubusercontent.com/onnxsim/onnxsim/fed0a170b9a49a6e9bca4a4ce9cd87e761c033fa/onnxsim/qat.py'
    'qat-reference-before_minibatch-qat_graph.py::https://raw.githubusercontent.com/onnxsim/onnxsim/fed0a170b9a49a6e9bca4a4ce9cd87e761c033fa/onnxsim/qat_graph.py'
    'qat-reference-before_minibatch-graph_grad.py::https://raw.githubusercontent.com/onnxsim/onnxsim/fed0a170b9a49a6e9bca4a4ce9cd87e761c033fa/onnxsim/graph_grad.py'
    'qat-reference-before_minibatch-backend.py::https://raw.githubusercontent.com/onnxsim/onnxsim/fed0a170b9a49a6e9bca4a4ce9cd87e761c033fa/onnxsim/backend.py'
    'qat-reference-before_activation-qat.py::https://raw.githubusercontent.com/onnxsim/onnxsim/ad43614b4d115f828a9feba07591171f8c7d5335/onnxsim/qat.py'
    'qat-reference-before_activation-qat_graph.py::https://raw.githubusercontent.com/onnxsim/onnxsim/ad43614b4d115f828a9feba07591171f8c7d5335/onnxsim/qat_graph.py'
    'qat-reference-before_activation-graph_grad.py::https://raw.githubusercontent.com/onnxsim/onnxsim/ad43614b4d115f828a9feba07591171f8c7d5335/onnxsim/graph_grad.py'
    'qat-reference-before_activation-backend.py::https://raw.githubusercontent.com/onnxsim/onnxsim/ad43614b4d115f828a9feba07591171f8c7d5335/onnxsim/backend.py'
)
sha256sums=(
    '3527db9be7565d2ac6fb3b136ae3c3832e20327954b283a18971a83b7a814b22'
    '5a852d030e7a8e136e787e98ba0fc7cc773c1583d4a07f6ff83a28ea8125228b'
    'e3ed4d657de0f3bc465117021e38271b7581f2f531811fce3cb766230ae25ad6'
    '12bfd76d27b9ac3d65c00966901609e020481b9474ef75c7ff4601ac06fa0b82'
    '16242f394245627e508ec6bb296b433c90f8d914f73b9c026fddb905e27276e8'
    '82ffb1a26829fa1ad735cb60f64508fa3e6765ec015e6fefbcb7ae0503723506'
    '17d18591f836815166e992ec52ce65201327c6288b23072e9a24578fe18c35c9'
    '7bdac7e41b8d71f409c2c030e37afdf429308f16015c79611d58f6c4039b68a4'
    'a162ba33a99c823a7472e53113c5194b6c86d8610e5d768ca35e7172a2cd1c30'
            'a55900e75f7738e115d113b92f77e146c65d23fef559be39a564d9f127eef215'
    'edcc32e85fc37bbcba999078c646f37178744019ce6b083c577f66a2438d8dc1'
    '3bb8a7ba1efa12ba45b08e5a16fc235d74fa1d34fd5fb651c74f4487b65dc595'
    '04c425a2d55743ec72bc028d4c485086d1a13f26117b6b763918be21f90f8d3c'
    'c729a16bec9fe1a4c8c69d5064a235e4399afb6bab11a6117267a8de24f617f6'
    'dc36ef494145f7230eb366e692478d89c05c07a7c4e13cf22b169bf8496e8732'
    '146cfc82efe389e1c7ce3e004a746f7ebb1576cbb9e84b053723f998c1a9ec18'
    '64de199a5b82c112428542d5d9d2dcab5e62bc06668facb7dc59160b2303ff98'
    'c729a16bec9fe1a4c8c69d5064a235e4399afb6bab11a6117267a8de24f617f6'
    '293d6a031a64e1170c20f3e596edb771a33fa5ad62fa4067f1c9533249965c7a'
)

prepare() {
    cd "$_pkgname-$pkgver"

    # GitHub release archives do not include submodules. Populate the exact
    # commits recorded by the v0.8.1 tag from separately checksummed sources.
    rm -rf third_party/onnx-optimizer third_party/onnx third_party/blake3
    install -d third_party/onnx-optimizer third_party/onnx third_party/blake3
    cp -a "$srcdir/optimizer-$_optimizer_commit/." third_party/onnx-optimizer/
    cp -a "$srcdir/onnx-$_onnx_commit/." third_party/onnx/
    install -d third_party/onnx-optimizer/third_party/onnx
    cp -a "$srcdir/onnx-$_optimizer_onnx_commit/." third_party/onnx-optimizer/third_party/onnx/
    cp -a "$srcdir/BLAKE3-$_blake3_commit/." third_party/blake3/
    install -d third_party/onnx-optimizer/third_party/blake3
    cp -a "$srcdir/BLAKE3-$_blake3_commit/." third_party/onnx-optimizer/third_party/blake3/

    # Shape(start/end) creates a sliced dimension vector. The optimizer must
    # index that vector, not the unsliced input dimensions, for a later Slice.
    sed -i 's/const auto \&d = dims_of_shape_node_input\[slice_start\];/const auto \&d = result_of_shape_op[slice_start];/g' \
        third_party/onnx-optimizer/onnxoptimizer/passes/eliminate_slice_after_shape.h
    # Reshape is only composable when the second shape does not copy zero
    # dimensions from the intermediate tensor. Unknown shapes may contain
    # such zeros too; preserve the first reshape unless safety is proven.
    python - <<'PY'
from pathlib import Path
p=Path('third_party/onnx-optimizer/onnxoptimizer/passes/eliminate_consecutive_idempotent_ops.h')
s=p.read_text()
old='''          node->input(0)->uses().size() == 1) {
        return true;'''
new='''          node->input(0)->uses().size() == 1) {
        if (node->kind() == kReshape &&
            !(node->hasAttribute(Symbol("allowzero")) &&
              node->i(Symbol("allowzero")) == 1)) {
          const auto* shape = FetchConstantTensor(node->input(1));
          if (!shape || shape->elem_type() != TensorProto_DataType_INT64)
            return false;
          for (const auto dim : ParseTensorData<int64_t>(shape))
            if (dim == 0) return false;
        }
        return true;'''
assert s.count(old)==1
p.write_text(s.replace(old,new))
PY
    install -m644 /dev/stdin tests/test_shape_slice_regression.py <<'PY'
import numpy as np
import onnxruntime as ort
import pytest
from onnx import TensorProto, helper
from onnxsim import simplify
from onnxsim.onnx_simplifier import C

@pytest.mark.parametrize('step,end', [(1, 1), (-1, -3)])
def test_slice_uses_shape_start_offset(step, end):
    constants = [helper.make_tensor(name, TensorProto.INT64, [1], [value])
                 for name, value in [('starts', 0), ('ends', end), ('axes', 0), ('steps', step)]]
    model = helper.make_model(helper.make_graph([
        helper.make_node('Shape', ['x'], ['shape'], start=1),
        helper.make_node('Slice', ['shape', 'starts', 'ends', 'axes', 'steps'], ['y']),
    ], 'shape_slice', [helper.make_tensor_value_info('x', TensorProto.FLOAT, [2, 3, 'N'])],
    [helper.make_tensor_value_info('y', TensorProto.INT64, [1])], initializer=constants),
    opset_imports=[helper.make_opsetid('', 18)], ir_version=10)
    optimized, _ = simplify(model, skip_constant_folding=True,
        skipped_optimizers=[p for p in C._list_optimizers() if p != 'eliminate_slice_after_shape'])
    for graph in (model, optimized):
        session = ort.InferenceSession(graph.SerializeToString(), providers=['CPUExecutionProvider'])
        inputs = {'x': np.zeros((2, 3, 4), dtype=np.float32)} if session.get_inputs() else {}
        np.testing.assert_array_equal(session.run(None, inputs)[0], [3])

@pytest.mark.parametrize('dynamic', [False, True])
def test_consecutive_reshape_zero_copies_intermediate_dimension(dynamic):
    inputs=[helper.make_tensor_value_info('x', TensorProto.FLOAT, ['N', 3, 4])]
    constants=[helper.make_tensor('first', TensorProto.INT64, [2], [3, -1])]
    if dynamic:
        inputs.append(helper.make_tensor_value_info('second', TensorProto.INT64, [2]))
    else:
        constants.append(helper.make_tensor('second', TensorProto.INT64, [2], [0, -1]))
    model=helper.make_model(helper.make_graph([
        helper.make_node('Reshape',['x','first'],['middle']),
        helper.make_node('Reshape',['middle','second'],['y'])
    ],'reshape_zero',inputs,[helper.make_tensor_value_info('y',TensorProto.FLOAT,[3,None])],initializer=constants),
    opset_imports=[helper.make_opsetid('',18)],ir_version=10)
    optimized,_=simplify(model,skip_constant_folding=True,
        skipped_optimizers=[p for p in C._list_optimizers() if p!='eliminate_consecutive_idempotent_ops'])
    x=np.arange(24,dtype=np.float32).reshape(2,3,4)
    for graph in (model,optimized):
        session=ort.InferenceSession(graph.SerializeToString(),providers=['CPUExecutionProvider'])
        feed={'x':x}
        if dynamic: feed['second']=np.array([0,-1],dtype=np.int64)
        np.testing.assert_array_equal(session.run(None,feed)[0],x.reshape(3,8))
PY

    # The release archive's VERSION file is stale (0.6.2).
    printf '%s\n' "$pkgver" > VERSION

    # torchvision's deprecated pretrained=False leaves pretrained backbone
    # weights enabled in current releases, causing four tests to access the
    # network. Explicit None values preserve those tests as offline coverage.
    patch -Np1 -i "$srcdir/offline-torchvision-tests.patch"
}

build() {
    cd "$_pkgname-$pkgver"

    # A private static protobuf avoids duplicate ONNX descriptor registration
    # with python-onnx's protobuf at import time. Supply protobuf and the Abseil
    # version it fetches as local sources so CMake cannot access the network.
    export CMAKE_GENERATOR=Ninja
    export CMAKE_BUILD_PARALLEL_LEVEL="${CMAKE_BUILD_PARALLEL_LEVEL:-$(nproc)}"
    export CMAKE_ARGS="\
        -DONNXSIM_BUILTIN_ORT=OFF \
        -DONNX_OPT_USE_SYSTEM_PROTOBUF=OFF \
        -DFETCHCONTENT_FULLY_DISCONNECTED=ON \
        -DFETCHCONTENT_SOURCE_DIR_PROTOBUF=$srcdir/protobuf-$_protobuf_version \
        -DFETCHCONTENT_SOURCE_DIR_ABSL=$srcdir/abseil-cpp-$_abseil_version"
    export ONNXSIM_RELEASE="$pkgver"

    python -m build --wheel --no-isolation
}

check() {
    cd "$_pkgname-$pkgver"
    local _site_packages
    _site_packages="$(python -c 'import sysconfig; print(sysconfig.get_path("purelib"))')"

    rm -rf "$srcdir/test-root" "$srcdir/test-run"
    python -m installer --destdir="$srcdir/test-root" dist/*.whl
    install -d "$srcdir/test-run"
    cp -a tests "$srcdir/test-run/"
    # QNN tests import their source-shipped helpers before applying the
    # upstream unavailable-provider skip. Preserve that relative layout.
    cp -a scripts docs bench tools "$srcdir/test-run/"
    # Source-only fixtures and mock compiler-command helpers are not Python
    # implementation substitutes; tests still import the staged wheel.
    cp onnxsim/qat_parity_fixtures.txt "$srcdir/test-root$_site_packages/onnxsim/"
    cp -a scripts "$srcdir/test-root$_site_packages/"
    # New tests resolve package modules relative to their test directory.
    # Point that path at the installed wheel rather than upstream sources.
    ln -s "$srcdir/test-root$_site_packages/onnxsim" "$srcdir/test-run/onnxsim"
    cd "$srcdir/test-run"

    # The original numerical oracles were recorded on a different dependency
    # stack. Compare with pinned historical upstream code on this stack,
    # retaining structural assertions and byte-for-byte model equality.
    patch -Np1 --fuzz=0 -i "$srcdir/portable-qat-oracles.patch"
    patch -Np1 --fuzz=0 -i "$srcdir/fresh-process-rss.patch"
    install -m644 "$srcdir/qat-reference.py" tests/qat_reference.py
    install -d tests/qat-reference-sources
    install -m644 "$srcdir"/qat-reference-before_*.py tests/qat-reference-sources/

    # test_timm.py unconditionally downloads pretrained Swin weights from the
    # live network. All self-contained upstream tests run against the staged wheel.
    PYTHONPATH="$srcdir/test-root$_site_packages" \
        PATH="$srcdir/test-root/usr/bin:$PATH" \
        python -m pytest -v tests --ignore=tests/test_timm.py

    # Exercise the staged wheel on a representative constant-folding workflow.
    PYTHONPATH="$srcdir/test-root$_site_packages" \
        PATH="$srcdir/test-root/usr/bin:$PATH" \
        python - <<'PY'
import numpy as np
import onnx
import onnxruntime as ort
from onnx import TensorProto, helper, numpy_helper
from onnxsim import simplify

x = helper.make_tensor_value_info("x", TensorProto.FLOAT, [2])
y = helper.make_tensor_value_info("y", TensorProto.FLOAT, [2])
c2 = numpy_helper.from_array(np.array([2.0], dtype=np.float32), name="c2")
c3 = numpy_helper.from_array(np.array([3.0], dtype=np.float32), name="c3")
graph = helper.make_graph(
    [
        helper.make_node("Add", ["c2", "c3"], ["c5"]),
        helper.make_node("Mul", ["x", "c5"], ["y"]),
    ],
    "constant-folding",
    [x],
    [y],
    [c2, c3],
)
model = helper.make_model(
    graph, opset_imports=[helper.make_opsetid("", 13)], ir_version=10
)
simplified, check_ok = simplify(model, check_n=1)
assert check_ok
assert [node.op_type for node in simplified.graph.node] == ["Mul"]
onnx.checker.check_model(simplified)
session = ort.InferenceSession(
    simplified.SerializeToString(), providers=["CPUExecutionProvider"]
)
actual = session.run(None, {"x": np.array([1.0, 4.0], dtype=np.float32)})[0]
np.testing.assert_allclose(actual, np.array([5.0, 20.0], dtype=np.float32))
PY
}

package() {
    cd "$_pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 \
        third_party/onnx/LICENSES/BSD-2-Clause.txt \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE.BSD-2-Clause"
    install -Dm644 "$srcdir/protobuf-$_protobuf_version/LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE.protobuf"
    install -Dm644 "$srcdir/protobuf-$_protobuf_version/third_party/utf8_range/LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE.utf8-range"
    install -Dm644 "$srcdir/abseil-cpp-$_abseil_version/LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE.abseil"
    install -Dm644 third_party/blake3/LICENSE_A2 "$pkgdir/usr/share/licenses/$pkgname/LICENSE.blake3-apache"
    install -Dm644 third_party/blake3/LICENSE_CC0 "$pkgdir/usr/share/licenses/$pkgname/LICENSE.blake3-cc0"
    install -Dm644 /usr/share/licenses/nanobind/LICENSE \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE.nanobind"
}
