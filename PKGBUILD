pkgname=python-beancount-china-importers
pkgver=r86.e698dea
pkgrel=1
pkgdesc='Beancount importers for services frequently used in China'
arch=('x86_64')
makedepends=(git python-build python-installer python-wheel)
depends=(beancount python-pymupdf python-beautifulsoup4)
url="https://github.com/jiegec/china_bean_importers"
commit=e698dea2d93c65301997bc0c4cded78bbcab6fa3
source=("git+https://github.com/jiegec/china_bean_importers.git#commit=$commit")

sha256sums=('SKIP')

pkgver() {
  cd "china_bean_importers"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
    cd "china_bean_importers"
    python -m build --wheel --no-isolation
}

package() {
    cd "china_bean_importers"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

