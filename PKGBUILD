# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=ultimate-tic-tac-toe
pkgver=0.2.0
_commit=a9ae9da4d2bff3e3113a60825dc16d6f6f2bbf2a
pkgrel=2
pkgdesc='Play Ultimate Tic Tac Toe'
url="https://github.com/Nokse22/ultimate-tic-tac-toe"
license=('GPL-3.0-or-later')
arch=('x86_64' 'aarch64')
depends=('libadwaita' 'python')
makedepends=('git' 'meson')
checkdepends=('appstream-glib')
source=("git+$url.git#commit=$_commit")
sha256sums=('SKIP')

build() {
  arch-meson $pkgname build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
