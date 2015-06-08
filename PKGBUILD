# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=awka  
pkgver=0.7.5
pkgrel=6
pkgdesc="Converts awk-code to C-code"
url="http://awka.sourceforge.net/download.html"
arch=('i686' 'x86_64')
license=('GPL')
makedepends=('gawk')
source=(http://awka.sourceforge.net/$pkgname-$pkgver.tar.gz)
md5sums=('6e6dd4a60b25dc0a7a06c6de063d6590')

build() {
  cd $srcdir/$pkgname-$pkgver
  CFLAGS="" ./configure --prefix=/usr --mandir=/usr/share/man 
  make 
}
package() {
  cd $srcdir/$pkgname-$pkgver
  make prefix=$pkgdir/usr MANSRCDIR=$pkgdir/usr/share/man install 
}
