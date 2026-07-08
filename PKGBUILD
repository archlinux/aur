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
sha256sums=('4773682e81cafddca2f926bbe8591464fa3b62cc88c1357e23fa61504c869f4d')

build() {
  cd "$srcdir/dbd-1v1-timer-linux-$pkgver"
  arch-meson build
  meson compile -C build
}

package() {
  cd "$srcdir/dbd-1v1-timer-linux-$pkgver"
  DESTDIR="$pkgdir" meson install -C build
}
