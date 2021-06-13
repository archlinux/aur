# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-reconchess
pkgver=1.6.8
pkgrel=1
pkgdesc='ReconChess python implementation'
arch=(any)
url='https://github.com/reconnaissanceblindchess/reconchess'
license=('BSD-3-Clause')
depends=('python' 'python-chess' 'python-pygame' 'python-lxml'
         'python-requests')
makedepends=('python' 'python-setuptools')
source=("$pkgname-$pkgver::https://pypi.org/packages/source/r/reconchess/reconchess-${pkgver}.tar.gz")
sha256sums=('81a317058325d955a15488c8ea0a7e0398274f18fa5ffbdf8248e48aa60f669b')

_pkgname=reconchess

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir"/ --optimize=1
}
