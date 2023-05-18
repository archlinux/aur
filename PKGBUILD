# Maintainer: Giovanni Harting <539@idlegandalf.com>

pkgname=wljoywake
pkgver=0.2
pkgrel=1
pkgdesc='Wayland idle inhibit on joystick input'
arch=(x86_64)
url=https://github.com/nowrep/wljoywake
license=(GPL2)
depends=(wayland)
makedepends=(meson wayland-protocols)
source=("https://github.com/nowrep/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('795a426fc4041ad87fe51cbf6286f951cb4b0731292f9c34e9ed4eaed5adf2fe037638e86cc191797e604e798db467fafe1ea11eab8655d3dce2436fbd39b377')

build() {
  arch-meson wljoywake-$pkgver build
  meson compile -C build
}

check() {
  meson test -C build
}

package() {
  DESTDIR="${pkgdir}" meson install -C build
}

# vim: set ts=4 sw=4 tw=0 et :
