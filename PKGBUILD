# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-qtm
pkgver=2.1.1
pkgrel=1
pkgdesc='Python implementation of the real-time protocol for Qualisys Track
Manager'
arch=('any')
url='https://qualisys.github.io/qualisys_python_sdk/index.html'
license=('MIT')
depends=(python)
makedepends=(python python-setuptools)
source=("$pkgname-$pkgver.tar.gz::https://github.com/qualisys/qualisys_python_sdk/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('0d77fd90f3e83cf8ee2d2afeda056887e933f3a28e3eb6df9ccf4439efc00699')

_pkgname=qualisys_python_sdk

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir"/ --optimize=1
}
