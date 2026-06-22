# Maintainer: Mark Collins <tera_1225 [aaht] hotmail ðot com>
pkgname=python-free-proxy
_name="free_proxy"
pkgver=1.2.1
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
sha256sums=('a8dd3f8173b1d305e9845b4ea1be39334cb95557cdb5716d1e317ee0cee8b1a1')

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
