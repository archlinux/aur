# Maintainer: Emeric Grange <emeric.grange@gmail.com>

pkgname=watchflower
pkgver=0.3
pkgrel=1
pkgdesc="WatchFlower helps you read and plot datas from your Xiaomi 'Flower Care' devices!"
arch=("i686" "x86_64")
url="https://github.com/emericg/WatchFlower"
license=("GPL3")
depends=("qt5-base" "qt5-connectivity" "qt5-charts" "qt5-svg" "sqlite")
makedepends=("qt5-tools")

source=("https://github.com/emericg/WatchFlower/archive/v${pkgver}.zip")
sha256sums=('425f2b6959b8e7f2cd4b7ec4076e4efeb7b6b49707941e6aaf035c3cefff0dc6')

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
