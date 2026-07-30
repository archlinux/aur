# Maintainer: Chart-ic <contact@ch45.c01.kr>
pkgname=psmp
pkgver=1.0.0
pkgrel=1
pkgdesc="Music Player built with Qt6 and miniaudio"
arch=('x86_64')
url="https://github.com/Chart-ic/music-player"
license=('MIT')

depends=('qt6-base' 'qt6-declarative')
makedepends=('cmake' 'git' 'ninja')

source=("git+https://github.com/Chart-ic/music-player.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
    cmake -B build -S music-player \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -GNinja

    cmake --build build
}

package() {
    install -Dm755 build/music_player "$pkgdir/usr/bin/psmp"
    #install -Dm644 music-player/LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
