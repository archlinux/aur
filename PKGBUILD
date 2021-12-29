# Maintainer: Dotz0cat <Dotz0cat@gmail.com>
pkgname=walld
pkgver=1.2
pkgrel=1
pkgdesc="A wallpaper daemon"
arch=("x86_64")
url="https://github.com/Dotz0cat/walld"
license=('GPL3')
depends=('feh' 'imagemagick' 'libevent' 'libconfig')
optdepends=('xorg-xrdb: automatically reload xrdb')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/Dotz0cat/walld/archive/refs/tags/${pkgver}.tar.gz)
sha256sums=('22ee0c8603c5bc3d36c1d4e481915a835563190ea3b501b353836f2d248fe789')

build() {
  cd "$pkgname-$pkgver"

  make
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir" PREFIX=/usr install
}
