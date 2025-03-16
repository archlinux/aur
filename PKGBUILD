# Maintainer: TheBill2001 <tuantran1632001 at gmail dot com>

pkgname=qtcreator-discord-rich-presence-plugin
pkgver=1.0.2
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
sha256sums=('5d742071bbc6860efb041dca1e3ba9f05d1f5baa33cc6611a51473857ca5411d')

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
