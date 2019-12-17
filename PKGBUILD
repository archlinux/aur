# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=wingpanel-indicator-bluetooth
pkgver=2.1.4
pkgrel=1
pkgdesc='Wingpanel Bluetooth Indicator'
arch=(x86_64)
url=https://github.com/elementary/wingpanel-indicator-bluetooth
license=(GPL3)
groups=(pantheon)
depends=(
  bluez
  glib2
  gtk3
  libgranite.so
  libwingpanel-2.0.so
)
makedepends=(
  git
  meson
  vala
  wingpanel
)
source=(git+https://github.com/elementary/wingpanel-indicator-bluetooth.git#tag=64ac0db83952ee99ae46915bbb527b06168d79fb)
sha256sums=(SKIP)

pkgver() {
  cd wingpanel-indicator-bluetooth

  git describe --tags
}

build() {
  arch-meson wingpanel-indicator-bluetooth build
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
}

# vim: ts=2 sw=2 et:
