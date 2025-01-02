# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>
# Maintainer: Luke Horwell <code (at) horwell (dot) me>

pkgname=polychromatic
pkgver=0.9.3
pkgrel=1
pkgdesc='RGB lighting management front-end application for OpenRazer'
arch=('any')
url='https://github.com/polychromatic/polychromatic'
license=('GPL-3.0-or-later')
depends=(
  libappindicator-gtk3
  python
  python-colorama
  python-colour
  python-gobject
  python-openrazer
  python-pyqt6
  python-pyqt6-webengine
  python-requests
  python-setproctitle
  qt6-svg
)
makedepends=(
  meson
  ninja
  sassc
)
source=("$pkgname-v$pkgver.tar.gz::https://github.com/polychromatic/polychromatic/archive/v$pkgver.tar.gz")
sha512sums=('a1805bce9986915164fdf61b5fd194ebd16cd7f1528febe0dcf7c09ecde5edf6ed7b404c97a3ea27427727d0134d9e26b71d8a810b5649e659febc403146bc4a')

build() {
  arch-meson $pkgname-$pkgver build
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
}

# vim:set ts=2 sw=2 et:
