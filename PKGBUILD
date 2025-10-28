# Maintainer: Luke Horwell <code (at) horwell (dot) me>
# Contributor: Luca Weiss <luca (at) z3ntu (dot) xyz>

pkgname=polychromatic
pkgver=0.9.5
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
sha512sums=('0cd5da66750ebc42db00ba34995dcbcf05bc10759b1ef4d1cede50408fca5f2f8b41e7a95e83f699233df3163354e601ad812a9f04255af73d7b643540154223')

build() {
  arch-meson $pkgname-$pkgver build
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
}

# vim:set ts=2 sw=2 et:
