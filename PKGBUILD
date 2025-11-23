# Maintainer: BonnyAD9 (Bonny4)
pkgname=uamp-ffmpeg
pkgver=0.1.0
pkgrel=3
pkgdesc="Ffmpeg decoder plugin for uamp (Universal Advanced Audio Player)."
arch=(x86_64)
url="https://github.com/BonnyAD9/uamp-ffmpeg/"
license=('GPL-3.0-or-later')
depends=(glibc gcc-libs ffmpeg)
makedepends=(git cargo)
optdepends=()
provides=()
source=("https://github.com/BonnyAD9/uamp-ffmpeg/archive/refs/tags/v$pkgver.tar.gz")
md5sums=('SKIP')
options=('!debug')

build() {
    cd "uamp-ffmpeg-$pkgver"
    make
}

package() {
    cd "uamp-ffmpeg-$pkgver"
    
    I_DIR="$pkgdir/usr/lib/uamp/plugins/"
    mkdir -p "$I_DIR"
    cp "target/Release/libuamp-ffmpeg.so" "$I_DIR"
    
    I_DIR="$pkgdir/usr/share/licenses/uamp-ffmpeg/"
    mkdir -p "$I_DIR"
    cp "LICENSE" "$I_DIR"
}