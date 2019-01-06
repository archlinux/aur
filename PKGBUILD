# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=wingpanel-indicator-network
pkgver=2.2.1
pkgrel=1
pkgdesc='Wingpanel Network Indicator'
arch=(x86_64)
url='https://launchpad.net/wingpanel-indicator-network'
license=(GPL3)
groups=(pantheon)
depends=(
  glib2
  gtk3
  libgee
  libgranite.so
  libnm-glib
  libwingpanel-2.0.so
  networkmanager
  nm-connection-editor
)
makedepends=(
  git
  meson
  vala
  wingpanel
)
source=(wingpanel-indicator-network::git+https://github.com/elementary/wingpanel-indicator-network.git#tag=${pkgver})
sha256sums=(SKIP)

build() {
  arch-meson wingpanel-indicator-network build
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
}

# vim: ts=2 sw=2 et:
