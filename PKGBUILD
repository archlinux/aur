# Maintainer: Malte Jürgens <maltejur@dismail.de>

pkgname=discord-screenaudio
pkgver=1.0.0.rc.2
pkgrel=1
pkgdesc="Custom discord client with the ability to stream desktop audio"
arch=("x86_64")
url="https://github.com/maltejur/discord-screenaudio"
license=("GPL-3.0")
depends=(pipewire)
makedepends=(cmake qt5-base qt5-webengine pipewire)
source=("$pkgname-$pkgver.tar.gz::https://github.com/maltejur/$pkgname/archive/refs/tags/v1.0.0-rc.2.tar.gz")
sha256sums=("b999c9d3f99f9e5b0c30b1ae18e6620e8b6e380eaaadc5db144eeab33d0d6078")

build() {
  cmake -B build -S $pkgname-1.0.0-rc.2 -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build --config Release
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
