# Maintainer: Emeric Grange <emeric.grange@gmail.com>

pkgname=watchflower
pkgver=0.1.1
pkgrel=1
pkgdesc="WatchFlower helps you read and plot datas from your Xiaomi 'Flower Care' devices!"
arch=("i686" "x86_64")
url="https://github.com/emericg/WatchFlower"
license=("GPL3")
depends=("qt5-base" "qt5-connectivity" "qt5-charts" "qt5-svg" "sqlite")
makedepends=("qt5-tools")
source=("https://github.com/emericg/WatchFlower/archive/v${pkgver}.zip")
sha256sums=('93191cb21234b9b94cfb3722ec9db217a3ff898afa14854189a57d7972e4aac5')

build() {
  mkdir -p "WatchFlower-${pkgver}"
  cd "WatchFlower-${pkgver}"
  qmake -config release PREFIX=${pkgdir}/usr/
  make
}

package() {
  cd "WatchFlower-${pkgver}"
  make install
}

