# Maintainer: Dotz0cat <Dotz0cat@gmail.com>
pkgname=walld
pkgver=1.4
pkgrel=1
pkgdesc="A wallpaper daemon"
arch=("x86_64")
url="https://github.com/Dotz0cat/walld"
license=('GPL3')
depends=('feh' 'imagemagick' 'libevent' 'libconfig')
makedepends=('meson')
optdepends=('xorg-xrdb: automatically reload xrdb')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/Dotz0cat/walld/archive/refs/tags/${pkgver}.tar.gz)
sha256sums=('368fd646e4474e38ff7482a9ee24695b140c292329deac38e6d3356056ba9b97')

build() {
  arch-meson $pkgname-$pkgver build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
