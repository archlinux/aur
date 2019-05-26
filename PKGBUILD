# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=pantheon-applications-menu
pkgver=2.4.3
pkgrel=1
pkgdesc='The Pantheon Application Menu'
arch=(x86_64)
url=https://github.com/elementary/applications-menu
license=(GPL3)
groups=(pantheon)
depends=(
  appstream
  gdk-pixbuf2
  glib2
  gnome-menus
  gtk3
  json-glib
  libgee
  libgranite.so
  libsoup
  libswitchboard-2.0.so
  libwingpanel-2.0.so
  plank
  zeitgeist
)
makedepends=(
  git
  meson
  switchboard
  vala
  wingpanel
)
source=(pantheon-applications-menu::git+https://github.com/elementary/applications-menu.git#tag=${pkgver})
sha256sums=(SKIP)

build() {
  arch-meson pantheon-applications-menu build \
    -D b_pie=false \
    -D with-unity=false
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" meson install -C build
}

# vim: ts=2 sw=2 et:
