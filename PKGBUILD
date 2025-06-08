# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=pigment
pkgver=0.3.0
pkgrel=1
pkgdesc="Extract color palettes from your images"
arch=('any')
url="https://github.com/Jeffser/Pigment"
license=('GPL-3.0-or-later')
depends=(
  'libadwaita'
  'python-colorthief'
  'python-gobject'
  'python-pillow'
)
makedepends=('meson')
source=("Pigment-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('9885c9a7008c7d7c2384c6034cbc62e28d423056667ae8658b7d74bdd3a06141')

build() {
  arch-meson "Pigment-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --no-rebuild --print-errorlogs
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
