# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>
# Maintainer: Luke Horwell <code (at) horwell (dot) me>

pkgname=polychromatic
pkgver=0.9.0
pkgrel=1
pkgdesc='RGB lighting management front-end application for OpenRazer'
arch=('any')
url='https://github.com/polychromatic/polychromatic'
license=('GPL-3.0-or-later')
depends=('python' 'python-colorama' 'python-colour' 'python-setproctitle' 'python-requests' 'python-pyqt6' 'python-pyqt6-webengine' 'qt6-svg' 'libappindicator-gtk3' 'python-gobject' 'python-openrazer')
makedepends=('meson' 'ninja' 'sassc')
source=("$pkgname-v$pkgver.tar.gz::https://github.com/polychromatic/polychromatic/archive/v$pkgver.tar.gz")
sha512sums=('10ea80f09e032c29036702de70d1b1b977cf07d2ae834cdcfd6a16599fa389209b0db695e8b1cd5c40f2ebe4c48ae99aafc5d649c1cf3bffe5382bd471b9c23d')

build() {
  arch-meson $pkgname-$pkgver build
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
}

# vim:set ts=2 sw=2 et:
