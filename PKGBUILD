# Maintainer: Jacko Dirks < jacko dot dirks at gmail dot com>
pkgname=py3status-knmiweather
pkgdesc="Py3status module for displaying the local weather using the Dutch KNMI data"
pkgver=0.0.9
pkgrel=1
arch=('any')
license=('MIT')
depends=('python' 'py3status' 'python-netcdf4' 'python-numpy' 'python-requests')
makedepends=('python-build' 'python-installer' 'python-setuptools-scm')
url="https://codeberg.org/jackodirks/py3status-knmiweather"
source=("git+https://codeberg.org/jackodirks/py3status-knmiweather.git#tag=v$pkgver")
sha512sums=('SKIP')

build() {
  cd "$srcdir/py3status-knmiweather"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/py3status-knmiweather"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
