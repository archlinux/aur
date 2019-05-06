# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=fraqtive
pkgver=0.4.8
pkgrel=1
pkgdesc="Program for drawing Mandelbrot and Julia fractals"
arch=('i686' 'x86_64')
url="http://fraqtive.mimec.org/"
license=('GPL')
depends=('hicolor-icon-theme' 'qt4' 'glu' 'xdg-utils')
source=($pkgname-$pkgver.tar.gz::https://github.com/mimecorg/$pkgname/archive/v$pkgver.tar.gz)
sha256sums=('3b2cbf73cd3a0743ed05f12afe168c4eb0404bb025b010e77f4d5faea4933d96')

build() {
  cd "${srcdir}"/$pkgname-$pkgver

  ./configure -prefix "${pkgdir}"/usr
  make
}

package() {
  cd "${srcdir}"/$pkgname-$pkgver

   make DESTDIR="${pkgdir}" install
}
