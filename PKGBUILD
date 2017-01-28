# Maintainer: Devin J. Pohly <djpohly+arch@djpohly.com>
pkgname=vtclock
pkgver=0.0.20161228
pkgrel=2
epoch=1
pkgdesc="Text-mode full-screen digital clock"
arch=(i686 x86_64)
url="http://webonastick.com/vtclock"
license=('GPL')
depends=(ncurses)
source=("http://webonastick.com/$pkgname/$pkgname-$pkgver.tar.gz")
sha1sums=('9d0f13aadda309aa74d91f6cca2770c41fd053c2')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  # Makefile doesn't do this for us...
  install -d "$pkgdir/usr/bin"
  make prefix="$pkgdir/usr/" install
}

# vim:set ts=2 sw=2 et:
