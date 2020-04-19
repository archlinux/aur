# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=mavproxy
pkgver=1.8.18
pkgrel=1
pkgdesc='MAVLink proxy and command line ground station.'
arch=('any')
url='http://ardupilot.github.io/MAVProxy/html/index.html'
license=('GPL3')
depends=(python python-pymavlink)
makedepends=(python python-setuptools)
source=("$pkgname-$pkgver::https://pypi.org/packages/source/M/MAVProxy/MAVProxy-${pkgver}.tar.gz")
sha256sums=('75db999c5f536777618d3959e85334fad7909ca40ae141302b9af390caa824ba')

_pkgname=MAVProxy

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir" --optimize=1
}
