# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=ultimate-tic-tac-toe
pkgver=0.2.1
_commit=81b27061fe2b8c7685e270964777494fb58adb5a
pkgrel=1
pkgdesc='Play Ultimate Tic Tac Toe'
url="https://github.com/Nokse22/ultimate-tic-tac-toe"
license=('GPL-3.0-or-later')
arch=('x86_64' 'aarch64')
depends=('libadwaita' 'python-gobject')
makedepends=('git' 'meson')
checkdepends=('appstream-glib')
source=("git+$url.git#commit=$_commit")
sha256sums=('SKIP')

build() {
  arch-meson $pkgname build
  meson compile -C build
}

check() {
  meson test -C build --no-rebuild --print-errorlogs
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
