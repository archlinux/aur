# Maintainer: François CROLLET <fcrollet at gmail dot com>

pkgname=vpsplayer
pkgver=2.0
pkgrel=1
pkgdesc="High quality Variable Pitch and Speed audio player"
arch=('x86_64')
url="https://github.com/fcrollet/vpsplayer"
license=('GPL3')
depends=('qt6-base' 'qt6-multimedia' 'rubberband')
source=("https://github.com/fcrollet/vpsplayer/releases/download/v$pkgver/VPS_Player-$pkgver.tar.xz")
sha256sums=('62e222eeda5fcba5addd59edba86b0cfb65f48b420a159982c277d5cedcc3e02')

build() {
  cd "VPS_Player-$pkgver"
  qmake6 -makefile vpsplayer.pro
  make
}

package() {
  cd "VPS_Player-$pkgver"
  INSTALL_ROOT="$pkgdir" make install
}
