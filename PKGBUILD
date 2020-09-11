# Maintainer: fkxxyz <fkxxyz@163.com>
# Contributer: fkxxyz <fkxxyz@163.com>

pkgname=rockchip-video-driver
pkgver=0.14.2
pkgrel=1
pkgdesc="The VA-API library for the Rock-Chips."
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/hizukiayaka/rockchip-video-driver"
license=('GPL2')
depends=('libva')
makedepends=('cmake')
source=("https://github.com/hizukiayaka/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('0a9b20c0e0092cfde1a96fc33abfdc0554942a728d6e4a549009cdfef7c36bd6')

build() {
  cd "${pkgname}-${pkgver}"
  
  cmake -Bbuild \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  cd "${pkgname}-${pkgver}"
  
  DESTDIR="${pkgdir}" cmake --build build --target install
}


