# Maintainer: Jeff Youdontneedtoknow <jeffpublicjr at gmail dot com>
# Contributor: yetist <yetist@gmail.com>

pkgname=gmchess
pkgver=0.29.6
pkgrel=3
pkgdesc="Chinese chess game"
arch=("i686" "x86_64")
url="http://code.google.com/p/gmchess/"
license=('GPL2')
depends=("gtkmm")
makedepends=('pkgconfig' 'intltool')
source=("http://gmchess.googlecode.com/files/$pkgname-$pkgver.tar.bz2")
sha1sums=('f9a81c8fd58ff5122423b368c62e54f3b7528af5')

build() {
   cd "$srcdir/$pkgname-$pkgver"
   ./configure --prefix=/usr
   make
   make  DESTDIR="$srcdir" install
   } 
   
package(){
  install -d -m755 $pkgdir/usr
  install -d -m755 $pkgdir/usr/share
  install -d -m755 $pkgdir/usr/share/locale
  install -d -m755 $pkgdir/usr/share/man
  install -d -m755 $pkgdir/usr/share/$pkgname
  install -d -m755 $pkgdir/usr/share/applications
  install -d -m755 $pkgdir/usr/lib
  install -d -m755 $pkgdir/usr/bin
  
  
  cp -r $srcdir/usr/share/locale/ $pkgdir/usr/share/
  cp -r $srcdir/usr/share/man/ $pkgdir/usr/share/
  cp -r $srcdir/usr/share/$pkgname/ $pkgdir/usr/share
  install -D -m644 $srcdir/usr/share/applications/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
  install -D -m644 $srcdir/usr/share/pixmaps/$pkgname.png $pkgdir/usr/share/icons/$pkgname.png
  cp -r $srcdir/usr/lib $pkgdir/usr
  cp -r $srcdir/usr/bin $pkgdir/usr
}