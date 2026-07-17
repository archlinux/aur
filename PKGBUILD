# Maintainer: NodeRelay <joe@linuxdojo.org>
pkgname=uplink-irc
pkgver=2026.7.7
pkgrel=1
pkgdesc="Fast, secure, IRCv3-featured IRC client (Qt6)"
arch=('x86_64')
url="https://uplinkirc.chat"
license=('GPL-3.0-only')
depends=('qt6-base' 'qt6-svg' 'qt6-websockets' 'qtkeychain-qt6' 'hicolor-icon-theme')
makedepends=('cmake' 'tomlplusplus')
source=("$pkgname-$pkgver.tar.gz::https://github.com/noderelay/UplinkIRC/archive/v$pkgver.tar.gz")
sha256sums=('718c05bf746495f6d350769114c8bfd52ba6f58117e27a9821b3c5707ab70f28')

build() {
    cmake -B build -S "UplinkIRC-$pkgver" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DUPLINK_VENDOR_DEPS=OFF \
        -DUPLINK_BUILD_TESTS=OFF
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
