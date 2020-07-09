# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-qtm
pkgver=2.0.1
pkgrel=1
pkgdesc='Python implementation of the real-time protocol for Qualisys Track
Manager'
arch=('any')
url='https://qualisys.github.io/qualisys_python_sdk/index.html'
license=('MIT')
depends=(python)
makedepends=(python python-setuptools)
source=("$pkgname-$pkgver.tar.gz::https://github.com/qualisys/qualisys_python_sdk/archive/v$pkgver.tar.gz")
sha256sums=('917a6bce8986d443c77208fc83ca83b046896a011c5da998141ebab1e53eecf8')

_pkgname=qualisys_python_sdk

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir"/ --optimize=1
}
