# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=ultimate-tic-tac-toe
pkgdesc='Play Ultimate Tic Tac Toe'
pkgver=0.1.3
pkgrel=1
arch=('aarch64' 'x86_64')
url="https://github.com/Nokse22/ultimate-tic-tac-toe"
license=('GPL3')
depends=('libadwaita' 'python')
makedepends=('git' 'meson')
checkdepends=('appstream-glib')
source=("git+$url.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
  arch-meson $pkgname build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  DESTDIR="$pkgdir" meson install -C build
  chmod +x "$pkgdir/usr/bin/$pkgname"
}
