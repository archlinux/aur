# Maintainer: tytan652 <tytan652@tytanium.xyz>

pkgname=door-knocker
pkgver=0.4.3
pkgrel=1
pkgdesc="Check availability of all portals provided by xdg-desktop-portal"
arch=('x86_64' 'aarch64')
url="https://codeberg.org/tytan652/door-knocker"
license=('GPL3')
depends=('glibc' 'gcc-libs' 'glib2' 'hicolor-icon-theme' 'libadwaita' 'gtk4')
makedepends=('meson' 'blueprint-compiler')
source=(${pkgname}-${pkgver}.tar.gz::https://codeberg.org/tytan652/door-knocker/archive/${pkgver}.tar.gz)
sha256sums=('b8a1f1c1c728cbfbb074ed5ce1a92fbc2d34342772d0c59eb4c15f27859c31da')

build() {
  arch-meson ${pkgname} build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}

