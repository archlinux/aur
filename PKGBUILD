# Maintainer: Lars <arch@lars.earth>
pkgname=lrc_tty
options=('!debug')
pkgver=0.7
pkgrel=1
pkgdesc="Terminal lyric viewer for MPRIS players"
arch=('x86_64')
url="https://github.com/larsgrah/lrc_tty"
license=('GPL3')
depends=('dbus')
makedepends=('zig>=0.16.0' 'pkgconf')
source=("lrc_tty-$pkgver.tar.gz::$url/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('7a095bf006d8c30260588c9c8ce8d64addabb1069d53756a6802fa9a7c5c2452')

build() {
  cd "$pkgname-$pkgver"
  zig build -Doptimize=ReleaseFast
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 zig-out/bin/lrc_tty "$pkgdir/usr/bin/lrc_tty"
}

