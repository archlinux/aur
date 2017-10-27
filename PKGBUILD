# Mantainer: Angelo Salton <gsalton4@hotmail.com>
pkgname=dynare
pkgver=4.5.3
pkgrel=1
pkgdesc="A software platform for handling (economic) DSGE and OLG models."
arch=('x86_64')
url="http://www.dynare.org/"
license=('GPL')
depends=('octave' 'boost' 'blas' 'gsl' 'libmatio')
makedepends=('gcc-fortran')
optdepends=('texlive-core')
source=(http://www.dynare.org/release/source/${pkgname}-${pkgver}.tar.xz)
md5sums=('6398238d234a0d778799a024d413d0be')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --enable-org-export --disable-matlab
  make
  make pdf
  make html
  make info
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  #make check
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  }
