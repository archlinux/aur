# Maintainer: Popolon <popolon@popolon.org>

pkgname=bootterm
pkgver=0.4
pkgrel=1
pkgdesc="Simple, reliable and powerful terminal designed to ease connection to ephemeral serial ports"
arch=('x86_64' 'armv7h' 'armv8')
url="https://github.com/wtarreau/bootterm/"
license=('MIT')
source=(https://github.com/wtarreau/$pkgname/archive/v${pkgver}.tar.gz)
sha256sums=('048391b7a988d7581c972167cba849ab58d63ac118f0d3ad204275f54a8df337')

build() {
  cd $pkgname-$pkgver
  make V=1 CFLAGS="$CFLAGS $CPPFLAGS" LDFLAGS="$LDFLAGS"
}

package() {
  cd $pkgname-$pkgver
  make install DESTDIR="$pkgdir" PREFIX=/usr
}
