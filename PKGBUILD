# Maintainer: Nathan <me@nathan.rip>
pkgname=quickcut
pkgver=0.1.2
pkgrel=1
pkgdesc="Lightweight video cutter powered by ffmpeg"
arch=('x86_64')
url="https://github.com/CallMeVerity/Quickcut"
license=('MIT')
depends=('qt6-base' 'qt6-declarative' 'qt6-multimedia' 'ffmpeg')
makedepends=('cmake' 'ninja' 'qt6-tools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/CallMeVerity/Quickcut/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b4a6182793714fe0671cde3014331a7d8ce3f43b202249d7762306c33d88faf6')

build() {
    cmake -B build -S "Quickcut-$pkgver" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
