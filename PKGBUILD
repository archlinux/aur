# Maintainer: tytan652 <tytan652@tytanium.xyz>

pkgname=door-knocker
pkgver=0.4.2
pkgrel=1
pkgdesc="Check availability of all portals provided by xdg-desktop-portal"
arch=('x86_64' 'aarch64')
url="https://codeberg.org/tytan652/door-knocker"
license=('GPL3')
depends=('glibc' 'gcc-libs' 'glib2' 'hicolor-icon-theme' 'libadwaita' 'gtk4')
makedepends=('meson' 'blueprint-compiler')
source=(${pkgname}-${pkgver}.tar.gz::https://codeberg.org/tytan652/door-knocker/archive/${pkgver}.tar.gz)
sha256sums=('fc6fdd9eef2cc6839e11967b56100e3c20745b0b93e86c5a45b5bdaa03d1ac01')

build() {
  arch-meson ${pkgname} build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}

