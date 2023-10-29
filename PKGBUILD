pkgname=python-langsmith
pkgver=0.0.53
pkgrel=1
pkgdesc='LangSmith Client SDK Implementations '
arch=(x86_64)
url='https://github.com/langchain-ai/langsmith-sdk'
license=('MIT')
source=("https://github.com/langchain-ai/langsmith-sdk/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('bae9c99a6bad157122222deaa13edbf930dc8253cc37d166132be34733b50bdfc0ddcbf045d617236ae7ec0c3b59116947c36a0e7ba158fe16e7102e81c044be')
depends=(
    python-pydantic
    python-requests  
    python-psutil python-langchain python-pandas
)
makedepends=(python-build python-installer python-wheel python-poetry)

build() {
    cd langsmith-sdk-$pkgver/python
    python -m build --wheel --no-isolation
}

package() {
    cd langsmith-sdk-$pkgver/python
    python -m installer --destdir="$pkgdir" dist/*.whl
}
