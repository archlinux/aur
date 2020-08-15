# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-pymavlink
pkgver=2.4.9
pkgrel=1
pkgdesc='python MAVLink interface and utilities'
arch=('any')
url='https://github.com/ArduPilot/pymavlink/'
license=('LGPL v3')
depends=(python python-future python-lxml)
makedepends=(python python-setuptools)
source=("$pkgname-$pkgver::https://pypi.org/packages/source/p/pymavlink/pymavlink-${pkgver}.tar.gz")
sha256sums=('6049f270aa0a1013c7dcd32b9f4756d79b6a2ccf73babeca2c46b9e391e644fe')

_pkgname=pymavlink

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir" --optimize=1
}
