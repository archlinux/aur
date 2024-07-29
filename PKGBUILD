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
sha512sums=('fa1738ebf1da891946cb8ce72ebddcfb20f5bb7dfb2bbf5246873bbe47d251afdadfb9b8e70609a2d6914dfa047b2e3d1e155e41199ddb17700e18c05405d755')

build() {
  arch-meson $pkgname-$pkgver build
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
}

# vim:set ts=2 sw=2 et:
