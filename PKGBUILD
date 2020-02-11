# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=blackboxwm
_pkgname=blackbox
pkgver=0.76
pkgrel=1
pkgdesc="A window manager for X11 (maintained fork of blackbox)"
arch=('i686' 'x86_64')
url="http://github.com/bbidulock/blackboxwm"
license=('MIT')
provides=($_pkgname)
conflicts=($_pkgname)
replaces=($_pkgname)
depends=('libxext' 'libxft')
options=('!libtool' 'staticlibs')
source=("https://github.com/bbidulock/$pkgname/releases/download/$pkgver/$_pkgname-$pkgver.tar.lz")
sha256sums=('57af0e14487cdcf9dda50b54e5dda5849b30153f2784fd4dba8cebc394fc625e')

build() {
  cd $_pkgname-$pkgver
  ./configure --enable-static --enable-shared
  make
}

package() {
  cd $_pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim:set ts=2 sw=2 et:
