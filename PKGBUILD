# Maintainer: David Scholl <djscholl at gmail dot com>
pkgname=xmlcopyeditor
pkgver=1.2.1.3
pkgrel=2
pkgdesc="XML editor based on Scintilla."
arch=('i686' 'x86_64')
url="http://xml-copy-editor.sourceforge.net"
license=('custom')
depends=('wxgtk' 'libxslt' 'xerces-c' 'enchant' 'desktop-file-utils')
makedepends=('boost' 'intltool')
install="xmlcopyeditor.install"
source=(http://downloads.sourceforge.net/xml-copy-editor/$pkgname-$pkgver.tar.gz) 
md5sums=('b8ec66bbf41d6dd10ffe704e5b5f4b5e')
build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr
  make
}
package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
  install -d $pkgdir/usr/share/$pkgname
  cp -R $srcdir/$pkgname-$pkgver/src/help $pkgdir/usr/share/$pkgname
  cp -R $srcdir/$pkgname-$pkgver/src/png $pkgdir/usr/share/$pkgname
  cp -R $srcdir/$pkgname-$pkgver/src/rng $pkgdir/usr/share/$pkgname
  cp -R $srcdir/$pkgname-$pkgver/src/rulesets $pkgdir/usr/share/$pkgname
  cp -R $srcdir/$pkgname-$pkgver/src/templates $pkgdir/usr/share/$pkgname
  cp -R $srcdir/$pkgname-$pkgver/src/xpm $pkgdir/usr/share/$pkgname
  install -d $pkgdir/usr/share/licenses/$pkgname
  cp -R $srcdir/$pkgname-$pkgver/src/copying/* $pkgdir/usr/share/licenses/$pkgname
}
