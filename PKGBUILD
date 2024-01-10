# Maintainer: Mark Collins <tera_1225 [aaht] hotmail ðot com>
pkgname=python-free-proxy
_name="free_proxy"
pkgver=1.1.1
pkgrel=1
pkgdesc="Free proxy scraper written in python"
arch=(any)
url="https://github.com/jundymek/free-proxy"
license=('LGPL')
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
sha256sums=('2b20eb863972b42984292cee17132f4c9ddb8fef0a9bee9bc15215a08e6899fb')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
