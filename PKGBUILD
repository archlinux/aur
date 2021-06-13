# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-gorilla
pkgver=0.4.0
pkgrel=1
pkgdesc='python library that provides a convenient approach to monkey patching'
arch=('x86_64')
url='https://github.com/christophercrouzet/gorilla'
license=('MIT')
depends=('python')
optdepends=()
makedepends=('python' 'python-setuptools')
source=("$pkgname-$pkgver::https://github.com/christophercrouzet/gorilla/archive/v$pkgver.tar.gz")
sha256sums=('d3ddcc5f485fb8bd9015e56f58b69c6c52112573fb0004b076f91978da5d5c0d')

_pkgname=gorilla

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir"/ --optimize=1
}
