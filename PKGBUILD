# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>
# Maintainer: Luke Horwell <code (at) horwell (dot) me>

pkgname=polychromatic
pkgver=0.8.0
pkgrel=1
pkgdesc='RGB lighting management front-end application for OpenRazer'
arch=('any')
url='https://github.com/polychromatic/polychromatic'
license=('GPL3')
depends=('python' 'python-colorama' 'python-colour' 'python-setproctitle' 'python-requests' 'python-pyqt5' 'python-pyqt5-webengine' 'qt5-svg' 'libappindicator-gtk3' 'python-gobject')
optdepends=('python-openrazer')
makedepends=('meson' 'ninja' 'sassc')
source=("$pkgname-v$pkgver.tar.gz::https://github.com/polychromatic/polychromatic/archive/v$pkgver.tar.gz")
sha512sums=('a58e85e52a92ccb7fee837692bbf294fe376198582be0c0e982af37c3853667a80f8e67d074f0128a134ede05c4a064614036c847f8be22503e448b1385a1c5a')

build() {
  arch-meson $pkgname-$pkgver build
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
}

# vim:set ts=2 sw=2 et:
