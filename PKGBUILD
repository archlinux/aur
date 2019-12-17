# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=wingpanel-indicator-keyboard
pkgver=2.2.0
pkgrel=1
pkgdesc='Wingpanel Keyboard Indicator'
arch=(x86_64)
url=https://github.com/elementary/wingpanel-indicator-keyboard
license=(GPL3)
groups=(pantheon)
depends=(
  glib2
  gtk3
  libwingpanel-2.0.so
  libxml2
)
makedepends=(
  git
  meson
  vala
  wingpanel
)
source=(git+https://github.com/elementary/wingpanel-indicator-keyboard.git#tag=04f84477d22da586a4668a16ab4b35cc05d34d93)
sha256sums=(SKIP)

pkgver() {
  cd wingpanel-indicator-keyboard

  git describe --tags
}

build() {
  arch-meson wingpanel-indicator-keyboard build
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
}

# vim: ts=2 sw=2 et:
