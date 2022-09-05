# Maintainer: Juanjo Gutierrez <juanjo at gutierrezdequevedo dot com>
pkgname=lunasvg
pkgver=2.3.2
pkgrel=1
pkgdesc="standalone SVG rendering library in C++ "
arch=('x86_64' 'aarch64')
url="https://github.com/sammycage/lunasvg"
license=('MIT')
makedepends=('cmake')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('12abe6865dd030adfac70c30592eaa25c4e34fa81379e5149b0186282721f40c')

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
