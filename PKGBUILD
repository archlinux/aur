# Maintainer: Nathan <me@nathan.rip>
pkgname=quickcut
pkgver=0.1.0
pkgrel=1
pkgdesc="Lightweight video cutter powered by ffmpeg"
arch=('x86_64')
url="https://github.com/CallMeVerity/Quickcut"
license=('MIT')
depends=('qt6-base' 'qt6-declarative' 'qt6-multimedia' 'ffmpeg')
makedepends=('cmake' 'ninja' 'qt6-tools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/CallMeVerity/Quickcut/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('5dd3c61e03c0a59a3f646c59f2ba255ee8f7e64df4f2546bb4c2c9c83effcb9e')

build() {
    cmake -B build -S "Quickcut-$pkgver" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
