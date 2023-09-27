pkgname=python-langsmith
pkgver=0.0.41
pkgrel=1
pkgdesc='LangSmith Client SDK Implementations '
arch=(x86_64)
url='https://github.com/langchain-ai/langsmith-sdk'
license=('MIT')
source=("https://github.com/langchain-ai/langsmith-sdk/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('481160f1e1d4cbdd5250bde8237204386afc9070307bc4461bf6d518b65e2c3e83efb3e81636ca97ec941146b4d12df6c77480615450c9de28b7831c4c1963ca')
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
