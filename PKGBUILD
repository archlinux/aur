# Maintainer: Malte Jürgens <maltejur@dismail.de>

pkgname=discord-screenaudio
_pkgver=1.0.0-rc.5
pkgver=$(echo "$_pkgver" | sed 's/-/./')
pkgrel=1
pkgdesc="Custom discord client with the ability to stream desktop audio"
arch=("x86_64")
url="https://github.com/maltejur/discord-screenaudio"
license=("GPL-3.0")
depends=(pipewire)
makedepends=(cmake qt5-base qt5-webengine pipewire)
source=("$pkgname-$_pkgver.tar.gz::https://github.com/maltejur/$pkgname/archive/refs/tags/v$_pkgver.tar.gz")
sha256sums=("1bd4eadb52cf55be5f39a2d92aa5c3b83a8220e8c488d39f80b5544717c2a8c6")

build() {
  cmake -B build -S $pkgname-$_pkgver -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build --config Release
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
