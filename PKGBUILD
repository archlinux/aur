# Maintainer: kmille <github@androidloves.me>

pkgname=python-ping3
_name=ping3
pkgver=5.1.6
pkgrel=1
arch=('any')
url="https://github.com/kyan001/ping3"
license=('MIT')
pkgdesc="Pure Python3 version of ICMP ping, shipped with command-line command"
depends=('python')
makedepends=(python-build python-installer python-wheel python-setuptools)
source=(https://github.com/kyan001/ping3/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('5783bac0453104bcac57db9441d4396b2cd7e240b242a134d4bcf1a729b99397')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
