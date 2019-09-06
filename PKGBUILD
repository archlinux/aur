# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=blackboxwm
_pkgname=blackbox
pkgver=0.75
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
sha256sums=('197e7e8a5616f1a3be77b37f5dafa6c72e6621c779ba87f15d7463c2a71e7f6b')

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
