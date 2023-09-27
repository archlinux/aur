pkgname=python-langchain
pkgver=0.0.302
pkgrel=1
pkgdesc='⚡ Building applications with LLMs through composability ⚡ '
arch=(x86_64)
url='https://github.com/langchain-ai/langchain'
license=('MIT')
source=("https://github.com/langchain-ai/langchain/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('ac035e1ffd073e6c410e6238b25545f95a13c17be4403fe261930503a55578a278faf78152e49454dbc846ff560f00d8202b19b22c44b3eed2beb54e4e1229fd')
depends=(
    python-pyyaml
    python-sqlalchemy
    python-aiohttp
    python-dataclasses-json
    python-langsmith
    python-numexpr
    python-numpy
    python-pydantic
    python-requests
    python-tenacity
    python-jsonpatch

)
makedepends=(python-setuptools)

build() {
    cd langchain-$pkgver/libs/langchain
    python -m build --wheel --no-isolation
}

package() {
    cd langchain-$pkgver/libs/langchain
    python -m installer --destdir="$pkgdir" dist/*.whl
}
