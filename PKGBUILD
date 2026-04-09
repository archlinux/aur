# Maintainer: phlppbmm <philipp.baumm@gmx.net>
pkgname=python-chromadb-bin
pkgver=1.5.7
pkgrel=4
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
    'python-pydantic-settings'
    'python-importlib_resources'
)
makedepends=('python-installer')
provides=('python-chromadb')
conflicts=('python-chromadb')
source=(
    "https://files.pythonhosted.org/packages/e4/30/c81b33b2d8d3d03c4ca7364348e03e6e80d15b36dd6bd1ca6c22e03a89f5/chromadb-${pkgver}-cp39-abi3-manylinux_2_17_x86_64.manylinux2014_x86_64.whl"
    "https://files.pythonhosted.org/packages/2e/76/932be4b50ef6ccedf9d3c6639b056a967a86258c6d9200643f01269211ca/tokenizers-0.22.2-cp39-abi3-manylinux_2_17_x86_64.manylinux2014_x86_64.whl"
    "https://files.pythonhosted.org/packages/57/83/c77dfeed04022e8930b08eedca2b6e5efed256ab3321396fde90066efb65/pypika-0.51.1-py2.py3-none-any.whl"
    "https://files.pythonhosted.org/packages/2c/ec/d0050e82b4be2126f4769612f0ef9734348cb736a23754ea238202285343/posthog-7.10.3-py3-none-any.whl"
    "https://files.pythonhosted.org/packages/b6/71/c1a60c1652b8813ef9de6d289784847355417ee0f2980bca002fe87f4ae5/mmh3-5.2.1-cp314-cp314-manylinux1_x86_64.manylinux_2_28_x86_64.manylinux_2_5_x86_64.whl"
    "https://files.pythonhosted.org/packages/68/6d/84ce50e7ee1ae79984d689e05a9937b2460d4efa1e5b202b46762fb9036c/pybase64-1.4.3-cp314-cp314-manylinux1_x86_64.manylinux2014_x86_64.manylinux_2_17_x86_64.manylinux_2_5_x86_64.whl"
)
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')
noextract=(${source[@]##*/})

package() {
    for whl in "${srcdir}/"*.whl; do
        python -m installer --destdir="${pkgdir}" "$whl"
    done
}
