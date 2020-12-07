# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=mavproxy
pkgver=1.8.29
pkgrel=1
pkgdesc='MAVLink proxy and command line ground station.'
arch=('any')
url='http://ardupilot.github.io/MAVProxy/html/index.html'
license=('GPL3')
depends=(python python-pymavlink)
makedepends=(python python-setuptools)
source=("$pkgname-$pkgver::https://pypi.org/packages/source/M/MAVProxy/MAVProxy-${pkgver}.tar.gz")
sha256sums=('8f5900dc0a404ab9cf5a00155f83e9aaeab18161ce21a352dfdcf2d7abf5d78e')

_pkgname=MAVProxy

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir" --optimize=1
}
