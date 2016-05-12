# Maintainer: James Spencer <james.s.spencer@gmail.com>

pkgname=atompaw
pkgver=4.0.0.13
pkgrel=1
pkgdesc="Tool to generate projector and basis functions needed for performing electronic structure calculations based on the projector augmented wave (PAW) method."
arch=('i686' 'x86_64')
url="http://www.wfu.edu/~natalie/papers/pwpaw/man.html"
license=('GPL')
depends=('lapack')
optdepends=('csh: analysis scripts')
makedepends=('gcc-fortran')
source=(http://www.wfu.edu/~natalie/papers/pwpaw/$pkgname-$pkgver.tar.gz)
sha1sums=('b482cbada8f2e11904996e5d3305de011520d78a')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  #make -pn
  make -j1
}

package() {

  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install

}
