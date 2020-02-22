# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-reconchess
pkgver=1.6.1
pkgrel=1
pkgdesc='ReconChess python implementation'
arch=(any)
url='https://github.com/reconnaissanceblindchess/reconchess'
license=('BSD-3-Clause')
depends=('python' 'python-chess' 'python-pygame' 'python-lxml'
         'python-requests')
makedepends=('python' 'python-setuptools')
source=("$pkgname-$pkgver::https://github.com/reconnaissanceblindchess/reconchess/archive/v$pkgver.tar.gz")
sha256sums=('4bb454f47ff009313cf6a67b1148a88f3a898be703716d9509eb1ad3ef629ac3')

_pkgname=reconchess

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir"/ --optimize=1
}
