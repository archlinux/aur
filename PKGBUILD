# Maintainer: Giovanni Harting <539@idlegandalf.com>

pkgname=wljoywake
pkgver=0.3
pkgrel=1
pkgdesc='Wayland idle inhibit on joystick input'
arch=(x86_64)
url='https://github.com/nowrep/wljoywake'
license=(GPL-2.0-only)
depends=(wayland systemd-libs glibc)
makedepends=(meson wayland-protocols)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('3086de8b5e2d25dea9fc01e88297d4f4e67c14bd4b914e721cf3435197e6893a171d89acc8e4a90457b3100b968a8dc11f992d49bda2f17375a3049d39999529')

build() {
  arch-meson wljoywake-$pkgver build
  meson compile -C build
}

check() {
  meson test -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}

# vim:set ts=2 sw=2 et:
