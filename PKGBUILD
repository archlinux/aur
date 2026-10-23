# Maintainer: AnandRift <https://github.com/Anand-Rift>    Email:- <anand.anandrift@gmail.com>
pkgname=samflash
pkgver=0.1.0
pkgrel=2
pkgdesc="A GUI Samsung flashing tool (odin4 + heimdall)"
arch=('x86_64')
url="https://github.com/samflash"
license=('GPL-3.0-or-later')
depends=('qt6-base' 'heimdall' 'odin4')
makedepends=('cmake')
install=samflash.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1003a41d201775f183c3bfc11f0350cd4d90619526d8ea93fd17263ea37c9bb8')

build() {
  cmake -B build -S "$pkgname-$pkgver" \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
