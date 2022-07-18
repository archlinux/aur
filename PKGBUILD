# Maintainer: Malte Jürgens <maltejur@dismail.de>

pkgname=discord-screenaudio
pkgver=1.0.0.rc.3
pkgrel=1
pkgdesc="Custom discord client with the ability to stream desktop audio"
arch=("x86_64")
url="https://github.com/maltejur/discord-screenaudio"
license=("GPL-3.0")
depends=(pipewire)
makedepends=(cmake qt5-base qt5-webengine pipewire)
source=("$pkgname-$pkgver.tar.gz::https://github.com/maltejur/$pkgname/archive/refs/tags/v1.0.0-rc.3.tar.gz")
sha256sums=("112f0c30c9776826f92875b8f98ef06ddb86a1cf4ef1043189c1b92efee80ef0")

build() {
  cmake -B build -S $pkgname-1.0.0-rc.3 -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build --config Release
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
