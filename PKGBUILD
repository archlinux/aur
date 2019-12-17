# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=wingpanel-indicator-sound
pkgver=2.1.4
pkgrel=1
pkgdesc='Wingpanel Sound Indicator'
arch=(x86_64)
url=https://github.com/elementary/wingpanel-indicator-sound
license=(GPL3)
groups=(pantheon)
depends=(
  cairo
  gdk-pixbuf2
  glib2
  gtk3
  libcanberra
  libgee
  libgranite.so
  libnotify
  libpulse
  libwingpanel-2.0.so
)
makedepends=(
  git
  gobject-introspection
  gtk2
  intltool
  meson
  vala
)
source=(wingpanel-indicator-sound::git+https://github.com/elementary/wingpanel-indicator-sound.git#tag=002003d872ec7c2f0f1509ad5da9b1d31e26ff20)
sha256sums=(SKIP)

pkgver() {
  cd wingpanel-indicator-sound

  git describe --tags
}

build() {
  arch-meson wingpanel-indicator-sound build
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
}

# vim: ts=2 sw=2 et:
