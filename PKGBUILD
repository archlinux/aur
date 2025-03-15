# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>
# Maintainer: Luke Horwell <code (at) horwell (dot) me>

pkgname=polychromatic
pkgver=0.9.4
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
)
source=("$pkgname-v$pkgver.tar.gz::https://github.com/polychromatic/polychromatic/archive/v$pkgver.tar.gz")
sha512sums=('776a6d44c31bbbf6d88f09bb9d75b2d6982029538ce00512c6a6d36f7f196a62ba6a95a87841009759cb2d0d15265d1b01891f2ab463466d0b59f1a66f739f1e')

build() {
  arch-meson $pkgname-$pkgver build
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
}

# vim:set ts=2 sw=2 et:
