# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=newelle
pkgdesc='Your Ultimate Virtual Assistant'
pkgver=0.1.7
pkgrel=1
arch=('any')
url="https://github.com/qwersyk/Newelle"
license=('GPL3')
depends=('python' 'libadwaita')
makedepends=('git' 'meson')
source=("git+$url.git#tag=$pkgver")
sha256sums=('SKIP')

build() {
  arch-meson Newelle build
  meson compile -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
  chmod +x "$pkgdir/usr/bin/$pkgname"
  install -Dm644 Newelle/README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 Newelle/COPYING -t "$pkgdir/usr/share/licenses/$pkgname"
}
