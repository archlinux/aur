# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=wingpanel-indicator-notifications
pkgver=2.1.3
pkgrel=1
pkgdesc='Notifications indicator for Wingpanel'
arch=(x86_64)
url=https://github.com/elementary/wingpanel-indicator-notifications
license=(GPL3)
groups=(pantheon)
depends=(
  dbus-glib
  glib2
  gtk3
  libdbus
  libgranite.so
  libwingpanel-2.0.so
  libwnck3
)
makedepends=(
  git
  meson
  vala
)
source=(git+https://github.com/elementary/wingpanel-indicator-notifications.git#tag=3b8478801756e58bb3651d8d48044e4073d4665c)
sha256sums=(SKIP)

pkgver() {
  cd wingpanel-indicator-notifications

  git describe --tags
}

build() {
  arch-meson wingpanel-indicator-notifications build
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
}

# vim: ts=2 sw=2 et:
