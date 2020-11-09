# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-pydsdl
pkgver=1.9.2
pkgrel=1
pkgdesc='UAVCAN DSDL processing front end implemented in Python'
arch=('x86_64')
url='https://uavcan.org'
license=('MIT')
depends=('python' 'python-parsimonious' 'python-six')
optdepends=()
makedepends=('python' 'python-setuptools')
source=("${pkgname}-${pkgver}::https://github.com/UAVCAN/pydsdl/archive/$pkgver.tar.gz")
sha256sums=('2fcf95f8b4c56b999f526bd37cd1a59abf930796e2f0532a58b50dac134fd3b7')

_pkgname=pydsdl

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir"/ --optimize=1
}
