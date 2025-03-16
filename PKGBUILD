# Maintainer: TheBill2001 <tuantran1632001 at gmail dot com>

pkgname=qtcreator-discord-rich-presence-plugin
pkgver=1.0.1
pkgrel=1
pkgdesc="Spell Checker plugin for the Qt Creator IDE"
groups=('qt')
arch=('x86_64')
url="https://github.com/TheBill2001/qtcreator-discord-rich-presence-plugin"
license=('GPL-3.0-only')
depends=(
    'qtcreator'
    'discord-game-sdk'
)
makedepends=(
    'cmake'
    'extra-cmake-modules'
    'qtcreator-devel'
)
source=("$pkgname-$pkgver.tar.gzr::${url}/archive/v$pkgver.tar.gz")
sha256sums=('dcfbe232c144ddda8e8f2da0db4a15b0b61edf34da9118b4050c7f237487ccb0')

build() {
    cmake \
        -S qtcreator-discord-rich-presence-plugin-$pkgver\
        -B build \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -DCMAKE_PREFIX_PATH="/usr/lib/cmake/Qt6" \
        -Wno-dev
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
