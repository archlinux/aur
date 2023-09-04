# Maintainer: tytan652 <tytan652@tytanium.xyz>

pkgname=door-knocker
pkgver=0.1.1
pkgrel=1
pkgdesc="Check availability of all portals provided by xdg-desktop-portal"
arch=('x86_64' 'aarch64')
url="https://codeberg.org/tytan652/door-knocker"
license=('GPL3')
depends=('glibc' 'gcc-libs' 'glib2' 'hicolor-icon-theme' 'libadwaita' 'gtk4')
makedepends=('meson' 'blueprint-compiler')
source=(${pkgname}-${pkgver}.tar.gz::https://codeberg.org/tytan652/door-knocker/archive/${pkgver}.tar.gz)
sha256sums=('973746322af5faa78390dc0ff33e19dbaaac83217f9014b6d207c8e62df93628')

build() {
  arch-meson ${pkgname} build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}

