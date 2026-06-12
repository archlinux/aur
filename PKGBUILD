# Maintainer: Michal Wojdyla < micwoj9292 at gmail dot com >
# Contributor: NeatTaken <NeatTaken@proton.me>
# Contributor: Jelle van der Waa <jelle@archlinux.org>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=nyacc
pkgver=3.04.6
pkgrel=1
pkgdesc="Not Yet Another Compiler Compiler"
url="http://www.nongnu.org/nyacc"
arch=('x86_64')
license=('GPL' 'LGPL' 'FDL')
depends=('guile')
makedepends=('guile')
source=("https://github.com/mwette/nyacc/archive/refs/tags/V${pkgver}.zip")
sha256sums=('56b4fa5efdc2383ea3eb01f1de0109b21ac7d1eb8bfb1eda682ddba6b27b5aee')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make
}
 
package() {
  cd $pkgname-$pkgver
  make install DESTDIR=$pkgdir
}
