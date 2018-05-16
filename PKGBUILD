# Maintainer: ebiadsu <ebiadsu at posteo de>
# Contributor: David Scholl <djscholl at gmail dot com>
pkgname=xmlcopyeditor
pkgver=1.2.1.3
pkgrel=4
pkgdesc="XML editor based on Scintilla."
arch=('i686' 'x86_64')
url="http://xml-copy-editor.sourceforge.net"
license=('custom')
depends=('wxgtk' 'libxslt' 'xerces-c' 'enchant1.6=1.6.1')
makedepends=('boost' 'intltool')
install="xmlcopyeditor.install"
source=(https://sourceforge.net/projects/xml-copy-editor/files/$pkgname-linux/$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('9b684b5042b4af85d3626fd55108bd1d63c0007b5c794ef7cc4b026012b29d2f')
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

