# Maintainer: James Spencer <james.s.spencer@gmail.com>

pkgname=atompaw
pkgver=4.1.1.0
pkgrel=1
pkgdesc="Tool to generate projector and basis functions needed for performing electronic structure calculations based on the projector augmented wave (PAW) method."
arch=('i686' 'x86_64')
url="http://users.wfu.edu/natalie/papers/pwpaw/man.html"
license=('GPL')
depends=('lapack' 'libxc')
optdepends=('csh: analysis scripts')
makedepends=('gcc-fortran')
source=(http://users.wfu.edu/natalie/papers/pwpaw/$pkgname-$pkgver.tar.gz)
sha256sums=('b1ee2b53720066655d98523ef337e54850cb1e68b3a2da04ff5a1576d3893891')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --enable-libxc
  make -j1
}

package() {

  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install

}
