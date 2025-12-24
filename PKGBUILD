# Maintainer: Luke Horwell <code (at) horwell (dot) me>
# Contributor: Luca Weiss <luca (at) z3ntu (dot) xyz>

pkgname=polychromatic
pkgver=0.9.6
pkgrel=1
pkgdesc='RGB lighting management front-end application for OpenRazer'
arch=('any')
url='https://github.com/polychromatic/polychromatic'
license=('GPL-3.0-or-later')
depends=(
  libappindicator
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
sha512sums=('7bd364a803e9c29af8a9db1b573a89bd05615d6ced051d8244e5780390d67bc4024c351d6b96447fba68444b04e35239d2370dabfbd7beb99d50957797b0597d')

build() {
  arch-meson $pkgname-$pkgver build
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
}

# vim:set ts=2 sw=2 et:
