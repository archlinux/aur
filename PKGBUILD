# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=wingpanel
pkgver=2.2.2
pkgrel=1
pkgdesc='The Pantheon Top Panel'
arch=(x86_64)
url=https://github.com/elementary/wingpanel
license=(GPL3)
groups=(pantheon)
depends=(
  glib2
  gtk3
  libgala.so
  libgee
  libgranite.so
  mutter
)
makedepends=(
  git
  gala
  meson
  vala
)
provides=(libwingpanel-2.0.so)
source=(git+https://github.com/elementary/wingpanel.git#tag=${pkgver})
sha256sums=(SKIP)

build() {
  arch-meson wingpanel build \
    -D b_pie=false
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" meson install -C build
}

# vim: ts=2 sw=2 et:
