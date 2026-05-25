# Maintainer: Nathan <me@nathan.rip>
pkgname=quickcut
pkgver=0.1.1
pkgrel=1
pkgdesc="Lightweight video cutter powered by ffmpeg"
arch=('x86_64')
url="https://github.com/CallMeVerity/Quickcut"
license=('MIT')
depends=('qt6-base' 'qt6-declarative' 'qt6-multimedia' 'ffmpeg')
makedepends=('cmake' 'ninja' 'qt6-tools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/CallMeVerity/Quickcut/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b0a2b0d3f990af2ce80d0a98af73396e65bebf5a80c1421353ace08506b1c8c1')

build() {
    cmake -B build -S "Quickcut-$pkgver" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
