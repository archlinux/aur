# Maintainer: NodeRelay <joe@linuxdojo.org>
pkgname=uplink-irc
pkgver=2026.7.8
pkgrel=1
pkgdesc="Fast, secure, IRCv3-featured IRC client (Qt6)"
arch=('x86_64')
url="https://uplinkirc.chat"
license=('GPL-3.0-only')
depends=('qt6-base' 'qt6-svg' 'qt6-websockets' 'qtkeychain-qt6' 'tomlplusplus' 'hicolor-icon-theme')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/noderelay/UplinkIRC/archive/v$pkgver.tar.gz")
sha256sums=('8cc846d95dd2b3e7cfed7040d21c05b631eeab1a1dc36ccb797da5617f7f258f')

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
