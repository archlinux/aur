# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=pigment
pkgver=0.5.1
pkgrel=1
pkgdesc="Extract color palettes from your images"
arch=('any')
url="https://github.com/Jeffser/Pigment"
license=('GPL-3.0-or-later')
depends=(
  'gtk4'
  'libadwaita'
  'libportal'
  'python-colorthief'
  'python-gobject'
  'python-pillow'
  'python-pydbus'
)
makedepends=('meson')
source=("Pigment-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('8ee1844b61e4c7e045f5ff8f9eea4e70ff16e4d5ab303cb864408514a4f89483')

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
