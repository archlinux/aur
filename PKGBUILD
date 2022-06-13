# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=emulsion-palette
pkgver=3.3.9
pkgrel=1
pkgdesc="Store your palettes in an easy way, and edit them if needed"
arch=('x86_64')
url="https://github.com/lainsce/emulsion"
license=('GPL3')
depends=('libadwaita' 'json-glib' 'libgee')
makedepends=('meson' 'gobject-introspection' 'vala')
checkdepends=('appstream-glib')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha512sums=('b37af2cf047b105b30a6eac0abea7f1e5fa3a361b1157ba09b710106caa88a98d9112074f5de1f23a415440d14a00161f1a9c4f9f272e0f2443bf0968dd107cb')

build() {
  arch-meson ${pkgname%-palette}-${pkgver} build
  meson compile -C build
}

check() {
  meson test -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
