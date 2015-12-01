# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=fraqtive
pkgver=0.4.8
pkgrel=1
pkgdesc="Program for drawing Mandelbrot and Julia fractals"
arch=('i686' 'x86_64')
url="http://fraqtive.mimec.org/"
license=('GPL')
depends=('hicolor-icon-theme' 'qt4' 'glu' 'xdg-utils')
install=$pkgname.install
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.bz2)
sha256sums=('dbb21b5e6305cbf02c27aaedb12c5125ac873600bce10d12e88b2305a2083cd7')

build() {
  cd "${srcdir}"/$pkgname-$pkgver

  ./configure -prefix "${pkgdir}"/usr
  make
}

package() {
  cd "${srcdir}"/$pkgname-$pkgver

   make DESTDIR="${pkgdir}" install
}
