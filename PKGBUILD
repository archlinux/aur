pkgname=escambo
pkgver=0.1.0
pkgrel=1
pkgdesc="An HTTP-based APIs test application for GNOME"
arch=(any)
url="https://github.com/CleoMenezesJr/escambo"
license=(GPL3)
depends=(gtksourceview5 libadwaita python-gobject python-requests)
makedepends=(blueprint-compiler meson)
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz)
sha512sums=(69b80d8781409df11090f3b2ed6dd350375c4bd6446315d50fe3d1ce7e003321dd45d2de2c9b2ac70e4e68d25384dfce0f625c4947475fb5f904c1995fa85840)

build() {
  arch-meson $pkgname-$pkgver build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
