# Maintainer: Emeric Grange <emeric.grange@gmail.com>

pkgname=watchflower
pkgver=0.14
pkgrel=1
pkgdesc="WatchFlower is a plant monitoring application that reads and plots data from your Xiaomi 'Flower Care' and 'RoPot' Bluetooth sensors and thermometers!"
arch=("x86_64" "i686")
url="https://github.com/emericg/WatchFlower"
license=("GPL3")
depends=("qt5-base" "qt5-connectivity" "qt5-charts" "qt5-svg")
makedepends=("qt5-tools")

source=("https://github.com/emericg/WatchFlower/archive/v${pkgver}.zip")
sha256sums=('290a9077560e661198e421d0f09dc897a34471c8ca30ed7015f3537d19b55abe')

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
