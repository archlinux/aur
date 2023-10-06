pkgname=python-langchain
pkgver=0.0.309
pkgrel=1
pkgdesc='⚡ Building applications with LLMs through composability ⚡ '
arch=(x86_64)
url='https://github.com/langchain-ai/langchain'
license=('MIT')
source=("https://github.com/langchain-ai/langchain/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('7a2d17faaf99443372d00e3c5d9821c4caee0e9179742ecba9d9704601f83f6f68f8e2a98c158ecca496e0e56bdfd2940203960974dab84d452ce710679b1fd1')
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
