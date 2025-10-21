# Maintainer: Michal Wojdyla < micwoj9292 at gmail dot com >
# Contributor: Jelle van der Waa <jelle@archlinux.org>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=nyacc
pkgver=2.02.4
pkgrel=2
pkgdesc="Not Yet Another Compiler Compiler"
url="http://www.nongnu.org/nyacc"
arch=('x86_64')
license=('GPL' 'LGPL' 'FDL')
depends=('guile' 'guile-bytestructures')
makedepends=('guile')
source=("http://download-mirror.savannah.gnu.org/releases/nyacc/$pkgname-$pkgver.tar.gz")
sha256sums=('1e1e73f80ba1155547f9e48de0fb06e8ceccd87b8af45a415a89b40639458356')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make
}
 
package() {
  cd $pkgname-$pkgver
  make install DESTDIR=$pkgdir
}
