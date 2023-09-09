pkgname=python-langchain
pkgver=0.0.285
pkgrel=1
pkgdesc='⚡ Building applications with LLMs through composability ⚡ '
arch=(x86_64)
url='https://github.com/langchain-ai/langchain'
license=('MIT')
source=("https://github.com/langchain-ai/langchain/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('8ba07547daa31a6a61949fb19e3477c85942f4537084795a6b169afcf216843fe1b0bb02844d067218f5d9a1fb2159246fa0e0516c20e0b73528a19251a8904d')
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

)
makedepends=(python-build python-installer python-wheel)

build() {
    cd langchain-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd langchain-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
