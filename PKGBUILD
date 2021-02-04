# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=mavproxy
pkgver=1.8.31
pkgrel=1
pkgdesc='MAVLink proxy and command line ground station.'
arch=('any')
url='http://ardupilot.github.io/MAVProxy/html/index.html'
license=('GPL3')
depends=(python python-pymavlink)
makedepends=(python python-setuptools)
source=("$pkgname-$pkgver::https://pypi.org/packages/source/M/MAVProxy/MAVProxy-${pkgver}.tar.gz")
sha256sums=('51d4a21372fcac615a0191cb29c444889ecfede402e95c847346842400a86273')

_pkgname=MAVProxy

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir" --optimize=1
}
