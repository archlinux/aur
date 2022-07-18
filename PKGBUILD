# Maintainer: Malte Jürgens <maltejur@dismail.de>

pkgname=discord-screenaudio
_pkgver=1.0.0-rc.4
pkgver=$(echo "$_pkgver" | sed 's/-/./')
pkgrel=1
pkgdesc="Custom discord client with the ability to stream desktop audio"
arch=("x86_64")
url="https://github.com/maltejur/discord-screenaudio"
license=("GPL-3.0")
depends=(pipewire)
makedepends=(cmake qt5-base qt5-webengine pipewire)
source=("$pkgname-$_pkgver.tar.gz::https://github.com/maltejur/$pkgname/archive/refs/tags/v$_pkgver.tar.gz")
sha256sums=("296b91bccf2e883699b339673422721aa687312e5567fc814ee8712a8de88177")

build() {
  cmake -B build -S $pkgname-$_pkgver -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build --config Release
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
