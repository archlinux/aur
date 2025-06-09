# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=pigment
pkgver=0.4.0
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
  'python-pydbus'
)
makedepends=('meson')
source=("Pigment-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('23b0f8c2785d0319d0e5dd998efac152c753e9df9a800b20b3177135dbdde3cb')

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
