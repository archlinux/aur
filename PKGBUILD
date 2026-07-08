# Maintainer: tkmxqrdxddd <tkmxqrd@gmail.com>

pkgname=dbd-timer
pkgver=1.0.1
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
sha256sums=('04c324a537267cd54b5f63b2642e1293d52d8d4f34b74757f71f72d381531a9c')

build() {
  cd "$srcdir/dbd-1v1-timer-linux-$pkgver"
  arch-meson build
  meson compile -C build
}

package() {
  cd "$srcdir/dbd-1v1-timer-linux-$pkgver"
  DESTDIR="$pkgdir" meson install -C build
}
