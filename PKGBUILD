# Maintainer: kmille <github@androidloves.me>

pkgname=python-ping3
_name=ping3
pkgver=4.0.0
pkgrel=1
arch=('any')
url="https://github.com/kyan001/ping3"
license=('MIT')
pkgdesc="Pure Python3 version of ICMP ping, shipped with command-line command"
depends=('python')
makedepends=(python-build python-installer python-wheel)
source=(https://github.com/kyan001/ping3/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('4b0abd0e68e481f2ab385150d3390b2384d93a1a64354e62033e99cb97d29054')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
