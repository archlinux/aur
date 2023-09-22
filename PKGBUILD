# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=bmi
pkgdesc='Body mass index calculator'
pkgver=1.0.6
pkgrel=1
arch=('x86_64')
url="https://github.com/alexkdeveloper/bmi"
license=('GPL3')
depends=('granite' 'gtk3')
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
