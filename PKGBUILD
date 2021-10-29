# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=emulsion-palette
pkgver=3.1.1
pkgrel=1
pkgdesc="Store your palettes in an easy way, and edit them if needed"
arch=('x86_64')
url="https://github.com/lainsce/emulsion"
license=('GPL3')
depends=('glib2' 'gtk4' 'libadwaita' 'json-glib' 'libgee')
makedepends=('meson' 'gobject-introspection' 'vala')
checkdepends=('appstream-glib')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha512sums=('996ae25c0a99378a9cc63ce7e02b4718645089068b078248a3b168f5ffbb196ca0ef8ad9de7f6cc7dcaae85b627de88ce6cddc9df5001fdc8d3cf524f456e473')

build() {
  arch-meson ${pkgname%-palette}-${pkgver} build
  meson compile -C build
}

#check() {
#  meson test -C build
#}

package() {
  meson install -C build --destdir "$pkgdir"
}
