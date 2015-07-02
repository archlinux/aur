# Maintainer: Devin J. Pohly <djpohly+arch@djpohly.com>
pkgname=vtclock
pkgver=20050220
pkgrel=2
pkgdesc="Text-mode full-screen digital clock"
arch=(i686 x86_64)
url="http://webonastick.com/vtclock"
license=('GPL')
depends=(ncurses)
source=("http://webonastick.com/$pkgname/$pkgname-2005-02-20.tar.gz")
sha1sums=('aabc321bd46ceb9015ee5cd84b526487d63f2dc1')

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname"
  # Makefile doesn't do this for us...
  install -d "$pkgdir/usr/bin"
  make prefix="$pkgdir/usr/" install
}

# vim:set ts=2 sw=2 et:
