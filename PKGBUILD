# Maintainer: Juanjo Gutierrez <juanjo at gutierrezdequevedo dot com>
pkgname=lunasvg
pkgver=2.3.0
pkgrel=1
pkgdesc="standalone SVG rendering library in C++ "
arch=('x86_64' 'aarch64')
url="https://github.com/sammycage/lunasvg"
license=('MIT')
makedepends=('cmake')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c1a4faef9bc2f65f8c64a2770c7e10753178e7318b8f6e09b1a4f1a495524e7c')

build() {
    cd "$pkgname-$pkgver"
    rm -fr build
    mkdir build
    cd build
    cmake -DCMAKE_INSTALL_PREFIX="/usr" ..
    make
}

package() {
    cd "$pkgname-$pkgver/build"
    make DESTDIR="$pkgdir/" install
}
