# Maintainer: Jacko Dirks < jacko dot dirks at gmail dot com>
pkgname=py3status-knmiweather
pkgdesc="Py3status module for displaying the local weather using the Dutch KNMI data"
pkgver=0.0.6
pkgrel=1
arch=('any')
license=('MIT')
depends=('python' 'py3status' 'python-netcdf4' 'python-numpy' 'python-requests')
makedepends=('python-build' 'python-installer')
url="https://codeberg.org/jackodirks/py3status-knmiweather"
source=("https://codeberg.org/jackodirks/py3status-knmiweather/archive/v$pkgver.tar.gz")
sha512sums=('13b8ad5b66d593faa63252728163e1b55229683661d39b681e012dbbd28173935135402f8ee6c338ee2da1d72cae60ec36f2c6780e203ba32eab7a698c588c0e')

build() {
  cd "$srcdir/py3status-knmiweather"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/py3status-knmiweather"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
