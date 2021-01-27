# Maintainer: Popolon <popolon@popolon.org>

pkgname=bootterm
pkgver=0.3
pkgrel=1
pkgdesc="Simple, reliable and powerful terminal designed to ease connection to ephemeral serial ports"
arch=('x86_64' 'armv7h' 'armv8')
url="https://github.com/wtarreau/bootterm/"
license=('MIT')
source=(https://github.com/wtarreau/$pkgname/archive/v${pkgver}.tar.gz)
sha256sums=('8779dd9af5b0574a7a93e5f8579935f622055d958a690457dcef02d4f438ec6c')

build() {
  cd $pkgname-$pkgver
  make V=1 CFLAGS="$CFLAGS $CPPFLAGS" LDFLAGS="$LDFLAGS"
}

package() {
  cd $pkgname-$pkgver
  make install DESTDIR="$pkgdir" PREFIX=/usr
}
