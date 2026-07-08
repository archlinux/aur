# Maintainer: tkmxqrdxddd <tkmxqrd@gmail.com>

pkgname=dbd-timer
pkgver=1.0.2
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
sha256sums=('5197432c4cf50d81428ae29b2be3f0c72f964f1936584dea0461ceb96731f41a')

build() {
  cd "$srcdir/dbd-1v1-timer-linux-$pkgver"
  arch-meson build
  meson compile -C build
}

package() {
  cd "$srcdir/dbd-1v1-timer-linux-$pkgver"
  DESTDIR="$pkgdir" meson install -C build
}
