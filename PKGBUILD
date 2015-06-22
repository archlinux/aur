# Maintainer:  TDY <tdy@archlinux.info>
# Contributor: dorphell <dorphell@archlinux.org>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=shed
pkgver=1.15
pkgrel=2
pkgdesc="A simple hex editor with an ncurses, pico-style interface"
arch=('i686' 'x86_64')
url="http://shed.sourceforge.net/"
license=('GPL')
depends=('ncurses')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('c7d7d464d6b4fa28a7980270d03e0906')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make CFLAGS="$CFLAGS"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
