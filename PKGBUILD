pkgname=python-langchain
pkgver=0.0.325
pkgrel=1
pkgdesc='⚡ Building applications with LLMs through composability ⚡ '
arch=(x86_64)
url='https://github.com/langchain-ai/langchain'
license=('MIT')
source=("https://github.com/langchain-ai/langchain/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('adfe1fdf2688306ab531bcb0b9dd86f996b9d85f702d55ec84bc9cdb7dee414c2c2a250225a7b321d16e2941995b9b6a97a4aa12d4de483a8e768595af3eb2de')
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
