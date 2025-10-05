# Maintainer: kupira <skupira27@gmail.com>
arch=('x86_64')
pkgname=bluerice
pkgver=0.3.0   # static version
pkgrel=1
pkgdesc="Bluetooth utility with customizable menu"
makedepends=('git' 'cmake' 'make')
source=("git+https://github.com/kupira/BlueRice.git")
sha256sums=('SKIP')  # git source, skip checksum

build() {
    cd "$srcdir/BlueRice" || return 1
    echo "Building bluerice using CMake..."
    mkdir -p build
    cd build
    cmake .. -DCMAKE_BUILD_TYPE=Release
    make
}

package() {
    cd "$srcdir/BlueRice/build"
    echo "Installing bluerice..."
    install -Dm755 bluerice "$pkgdir/usr/bin/bluerice"
}

