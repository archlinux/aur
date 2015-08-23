# Contributor: Andreas Wagner < Andreas dot Wagner at em dot uni-frankfurt dot de >

pkgname=qvv
pkgver=4.04.2
pkgrel=1
pkgdesc="Qt-based image browser"
arch=('i686' 'x86_64')
url="http://cade.datamax.bg/qvv/"
license=('GPL2')
depends=('qt5-base' 'libxkbcommon-x11')
install=$pkgname.install
source=($pkgname-$pkgver.tar.gz::https://github.com/cade-vs/$pkgname/archive/$pkgver.tar.gz)

build() {
  cd "$pkgname-$pkgver/src"
  qmake qvv.qt5.pro
  make
}

package() {
  cd "$pkgname-$pkgver"
  install -dm755 "$pkgdir/usr/bin"
  install -dm755 "$pkgdir/usr/share/applications"
  install -dm755 $pkgdir/usr/share/icons/hicolor/{16x16/apps,128x128/apps}
  install -m755 src/qvv "$pkgdir/usr/bin/qvv"
  install -m644 qvv.desktop "$pkgdir/usr/share/applications/qvv.desktop"
  install -m644 images/qvv_icon_128x128.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/qvv.png"
  install -m644 images/qvv_icon_16x16.png "$pkgdir/usr/share/icons/hicolor/16x16/apps/qvv.png"
}

md5sums=('258b42527abec739d3496244aa495b7e')
