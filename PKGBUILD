# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=fraqtive
pkgver=0.4.6
pkgrel=1
pkgdesc="Program for drawing Mandelbrot and Julia fractals"
arch=('i686' 'x86_64')
url="http://fraqtive.mimec.org/"
license=('GPL')
depends=('hicolor-icon-theme' 'qt4' 'glu' 'xdg-utils')
install=$pkgname.install
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.bz2)
sha256sums=('5b799a1da39de1e6aa28674e3c2a2359df630c42f9d9b3fa051dee0db4aace4c')

build() {
  cd ${srcdir}/$pkgname-$pkgver

  ./configure -prefix ${pkgdir}/usr
  make
}

package() {
  cd ${srcdir}/$pkgname-$pkgver
  
   make DESTDIR=${pkgdir} install
}
