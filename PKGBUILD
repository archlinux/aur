# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=wardrobe
pkgver=1.1.2
pkgrel=1
pkgdesc="Desktop customization utility"
arch=('any')
url="https://github.com/SwordPuffin/Wardrobe"
license=('GPL-3.0-or-later')
depends=(
  'dconf'
  'gnome-autoar'
  'gtk4'
  'libadwaita'
  'libportal-gtk4'
  'libsoup3'
  'python-gobject'
  'xdg-utils'
)
makedepends=('meson')
source=("Wardrobe-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('51a34c01d7e9bbad7360b8979abe5486eb1fb2907df31cabb93ee2c28f1b0a8c')

build() {
  arch-meson "Wardrobe-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --no-rebuild --print-errorlogs
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
