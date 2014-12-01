# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=polygen
pkgver=1.0.6
pkgrel=1
pkgdesc="A program for generating random sentences according to a grammar definition"
arch=('i686' 'x86_64')
url="http://polygen.org/"
license=('GPL')
depends=('polygen-data')
makedepends=('ocaml')
source=(http://polygen.org/dist/$pkgname-$pkgver-20040628-src.zip)
sha256sums=('703c483820b33a5d695e884e58e2723a660930180fde845f38d6135d247c64a5')

build() {
  cd "${srcdir}"/$pkgname-$pkgver/src

  make
}

package() {
  cd "${srcdir}"/$pkgname-$pkgver/src

  install -D -m755 $pkgname "${pkgdir}"/usr/bin/$pkgname
}
