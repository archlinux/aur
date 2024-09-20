# Maintainer: tytan652 <tytan652@tytanium.xyz>

pkgname=door-knocker
pkgver=0.6.0
pkgrel=1
pkgdesc="Check availability of all portals provided by xdg-desktop-portal"
arch=('x86_64' 'aarch64')
url="https://codeberg.org/tytan652/door-knocker"
license=(GPL-3.0-or-later)
depends=('glibc' 'gcc-libs' 'glib2' 'hicolor-icon-theme' 'libadwaita' 'gtk4')
makedepends=('meson' 'blueprint-compiler' 'glib2-devel')
source=(${pkgname}-${pkgver}.tar.gz::https://codeberg.org/tytan652/door-knocker/archive/${pkgver}.tar.gz)
sha256sums=('fbbc0de0721610d39c217a37b202279cc9321b96ece5c46e4ecb0ec60996d03f')

build() {
  arch-meson ${pkgname} build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}

