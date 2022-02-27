# Maintainer: Your Name <youremail@domain.com>
pkgname=gnome-loop
_pkgname=loop
pkgver=1.0.1
pkgrel=1
pkgdesc="A simple audio loop machind for GNOME"
arch=('x86_64')
url="https://gitlab.gnome.org/danigm/loop"
license=('GPL3')
depends=(gtk4 libadwaita)
makedepends=(meson python)
checkdepends=('appstream-glib')
source=($url/-/archive/v$pkgver/$_pkgname-v$pkgver.tar)
b2sums=('c9e097140456d68e33bfdd69f2c7882f6dedf4bc149a2526676e72c419a09ed6f3ddbb67011305f8480def109049c6a65ffdd2bbdc9431d10b33616849973431')

build() {
  arch-meson "$_pkgname-v$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
