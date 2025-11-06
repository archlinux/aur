# Maintainer: Michal Wojdyla < micwoj9292 at gmail dot com >
# Contributor: Jelle van der Waa <jelle@archlinux.org>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=nyacc
pkgver=2.02.5
pkgrel=1
pkgdesc="Not Yet Another Compiler Compiler"
url="http://www.nongnu.org/nyacc"
arch=('x86_64')
license=('GPL' 'LGPL' 'FDL')
depends=('guile' 'guile-bytestructures')
makedepends=('guile')
source=("http://download-mirror.savannah.gnu.org/releases/nyacc/$pkgname-$pkgver.tar.gz")
sha256sums=('f9f062734ad5a33e91df02a5b697be031440fe75527f1ec9b81ec8c474c2d973')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make
}
 
package() {
  cd $pkgname-$pkgver
  make install DESTDIR=$pkgdir
}
