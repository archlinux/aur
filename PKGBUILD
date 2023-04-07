# Maintainer:  TDY <tdy@archlinux.info>
# Contributor: dorphell <dorphell@archlinux.org>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=shed
pkgver=1.15
pkgrel=2
pkgdesc="A simple hex editor with an ncurses, pico-style interface"
arch=('i686' 'x86_64')
url="https://shed.sourceforge.net/"
license=('GPL')
depends=('ncurses')
source=(https://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz)
sha256sums=('5bde9f146704ba552293b658a2e8e05acb0a14a1348925b19a296663539917c7')

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
