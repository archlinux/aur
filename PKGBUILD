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
makedepends=('meson' 'wayland-scanner')
source=("https://github.com/tkmxqrdxddd/dbd-1v1-timer-linux/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  cd "dbd-1v1-timer-linux-$pkgver"
  arch-meson build
  meson compile -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
