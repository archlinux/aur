# Maintainer: NodeRelay <joe@linuxdojo.org>
pkgname=uplink-irc
pkgver=2026.8.1
pkgrel=1
pkgdesc="Fast, secure, IRCv3-featured IRC client (Qt6)"
arch=('x86_64')
url="https://uplinkirc.chat"
license=('GPL-3.0-only')
depends=('qt6-base' 'qt6-svg' 'qt6-websockets' 'qtkeychain-qt6' 'tomlplusplus' 'hicolor-icon-theme')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/noderelay/UplinkIRC/archive/v$pkgver.tar.gz")
sha256sums=('f37766a5ebc5b13a5b396d47b78a479a871359a2e8bf76b13ecd2798030634ad')

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
