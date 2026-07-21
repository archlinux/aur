# Maintainer: Jacko Dirks < jacko dot dirks at gmail dot com>
pkgname=py3status-knmiweather
pkgdesc="Py3status module for displaying the local weather using the Dutch KNMI data"
pkgver=0.0.7
pkgrel=1
arch=('any')
license=('MIT')
depends=('python' 'py3status' 'python-netcdf4' 'python-numpy' 'python-requests')
makedepends=('python-build' 'python-installer')
url="https://codeberg.org/jackodirks/py3status-knmiweather"
source=("https://codeberg.org/jackodirks/py3status-knmiweather/archive/v$pkgver.tar.gz")
sha512sums=('10d2f51212f5d60327f2375f88a7544eaf4ba235a5d7984ba8daf79e35ab3fc9e35f175658f69cae51c337ec64592b793309eda40600e0808c58689e204d8ab5')

build() {
  cd "$srcdir/py3status-knmiweather"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/py3status-knmiweather"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
