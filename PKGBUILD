# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-pydsdl
pkgver=1.16.0
pkgrel=1
pkgdesc='UAVCAN DSDL processing front end implemented in Python'
arch=('x86_64')
url='https://uavcan.org'
license=('MIT')
depends=('python' 'python-parsimonious' 'python-six')
optdepends=()
makedepends=('python' 'python-setuptools')
source=("${pkgname}-${pkgver}::https://github.com/UAVCAN/pydsdl/archive/$pkgver.tar.gz")
sha256sums=('c531c0d953ba7e3f3dee5f74f3ab3af563ae72a82ca6a2e5733d2a08f10d0ac7')

_pkgname=pydsdl

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir"/ --optimize=1
}
