# Maintainer: Jacko Dirks < jacko dot dirks at gmail dot com>
pkgname=py3status-knmiweather
pkgdesc="Py3status module for displaying the local weather using the Dutch KNMI data"
pkgver=0.0.5
pkgrel=1
arch=('any')
license=('MIT')
depends=('python' 'py3status' 'python-netcdf4' 'python-numpy' 'python-requests')
makedepends=('python-build' 'python-installer')
url="https://codeberg.org/jackodirks/py3status-knmiweather"
source=("https://codeberg.org/jackodirks/py3status-knmiweather/archive/v$pkgver.tar.gz")
sha512sums=('cd2964093ae9229f24579277e71e2d83d8a67172d3618701a1b821d151b852fd0339960753d1260f36edea281d9d4bb00c52dbaf3035a860f2a468e6bc5f6360')

build() {
  cd "$srcdir/py3status-knmiweather"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/py3status-knmiweather"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
