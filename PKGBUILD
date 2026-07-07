# Maintainer: tkmxqrdxddd <tkmxqrd@gmail.com>

pkgname=dbd-timer
pkgver=1.0.0
pkgrel=1
pkgdesc="Overlay stopwatch with two independent timers, Wayland overlay, and gamepad support"
arch=('x86_64')
url="https://github.com/tkmxqrdxddd/dbd-1v1-timer-linux"
license=('MIT')
depends=(
  'cairo'
  'pango'
  'libevdev'
  'sdl2'
  'wayland'
)
makedepends=('meson')
source=("https://github.com/tkmxqrdxddd/dbd-1v1-timer-linux/archive/v$pkgver.tar.gz")
sha256sums=('e59cafafcbebafa673cf1322f34efdb33a3d403a9a05d85d0410fdb5dd4b6aaa')

build() {
  cd "$srcdir/dbd-1v1-timer-linux-$pkgver"
  arch-meson build
  meson compile -C build
}

package() {
  cd "$srcdir/dbd-1v1-timer-linux-$pkgver"
  DESTDIR="$pkgdir" meson install -C build
}
