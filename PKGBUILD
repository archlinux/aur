# Maintainer: Jacko Dirks < jacko dot dirks at gmail dot com>
pkgname=py3status-knmiweather
pkgdesc="Py3status module for displaying the local weather using the Dutch KNMI data"
pkgver=0.0.8
pkgrel=1
arch=('any')
license=('MIT')
depends=('python' 'py3status' 'python-netcdf4' 'python-numpy' 'python-requests')
makedepends=('python-build' 'python-installer')
url="https://codeberg.org/jackodirks/py3status-knmiweather"
source=("https://codeberg.org/jackodirks/py3status-knmiweather/archive/v$pkgver.tar.gz")
sha512sums=('b0432b9d7baf3ebc05d66e13715da1d638a991a5db108b8a5be48774db69c3363aee0f25583d02524d7e83c1fbcc21ae7d49ce291e99be4cdae33e0b1f20c19a')

build() {
  cd "$srcdir/py3status-knmiweather"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/py3status-knmiweather"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
