# Maintainer: Lars <arch@lars.earth>
pkgname=lrc_tty
options=('!debug')
pkgver=0.6
pkgrel=1
pkgdesc="Terminal lyric viewer for MPRIS players"
arch=('x86_64')
url="https://github.com/larsgrah/lrc_tty"
license=('GPL3')
depends=('dbus')
makedepends=('zig' 'pkgconf')
source=("lrc_tty-$pkgver.tar.gz::$url/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('6cf5d568f72c5c2db996197d8bc39aef839beb75462b1feef369b14d777bfece')

build() {
  cd "$pkgname-$pkgver"
  zig build -Doptimize=ReleaseFast
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 zig-out/bin/lrc_tty "$pkgdir/usr/bin/lrc_tty"
}

