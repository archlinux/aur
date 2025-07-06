# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=ultimate-tic-tac-toe
pkgver=1.1.0
pkgrel=2
pkgdesc='Play Ultimate Tic Tac Toe'
url="https://github.com/Nokse22/ultimate-tic-tac-toe"
license=('GPL-3.0-or-later')
arch=('x86_64' 'aarch64')
depends=('libadwaita' 'python-gobject')
makedepends=('meson')
checkdepends=('appstream-glib')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f148595b1c01fb335deedc4c27b06b79daeb0eb3299b874b91bd9d860e30d775')

build() {
  arch-meson $pkgname-$pkgver build
  meson compile -C build
}

check() {
  meson test -C build --no-rebuild --print-errorlogs
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
