# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=mavproxy
pkgver=1.8.22
pkgrel=1
pkgdesc='MAVLink proxy and command line ground station.'
arch=('any')
url='http://ardupilot.github.io/MAVProxy/html/index.html'
license=('GPL3')
depends=(python python-pymavlink)
makedepends=(python python-setuptools)
source=("$pkgname-$pkgver::https://pypi.org/packages/source/M/MAVProxy/MAVProxy-${pkgver}.tar.gz")
sha256sums=('87d7f9c0b8f4f1db3ce3521f67cd244fe3b89ffead797e92f35a7f71bbe8b958')

_pkgname=MAVProxy

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir" --optimize=1
}
