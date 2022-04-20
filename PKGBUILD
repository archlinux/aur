# Maintainer: Dotz0cat <Dotz0cat@gmail.com>
pkgname=walld
pkgver=1.3
pkgrel=1
pkgdesc="A wallpaper daemon"
arch=("x86_64")
url="https://github.com/Dotz0cat/walld"
license=('GPL3')
depends=('feh' 'imagemagick' 'libevent' 'libconfig')
makedepends=('meson')
optdepends=('xorg-xrdb: automatically reload xrdb')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/Dotz0cat/walld/archive/refs/tags/${pkgver}.tar.gz)
sha256sums=('6b07278cce5757b3d462f7dc824c67a2973981d5578aecc0cffe8fc3bffa92e4')

build() {
  arch-meson $pkgname-$pkgver build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
