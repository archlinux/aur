# Maintainer: Lars <arch@lars.earth>
pkgname=lrc_tty
options=('!debug')
pkgver=0.5
pkgrel=1
pkgdesc="Terminal lyric viewer for MPRIS players"
arch=('x86_64')
url="https://github.com/larsgrah/lrc_tty"
license=('GPL3')
depends=('playerctl' 'dbus')
makedepends=('zig' 'pkgconf')
source=("lrc_tty-$pkgver.tar.gz::$url/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('fb1bfa68808361b029d879b4096b7070c7ece45d1289906265fa895ac77fab41')

build() {
  cd "$pkgname-$pkgver"
  zig build -Doptimize=ReleaseFast
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 zig-out/bin/lrc_tty "$pkgdir/usr/bin/lrc_tty"
}

