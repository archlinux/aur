# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=desktopius
pkgdesc='The application allows you to create and edit desktop files'
pkgver=1.0.7
pkgrel=1
arch=('x86_64')
url="https://github.com/alexkdeveloper/dfc"
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
