pkgname=escambo
pkgver=0.1.1
pkgrel=1
pkgdesc="An HTTP-based APIs test application for GNOME"
arch=(any)
url="https://github.com/CleoMenezesJr/escambo"
license=(GPL3)
depends=(gtksourceview5 libadwaita python-gobject python-requests)
makedepends=(blueprint-compiler meson)
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz)
sha512sums=(7d81f6c71d52f521a191378274d98648fd102e4ba6e97cbe5e9e1ee5ecae858ea2c611c7a13ba8b891cbbbf7f88a3cc441148d0208b8261cade592d6b81af531)

build() {
  arch-meson $pkgname-$pkgver build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
