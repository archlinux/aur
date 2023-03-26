# Maintainer: Jelle van der Waa <jelle@archlinux.org>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=nyacc
pkgver=1.05.1
pkgrel=1
pkgdesc="Not Yet Another Compiler Compiler"
url="http://www.nongnu.org/nyacc"
arch=('any')
license=('GPL' 'LGPL' 'FDL')
depends=('guile' 'guile-bytestructures')
makedepends=('guile')
source=("http://download-mirror.savannah.gnu.org/releases/nyacc/$pkgname-$pkgver.tar.gz"{,.sig})
sha256sums=('c32042c1524646ba1a27b515203fab2240e6151fdb9e306e55b0154bbf7f63b2'
            'SKIP')
validpgpkeys=('7C9EDA8DCE5DC8AE2C675EC9EE4F2A40097B7C03') # Marc Wette

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make
}
 
package() {
  cd $pkgname-$pkgver
  make install DESTDIR=$pkgdir
}
