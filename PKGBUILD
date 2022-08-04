# Maintainer: Dotz0cat <Dotz0cat@gmail.com>
pkgname=walld
pkgver=1.4.4
pkgrel=1
pkgdesc="A wallpaper daemon"
arch=('any')
url="https://github.com/Dotz0cat/walld"
license=('GPL3')
depends=('feh' 'imagemagick' 'libevent' 'libconfig')
makedepends=('meson')
optdepends=('xorg-xrdb: automatically reload xrdb')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/Dotz0cat/walld/archive/refs/tags/${pkgver}.tar.gz)
sha256sums=('abffb9af4cce3e7cba83364305d919088434a8b4c1863721deef0d9bb9836019')

build() {
  arch-meson $pkgname-$pkgver build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
