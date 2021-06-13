# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-pymavlink
pkgver=2.4.15
pkgrel=1
pkgdesc='python MAVLink interface and utilities'
arch=('any')
url='https://github.com/ArduPilot/pymavlink/'
license=('LGPL v3')
depends=(python python-future python-lxml)
makedepends=(python python-setuptools)
source=("$pkgname-$pkgver.tar.gz::https://pypi.org/packages/source/p/pymavlink/pymavlink-${pkgver}.tar.gz")
sha256sums=('7bf45ad4a250e5e9928c33b5ff56afed4dbc6f99c8f58d05051e2a308150db80')

_pkgname=pymavlink

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir" --optimize=1
}
