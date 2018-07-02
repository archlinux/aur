# Maintainer: Emeric Grange <emeric.grange@gmail.com>

pkgname=watchflower
pkgver=0.2
pkgrel=1
pkgdesc="WatchFlower helps you read and plot datas from your Xiaomi 'Flower Care' devices!"
arch=("i686" "x86_64")
url="https://github.com/emericg/WatchFlower"
license=("GPL3")
depends=("qt5-base" "qt5-connectivity" "qt5-charts" "qt5-svg" "sqlite")
makedepends=("qt5-tools")

source=("https://github.com/emericg/WatchFlower/archive/v${pkgver}.zip")
sha256sums=('128c31c984faf431ab97f7fee007d0b599258d40353fb6ea51217d857c29a021')

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
