pkgname=python-langsmith
pkgver=0.0.43
pkgrel=1
pkgdesc='LangSmith Client SDK Implementations '
arch=(x86_64)
url='https://github.com/langchain-ai/langsmith-sdk'
license=('MIT')
source=("https://github.com/langchain-ai/langsmith-sdk/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('2d6986ff2162d82c4574468485f5b3ebb39ab33f18bbecd6d7449cf9be55a5b2e856f1a554fdeff41289bab1051d0c33825e8e14a3987baf19c955126e39f41a')
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
