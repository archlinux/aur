# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-pydsdl
pkgver=1.9.3
pkgrel=1
pkgdesc='UAVCAN DSDL processing front end implemented in Python'
arch=('x86_64')
url='https://uavcan.org'
license=('MIT')
depends=('python' 'python-parsimonious' 'python-six')
optdepends=()
makedepends=('python' 'python-setuptools')
source=("${pkgname}-${pkgver}::https://github.com/UAVCAN/pydsdl/archive/$pkgver.tar.gz")
sha256sums=('b330da40cec7675f99bb9e2fb6524b1996c64e7f252faf1d85af9d79cd8b85b6')

_pkgname=pydsdl

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir"/ --optimize=1
}
