# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=tictactoy
pkgdesc='A simple TIC-TAC-toe game'
pkgver=1.0.6
pkgrel=2
arch=('x86_64')
url="https://github.com/alexkdeveloper/tictactoy"
license=('GPL3')
depends=('granite')
makedepends=('git' 'meson' 'vala')
source=("git+$url.git#tag=$pkgver")
sha256sums=('SKIP')

build() {
  arch-meson $pkgname build
  meson compile -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
  ln -s /usr/bin/com.github.alexkdeveloper.$pkgname "$pkgdir/usr/bin/$pkgname"
}
