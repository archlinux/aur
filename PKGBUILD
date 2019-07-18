# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=wingpanel-indicator-nightlight-git
pkgver=r144.9391435
pkgrel=1
pkgdesc='Winganel Nightlight Indicator'
arch=(x86_64)
url=https://github.com/elementary/wingpanel-indicator-nightlight
license=(GPL2)
groups=(pantheon-unstable)
depends=(
  glib2
  glibc
  gtk3
  libwingpanel-2.0.so
)
makedepends=(
  git
  intltool
  meson
  vala
  wingpanel-git
)
provides=(wingpanel-indicator-nightlight)
conflicts=(wingpanel-indicator-nightlight)
source=(git+https://github.com/elementary/wingpanel-indicator-nightlight.git)
sha256sums=(SKIP)

pkgver() {
  cd wingpanel-indicator-nightlight

  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  arch-meson wingpanel-indicator-nightlight build
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
}

# vim: ts=2 sw=2 et:
