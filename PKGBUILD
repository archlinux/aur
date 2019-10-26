# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-gorilla
pkgver=0.3.0
pkgrel=1
pkgdesc='python library that provides a convenient approach to monkey patching'
arch=('x86_64')
url='https://github.com/christophercrouzet/gorilla'
license=('MIT')
depends=('python')
optdepends=()
makedepends=('python' 'python-setuptools')
source=("$pkgname-$pkgver::https://github.com/christophercrouzet/gorilla/archive/v$pkgver.tar.gz")
sha256sums=('4614087a64e5a31d394ced603cc2657fd39a2104f56065ea6cf21e5e59b623e2')

_pkgname=gorilla

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir"/ --optimize=1
}
