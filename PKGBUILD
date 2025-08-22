# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=rewaita
pkgver=1.0.5
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
sha256sums=('46961ccae257f587ba72b22bd0816d404c47fd87882e423a09645219e941551e')

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
