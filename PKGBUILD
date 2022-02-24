# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=spedread
_pkgname=Spedread
pkgver=2.1.1
pkgrel=1
pkgdesc="GTK speed reading software: Read like a speedrunner!"
arch=('x86_64')
url="https://github.com/Darazaki/Spedread"
license=('GPL3')
depends=('gtk4' 'glib2')
makedepends=('meson' 'vala')
checkdepends=('appstream-glib')
source=("${url}/archive/v${pkgver}.tar.gz")
b2sums=('f130d5481d2e4a7c725945c651f057f9cc087614f62e0a4bb40b685164ee59d300c4a33d5debb6d1166da361957cb33d124f8754374861db068ae826c591928c')

build() {
  arch-meson "$_pkgname-$pkgver" build
  meson compile -C build
}

#check() {
#  meson test -C build
#}

package() {
  meson install -C build --destdir "$pkgdir"
}
