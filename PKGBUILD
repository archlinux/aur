# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=iotas
pkgver=0.1.1
pkgrel=1
pkgdesc="Simple note taking"
arch=('x86_64')
url="https://gitlab.gnome.org/cheywood/iotas"
license=('GPL3')
depends=('glib2' 'libadwaita')
makedepends=('meson' 'gobject-introspection')
checkdepends=('appstream-glib')
source=($url/-/archive/$pkgver/$pkgname-$pkgver.tar)
b2sums=('707ea73cf03c5976b67639fa8c0668eb33f56751e885e206d172b018c8ebed4b7b2a6e68a8a680401773d252843a0ac4e34f71cbf2f59bbfa755003d64fb5de8')

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
