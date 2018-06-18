# Mantainer: Angelo Salton <gsalton4@hotmail.com>
pkgname=dynare
pkgver=4.5.5
pkgrel=1
pkgdesc="A software platform for handling (economic) DSGE and OLG models."
arch=('x86_64')
url="http://www.dynare.org/"
license=('GPL')
depends=('octave' 'boost' 'blas' 'gsl' 'libmatio')
makedepends=('gcc-fortran')
optdepends=('texlive-core')
source=(http://www.dynare.org/release/source/${pkgname}-${pkgver}.tar.xz)
md5sums=('07206a3654484437dbcb0c558354bb37')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --enable-org-export
  make
  make pdf
  make html
  make info
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  #make check # /*takes a long time!*/
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  }
