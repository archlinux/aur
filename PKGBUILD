# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=wingpanel-indicator-datetime
pkgver=2.1.3
pkgrel=1
pkgdesc='Date & Time indicator for Wingpanel'
arch=(x86_64)
url='https://github.com/elementary/wingpanel-indicator-datetime'
license=(GPL3)
groups=(pantheon)
depends=(
  cairo
  evolution-data-server
  glib2
  gtk3
  libgee
  libgranite.so
  libical
  libwingpanel-2.0.so
)
makedepends=(
  git
  meson
  vala
  wingpanel
)
source=(git+https://github.com/elementary/wingpanel-indicator-datetime.git#tag=${pkgver})
sha256sums=(SKIP)

build() {
  arch-meson wingpanel-indicator-datetime build
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
}

# vim: ts=2 sw=2 et:
