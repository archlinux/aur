# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=nottist
pkgdesc='Simple notepad for GNU/Linux'
pkgver=1.0.0
pkgrel=2
arch=('x86_64')
url="https://github.com/alexkdeveloper/nottist"
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
