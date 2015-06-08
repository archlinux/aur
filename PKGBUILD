# Contributor: Pavel Borzenkov <pavel.borzenkov@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=tclxml
pkgver=3.2
pkgrel=2
pkgdesc="XML support for the Tcl scripting language"
url="http://tclxml.sourceforge.net"
arch=('i686' 'x86_64')
license=('custom:BSD')
depends=('libxslt' 'bash')
optdepends=('tcl: technically not needed, but you want it if you want this package'
   'tcllib: technically not needed, but you want it if you want this package')
source=("http://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('9d1605246c899eff7db591bca3c23200')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr
  make
}
package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
  install -d $pkgdir/usr/share/doc/$pkgname
  cp -r doc/* $pkgdir/usr/share/doc/$pkgname
  rmdir $pkgdir/usr/bin
}
