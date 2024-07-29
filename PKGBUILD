# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>
# Maintainer: Luke Horwell <code (at) horwell (dot) me>

pkgname=polychromatic
pkgver=0.9.2
pkgrel=1
pkgdesc='RGB lighting management front-end application for OpenRazer'
arch=('any')
url='https://github.com/polychromatic/polychromatic'
license=('GPL-3.0-or-later')
depends=('python' 'python-colorama' 'python-colour' 'python-setproctitle' 'python-requests' 'python-pyqt6' 'python-pyqt6-webengine' 'qt6-svg' 'libappindicator-gtk3' 'python-gobject' 'python-openrazer')
makedepends=('meson' 'ninja' 'sassc')
source=("$pkgname-v$pkgver.tar.gz::https://github.com/polychromatic/polychromatic/archive/v$pkgver.tar.gz")
sha512sums=('0fafac6b00e6684cf78e898da075ed2b8e5ae78af0f224072fc413e2e36453b64d002d87d4369ddeb108cf87d78154ff48605b9ec20aa75cd142b8c159b8d169')

build() {
  arch-meson $pkgname-$pkgver build
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
}

# vim:set ts=2 sw=2 et:
