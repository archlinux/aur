# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=wingpanel-indicator-session
pkgver=2.2.6
pkgrel=1
pkgdesc='Session indicator for Wingpanel'
arch=(x86_64)
url='https://github.com/elementary/wingpanel-indicator-session'
license=(GPL3)
groups=(pantheon)
depends=(
  accountsservice
  gdk-pixbuf2
  glib2
  gtk3
  libgranite.so
  libwingpanel-2.0.so
)
makedepends=(
  git
  gobject-introspection
  meson
  vala
)
source=(git+https://github.com/elementary/wingpanel-indicator-session.git#tag=3cb90c169cc4f7710dcea9a39ad9bd9d3c4d7461)
sha256sums=(SKIP)

pkgver() {
  cd wingpanel-indicator-session

  git describe --tags
}

build() {
  arch-meson wingpanel-indicator-session build
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
}

# vim: ts=2 sw=2 et:
