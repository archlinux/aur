pkgname=escambo
pkgver=0.1.2
pkgrel=1
pkgdesc="An HTTP-based APIs test application for GNOME"
arch=(any)
url="https://github.com/CleoMenezesJr/escambo"
license=(GPL3)
depends=(gtksourceview5 libadwaita python-gobject python-requests)
makedepends=(blueprint-compiler meson)
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz)
sha512sums=(2ffe84eb57e056ef490cbf559992c8c2515bc4547127631d3cb5d730ef6c3028670886a90696a9b2383a8fefca9a217b5b6441659a4b475486ee642b4e2db948)

build() {
  arch-meson $pkgname-$pkgver build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
