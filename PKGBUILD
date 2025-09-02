# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=rewaita
pkgver=1.0.7
pkgrel=1
pkgdesc="A tool for recoloring GTK4/LibAdwaita apps to popular color schemes."
arch=('any')
url="https://github.com/SwordPuffin/Rewaita"
license=('GPL-3.0-or-later')
depends=(
  'gtk4'
  'libadwaita'
  'libportal'
  'python-gobject'
)
makedepends=('meson')
source=("Rewaita-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('3047545aac0f790ecedf122ff8054f174d69d4a80d450114dd2b08adb7e62d47')

build() {
  arch-meson "Rewaita-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --no-rebuild --print-errorlogs
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
