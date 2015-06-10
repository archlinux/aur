# Maintainer: Marco Maso <demind@gmail.com>
# Contributor: Adrian Benson <adrian_benson@yahoo.co.nz>

pkgname=qrupdate
pkgver=1.1.2
_pkgver=1.2
pkgrel=2
pkgdesc="Fortran library for fast updates of QR and Cholesky decompositions"
url="http://sourceforge.net/projects/qrupdate"
makedepends=('gcc-fortran')
depends=('lapack')
arch=('i686' 'x86_64')
license=('GPL3')
source=( http://sunet.dl.sourceforge.net/project/qrupdate/qrupdate/$_pkgver/$pkgname-$pkgver.tar.gz)
options=('!makeflags')
md5sums=('6d073887c6e858c24aeda5b54c57a8c4')

build() {
  cd "$srcdir"/$pkgname-$pkgver

  make PREFIX=/usr solib
}

check() {
  cd "$srcdir"/$pkgname-$pkgver

  make test
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make PREFIX=/usr DESTDIR="$pkgdir" install
}
