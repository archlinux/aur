# Mantainer: Angelo Salton <gsalton4@hotmail.com>
pkgname=dynare
pkgver=4.5.4
pkgrel=1
pkgdesc="A software platform for handling (economic) DSGE and OLG models."
arch=('x86_64')
url="http://www.dynare.org/"
license=('GPL')
depends=('octave' 'boost' 'blas' 'gsl' 'libmatio')
makedepends=('gcc-fortran')
optdepends=('texlive-core')
source=(http://www.dynare.org/release/source/${pkgname}-${pkgver}.tar.xz)
md5sums=('84b98638d13089f329148363b9fd7bc3')

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
  #make check # /*takes a long time!*/
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  }
