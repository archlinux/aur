# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-qtm
pkgver=2.1.2
pkgrel=1
pkgdesc='Python implementation of the real-time protocol for Qualisys Track
Manager'
arch=('any')
url='https://qualisys.github.io/qualisys_python_sdk/index.html'
license=('MIT')
depends=(python)
makedepends=(python python-setuptools)
source=("$pkgname-$pkgver.tar.gz::https://github.com/qualisys/qualisys_python_sdk/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('a30472e63e17c8e8e8a289adb1e9af942f22fd8ce1ba9740519b3527246857dd')

_pkgname=qualisys_python_sdk

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir"/ --optimize=1
}
