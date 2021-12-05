# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=khronos
pkgver=3.6.6
pkgrel=1
pkgdesc="Track each task's time in a simple inobtrusive way"
arch=('x86_64')
url="https://github.com/lainsce/khronos"
license=('GPL3')
depends=('gtk4' 'json-glib' 'libadwaita' 'libgee')
makedepends=('meson' 'gobject-introspection' 'vala')
source=(${url}/archive/$pkgver.tar.gz)
sha512sums=('beebd090f87e1f0aa3d16fd7305f32b27b9c49cd8469e303fd8a77709244c5b754e95d8280584d6137a3375cbb6d575037719bf9de9ee7b98a05d36498c0d8ec')

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
