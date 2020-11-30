# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=mavproxy
pkgver=1.8.27
pkgrel=1
pkgdesc='MAVLink proxy and command line ground station.'
arch=('any')
url='http://ardupilot.github.io/MAVProxy/html/index.html'
license=('GPL3')
depends=(python python-pymavlink)
makedepends=(python python-setuptools)
source=("$pkgname-$pkgver::https://pypi.org/packages/source/M/MAVProxy/MAVProxy-${pkgver}.tar.gz")
sha256sums=('f3c704e2d67b36e4932896abe00c89e7f3fb7458fc52849b5d7d6d83bd623adf')

_pkgname=MAVProxy

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir" --optimize=1
}
