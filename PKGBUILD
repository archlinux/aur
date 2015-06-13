# Maintainer: James Spencer <james.s.spencer@gmail.com>

pkgname=atompaw
pkgver=4.0.0.10
pkgrel=1
pkgdesc="Tool to generate projector and basis functions needed for performing electronic structure calculations based on the projector augmented wave (PAW) method."
arch=('i686' 'x86_64')
url="http://www.wfu.edu/~natalie/papers/pwpaw/man.html"
license=('GPL')
depends=('lapack')
optdepends=('csh: analysis scripts')
makedepends=('gcc-fortran')
source=(http://www.wfu.edu/~natalie/papers/pwpaw/$pkgname-$pkgver.tar.gz)
sha1sums=('8b6de2bba9f30664a207cd668f9ca1912cfe7bc7')

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
