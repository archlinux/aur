# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>
# Maintainer: Luke Horwell <code (at) horwell (dot) me>

pkgname=polychromatic
pkgver=0.9.1
pkgrel=1
pkgdesc='RGB lighting management front-end application for OpenRazer'
arch=('any')
url='https://github.com/polychromatic/polychromatic'
license=('GPL-3.0-or-later')
depends=('python' 'python-colorama' 'python-colour' 'python-setproctitle' 'python-requests' 'python-pyqt6' 'python-pyqt6-webengine' 'qt6-svg' 'libappindicator-gtk3' 'python-gobject' 'python-openrazer')
makedepends=('meson' 'ninja' 'sassc')
source=("$pkgname-v$pkgver.tar.gz::https://github.com/polychromatic/polychromatic/archive/v$pkgver.tar.gz")
sha512sums=('def2d488fb52091ecddea5f11bf066efec5caf43b2c53f3b1a63d6de59c4ca9b62eb5da84faa08581050dbcc8ebcb98681b6d5c4376d04699a736d7122b79cb3')

build() {
  arch-meson $pkgname-$pkgver build
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
}

# vim:set ts=2 sw=2 et:
