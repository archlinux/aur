# Maintainer: Connor Behan <connor.behan@gmail.com>
# Contributor: TDY <tdy@archlinux.info>

pkgname=xbae
pkgver=4.60.4
pkgrel=1
pkgdesc="A Motif widget set containing the XbaeMatrix, XbaeCaption, and XbaeInput extensions"
arch=('i686' 'x86_64')
url="http://xbae.sourceforge.net/"
license=('MIT')
depends=('libxp' 'libxpm' 'openmotif')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('9690059474bb05191dccd041ff5052bd')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim:set ts=2 sw=2 et:
