# Maintainer: Manuel Coenen <manuel.coenen@gmail.com>
pkgname=timg
pkgver=0.9.9
pkgrel=1
pkgdesc="Terminal Image Viewer"
arch=('any')
url="https://github.com/hzeller/timg"
license=('GPL2')
depends=('libwebp' 'graphicsmagick')
source=("timg-$pkgver.tar.gz::https://github.com/hzeller/timg/archive/v$pkgver.tar.gz")
sha256sums=('f43df657e93d47a1184a81c0976e67978cbdce21a83be5ec1df83403cda24caf')

build() {
  cd $pkgname-$pkgver/src
  make
}

package() {
  cd $pkgname-$pkgver/src
  install -d "${pkgdir}/usr/"{bin,share/man/man1}
  make PREFIX="${pkgdir}/usr" install
}
