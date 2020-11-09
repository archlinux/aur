# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-reconchess
pkgver=1.6.7
pkgrel=1
pkgdesc='ReconChess python implementation'
arch=(any)
url='https://github.com/reconnaissanceblindchess/reconchess'
license=('BSD-3-Clause')
depends=('python' 'python-chess' 'python-pygame' 'python-lxml'
         'python-requests')
makedepends=('python' 'python-setuptools')
source=("$pkgname-$pkgver::https://pypi.org/packages/source/r/reconchess/reconchess-${pkgver}.tar.gz")
sha256sums=('b282e3c78a5df8e9557ffb994f5ec559faf3284ec14f515c00cea89b55bc288d')

_pkgname=reconchess

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir"/ --optimize=1
}
