# Maintainer: Juanjo Gutierrez <juanjo at gutierrezdequevedo dot com>
pkgname=lunasvg
pkgver=2.3.4
pkgrel=1
pkgdesc="standalone SVG rendering library in C++ "
arch=('x86_64' 'aarch64')
url="https://github.com/sammycage/lunasvg"
license=('MIT')
makedepends=('cmake')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1933bf3fcdec81a1c17702b3c6efb00b9e3380e3fcea508f4ee4b11b0d2e45c0')

build() {
    cd "$pkgname-$pkgver"
    rm -fr build
    mkdir build
    cd build
    cmake -DBUILD_SHARED_LIBS=1 -DCMAKE_INSTALL_PREFIX="/usr" ..
    make
}

package() {
    cd "$pkgname-$pkgver/build"
    make DESTDIR="$pkgdir/" install
}
