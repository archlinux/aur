# Maintainer: irring <majnkraftligry7@gmail.com>
pkgname=tdesktop-nolimit
pkgver=5.11.1
pkgrel=1
pkgdesc="Telegram Desktop with no account limit"
arch=('x86_64')
url="https://github.com/IRRatium/tdesktop-nolimit"
license=('GPL3')
depends=(
    'hunspell' 'ffmpeg' 'hicolor-icon-theme' 'lz4'
    'minizip' 'openal' 'ttf-opensans' 'xcb-util-keysyms'
    'qt6-imageformats' 'qt6-svg' 'qt6-wayland'
)
provides=('telegram-desktop')
conflicts=('telegram-desktop')
source=("$pkgname-$pkgver.tar.gz::https://github.com/IRRatium/tdesktop-nolimit/archive/refs/heads/master.tar.gz")
sha256sums=('SKIP')

build() {
    cd "tdesktop-nolimit-master"
    cmake -B build         -DCMAKE_BUILD_TYPE=Release         -DTDESKTOP_API_ID=2040         -DTDESKTOP_API_HASH=b18441a1ff607e10a989891a5462e627
    cmake --build build
}

package() {
    cd "tdesktop-nolimit-master"
    DESTDIR="$pkgdir" cmake --install build
}
