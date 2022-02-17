# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-reconchess
pkgver=1.6.9
pkgrel=1
pkgdesc='ReconChess python implementation'
arch=(any)
url='https://github.com/reconnaissanceblindchess/reconchess'
license=('BSD-3-Clause')
depends=('python' 'python-chess' 'python-pygame' 'python-lxml'
         'python-requests')
makedepends=('python' 'python-setuptools')
source=("$pkgname-$pkgver::https://github.com/reconnaissanceblindchess/reconchess/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('afc7349605bb8f9ed0c794ffc097a82dd0b8b18bfc90d43b1171006695eebdeb')

_pkgname=reconchess

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir"/ --optimize=1
}
