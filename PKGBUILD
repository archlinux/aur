# Maintainer: Dotz0cat <Dotz0cat@gmail.com>
pkgname=walld
pkgver=1.4.1
pkgrel=1
pkgdesc="A wallpaper daemon"
arch=("x86_64")
url="https://github.com/Dotz0cat/walld"
license=('GPL3')
depends=('feh' 'imagemagick' 'libevent' 'libconfig')
makedepends=('meson')
optdepends=('xorg-xrdb: automatically reload xrdb')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/Dotz0cat/walld/archive/refs/tags/${pkgver}.tar.gz)
sha256sums=('c13b94a680081cec8ae8bff21c3e52d9e4c70a7c506de0ff17d7c76b83ad883e')

build() {
  arch-meson $pkgname-$pkgver build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
