# Maintainer: James Spencer <james.s.spencer@gmail.com>

pkgname=atompaw
pkgver=4.1.0.6
pkgrel=1
pkgdesc="Tool to generate projector and basis functions needed for performing electronic structure calculations based on the projector augmented wave (PAW) method."
arch=('i686' 'x86_64')
url="http://users.wfu.edu/natalie/papers/pwpaw/man.html"
license=('GPL')
depends=('lapack' 'libxc')
optdepends=('csh: analysis scripts')
makedepends=('gcc-fortran')
source=(http://users.wfu.edu/natalie/papers/pwpaw/$pkgname-$pkgver.tar.gz)
sha256sums=('42a46c0569367c0b971fbc3dcaf5eaec7020bdff111022b6f320de9f11c41c2c')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --enable-libxc
  make -j1
}

package() {

  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install

}
