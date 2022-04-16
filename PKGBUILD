# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=amberol
pkgver=0.3.0
pkgrel=1
pkgdesc="Plays music, and nothing else"
arch=('x86_64')
url="https://gitlab.gnome.org/ebassi/amberol"
license=('GPL3')
depends=('libadwaita' 'gstreamer' 'gst-plugins-base')
makedepends=('meson' 'rust')
checkdepends=('appstream-glib')
source=($url/-/archive/$pkgver/$pkgname-$pkgver.tar)
b2sums=('f23ca6d549869cf5b2134085c6ffcb092fadd69c1894f3311574d66429f7ce8fbd90018e6ee8c2a57e948fd3d22b2122d0900129374195bda0500b8a2379b246')

build() {
  arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
