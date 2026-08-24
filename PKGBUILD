# Maintainer: Mark Collins <tera_1225 [aaht] hotmail ðot com>
pkgname=python-free-proxy
_name="free_proxy"
pkgver=1.2.3
pkgrel=1
pkgdesc="Free proxy scraper written in python"
arch=(any)
url="https://github.com/jundymek/free-proxy"
license=('MIT')
depends=(
  python
  python-lxml
  python-requests
)
makedepends=(
    python-build
    python-installer
    python-setuptools
    python-wheel
)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('292627d8f414d2b424f44e68d1756436a696e4312cde776bceb08cbc569271c6')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    mkdir -p "$pkgdir/usr/share/licenses/python-free-proxy/"
    cp LICENSE "$pkgdir/usr/share/licenses/python-free-proxy/"
}
