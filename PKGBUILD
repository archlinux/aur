# Maintainer: Emeric Grange <emeric.grange@gmail.com>

pkgname=watchflower
pkgver=0.10
pkgrel=1
pkgdesc="WatchFlower is a plant monitoring application that reads and plots datas from your Xiaomi / MiJia 'Flower Care' and 'Ropot' Bluetooth sensors and thermometers!"
arch=("i686" "x86_64")
url="https://github.com/emericg/WatchFlower"
license=("GPL3")
depends=("qt5-base" "qt5-connectivity" "qt5-charts" "qt5-svg")
makedepends=("qt5-tools")

source=("https://github.com/emericg/WatchFlower/archive/v${pkgver}.zip")
sha256sums=('74565d4995696f861244b1db35dfd6498d0b5af35a2339ae1a286cec742c9d93')

build() {
  mkdir -p "WatchFlower-${pkgver}"
  cd "WatchFlower-${pkgver}"
  qmake -config release PREFIX=${pkgdir}/usr/
  make
}

package() {
  cd "WatchFlower-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
