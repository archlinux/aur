pkgname=python-langsmith
pkgver=0.0.69
pkgrel=1
pkgdesc='LangSmith Client SDK Implementations '
arch=(x86_64)
url='https://github.com/langchain-ai/langsmith-sdk'
license=('MIT')
source=("https://github.com/langchain-ai/langsmith-sdk/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('9e63043d86ba4f1d2b6ac2e0b485e8062ee1e7fd5f17a4471ed4cc68259cd32d5b52f9f4c748989b4f3859152dbae37c4b7003b108fb90e9d24df404d629694b')
depends=(python python-pydantic python-requests)
depends+=(python-pandas python-psutil python-langchain)
makedepends=(python-build python-installer python-wheel python-poetry)

build() {
    cd langsmith-sdk-$pkgver/python
    python -m build --wheel --no-isolation
}

package() {
    cd langsmith-sdk-$pkgver/python
    python -m installer --destdir="$pkgdir" dist/*.whl
}
