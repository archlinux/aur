# Maintainer: xzl01 <xiangzelong@radxa.com>
pkgname=fiilctl
pkgver=1.0.0
pkgrel=1
pkgdesc="FIIL 蓝牙耳机控制台（Qt Quick 界面，走经典蓝牙 SPP，免手机 App）"
arch=('x86_64' 'aarch64')
url="https://github.com/xzl01/fiilctl"
license=('MIT')
depends=('qt6-base' 'qt6-declarative' 'bluez-utils')
makedepends=('cmake' 'ninja' 'bluez-libs')
provides=('fiilctl')
source=("$pkgname-$pkgver.tar.gz::https://github.com/xzl01/fiilctl/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('3a110beb2a5bd6df5bbad97c8219890cb56928796c2f7e70066ae1411bc808e2')

build() {
  cmake -S "$pkgname-$pkgver" -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
