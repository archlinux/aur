# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=desktopius
pkgver=1.0.8
pkgrel=1
pkgdesc="The application allows you to create and edit desktop files"
url="https://github.com/alexkdeveloper/dfc"
arch=('x86_64')
license=('GPL3')
depends=('granite')
makedepends=('git' 'meson' 'vala')
source=("desktopius::git+$url.git#tag=$pkgver")
sha256sums=('SKIP')

build() {
  arch-meson $pkgname build
  meson compile -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
  ln -s /usr/bin/com.github.alexkdeveloper.dfc "$pkgdir/usr/bin/$pkgname"
}
