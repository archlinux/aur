# Maintainer: Lars <arch@lars.earth>
pkgname=lrc_tty
options=('!debug')
pkgver=0.8
pkgrel=1
pkgdesc="Terminal lyric viewer for MPRIS players"
arch=('x86_64')
url="https://github.com/larsgrah/lrc_tty"
license=('GPL3')
depends=('dbus')
makedepends=('zig>=0.16.0' 'pkgconf')
source=("lrc_tty-$pkgver.tar.gz::$url/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('ebd414777074b24a7bcabe57c7c1e3c3a726cef05fafe0484ce0977e2ef052c4')

build() {
  cd "$pkgname-$pkgver"
  zig build -Doptimize=ReleaseFast
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 zig-out/bin/lrc_tty "$pkgdir/usr/bin/lrc_tty"
}

