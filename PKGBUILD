# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=artanis
pkgver=0.1.0
pkgrel=2
pkgdesc="A fast monolithic web-framework of Scheme"
url="http://web-artanis.com/"
depends=('guile')
arch=('any')
license=('GPL')
source=(http://alpha.gnu.org/gnu/$pkgname/$pkgname-$pkgver.tar.bz2 Makefile.in.patch)
md5sums=('0ac17cdda340aa468cb9aa30956dcca2'
         'ec8451aa3912501be9d9c8ad48f68b38')

prepare() {
  cd $srcdir/$pkgname-$pkgver
  patch -p1 < $srcdir/Makefile.in.patch
}
 
build() {
  cd $srcdir/$pkgname-$pkgver
  ./autogen.sh
  ./configure --prefix=/usr
  make 
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
}
