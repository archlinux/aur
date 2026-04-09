# Maintainer: phlppbmm <philipp.baumm@gmx.net>
pkgname=python-chromadb-bin
pkgver=1.5.7
pkgrel=1
pkgdesc="AI-native open-source embedding database (prebuilt)"
arch=('x86_64')
url="https://github.com/chroma-core/chroma"
license=('Apache-2.0')
depends=(
    'python>=3.9'
    'python-onnxruntime-cpu'
    'python-bcrypt'
    'python-fastapi'
    'python-grpcio'
    'python-httpx'
    'python-jsonschema'
    'python-kubernetes'
    'python-numpy'
    'python-opentelemetry-api'
    'python-opentelemetry-exporter-otlp-proto-grpc'
    'python-opentelemetry-sdk'
    'python-orjson'
    'python-overrides'
    'python-pydantic'
    'python-pyyaml'
    'python-rich'
    'python-tenacity'
    'python-tqdm'
    'python-typer'
    'python-typing_extensions'
    'uvicorn'
    'python-build'
    'python-chroma-hnswlib'
)
makedepends=('python-installer')
provides=('python-chromadb')
conflicts=('python-chromadb')

# chromadb wheel + pip-only deps that have no Arch package
_chromadb_whl="chromadb-${pkgver}-cp39-abi3-manylinux_2_17_x86_64.manylinux2014_x86_64.whl"
_tokenizers_whl="tokenizers-0.22.2-cp39-abi3-manylinux_2_17_x86_64.manylinux2014_x86_64.whl"
_pypika_whl="pypika-0.51.1-py2.py3-none-any.whl"
_posthog_whl="posthog-7.10.3-py3-none-any.whl"
_mmh3_whl="mmh3-5.2.1-cp314-cp314-manylinux1_x86_64.manylinux_2_28_x86_64.manylinux_2_5_x86_64.whl"
_pybase64_whl="pybase64-1.4.3-cp314-cp314-manylinux1_x86_64.manylinux2014_x86_64.manylinux_2_17_x86_64.manylinux_2_5_x86_64.whl"
_pydantic_settings_whl="pydantic_settings-2.13.1-py3-none-any.whl"
_importlib_resources_whl="importlib_resources-6.5.2-py3-none-any.whl"

source=(
    "https://files.pythonhosted.org/packages/e4/30/c81b33b2d8d3d03c4ca7364348e03e6e80d15b36dd6bd1ca6c22e03a89f5/${_chromadb_whl}"
    "https://files.pythonhosted.org/packages/2e/76/932be4b50ef6ccedf9d3c6639b056a967a86258c6d9200643f01269211ca/${_tokenizers_whl}"
    "https://files.pythonhosted.org/packages/57/83/c77dfeed04022e8930b08eedca2b6e5efed256ab3321396fde90066efb65/${_pypika_whl}"
    "https://files.pythonhosted.org/packages/2c/ec/d0050e82b4be2126f4769612f0ef9734348cb736a23754ea238202285343/${_posthog_whl}"
    "https://files.pythonhosted.org/packages/28/b0/3a0f85e00ee137ca44eb1fb1174b3c3a8bfb6b0f682186fec2b1cf8e934f/${_mmh3_whl}"
    "https://files.pythonhosted.org/packages/70/48/eb2820e498ee112e77b1d1f0bac79e62e6b70e3e84741ba71a3b9e8e7d5a/${_pybase64_whl}"
    "https://files.pythonhosted.org/packages/00/4b/ccc026168948fec4f7555b9164c724cf4125eac006e176541483d2c959be/${_pydantic_settings_whl}"
    "https://files.pythonhosted.org/packages/a4/ed/1f1afb2e9e7f38a545d628f864d562a5ae64fe6f7a10e28ffb9b185b4e89/${_importlib_resources_whl}"
)
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')
noextract=(
    "${_chromadb_whl}" "${_tokenizers_whl}" "${_pypika_whl}" "${_posthog_whl}"
    "${_mmh3_whl}" "${_pybase64_whl}" "${_pydantic_settings_whl}" "${_importlib_resources_whl}"
)

package() {
    for whl in "${srcdir}/"*.whl; do
        python -m installer --destdir="${pkgdir}" "$whl"
    done
}
