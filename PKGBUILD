# Maintainer: Jacko Dirks < jacko dot dirks at gmail dot com>
pkgname=py3status-knmiweather
pkgdesc="Py3status module for displaying the local weather using the Dutch KNMI data"
pkgver=0.0.4
pkgrel=1
arch=('any')
license=('MIT')
depends=('python' 'py3status' 'python-netcdf4' 'python-numpy' 'python-requests')
makedepends=('python-build' 'python-installer')
url="https://codeberg.org/jackodirks/py3status-knmiweather"
source=("https://codeberg.org/jackodirks/py3status-knmiweather/archive/v$pkgver.tar.gz")
sha512sums=('707597b7d5db21ef0f174ed951965c1e428984cb775de4eb04d522aa7db5772d93f02825a67441a6810cd18ab2ee41c67765ed795f8bb74df8b91d5ff3402318')

build() {
  cd "$srcdir/py3status-knmiweather"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/py3status-knmiweather"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
