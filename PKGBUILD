# Maintainer: Emeric Grange <emeric.grange@gmail.com>

pkgname=watchflower
pkgver=0.6
pkgrel=1
pkgdesc="WatchFlower is a plant monitoring application that reads and plots datas from your Xiaomi / MiJia 'Flower Care' and 'Ropot' devices!"
arch=("i686" "x86_64")
url="https://github.com/emericg/WatchFlower"
license=("GPL3")
depends=("qt5-base" "qt5-connectivity" "qt5-charts" "qt5-svg")
makedepends=("qt5-tools")

source=("https://github.com/emericg/WatchFlower/archive/v${pkgver}.zip")
sha256sums=('43cf1265ccf4274fdfedd941cbcc131830aee434d5f1d36bc441cb85bf923f50')

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
