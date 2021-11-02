# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=khronos
pkgver=3.6.1
pkgrel=1
pkgdesc="Track each task's time in a simple inobtrusive way"
arch=('x86_64')
url="https://github.com/lainsce/khronos"
license=('GPL3')
depends=('gtk4' 'json-glib' 'libadwaita' 'libgee')
makedepends=('meson' 'gobject-introspection' 'vala')
source=(${url}/archive/$pkgver.tar.gz)
sha512sums=('49bfd02423e65583deb3bfabe278d8c59737e646fbe738c4be027e2c7ee808b37a0429abde84be96afdaadb050845ea75b89322ab11dc75d8d4a77b95d59349e')

build() {
  arch-meson ${pkgname%-git}-${pkgver} build
  meson compile -C build
}

check() {
  meson test -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
