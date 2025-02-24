# Maintainer: Juanjo Gutierrez <juanjo at gutierrezdequevedo dot com>
pkgname=lunasvg
pkgver=3.2.0
pkgrel=1
pkgdesc="standalone SVG rendering library in C++ "
arch=('x86_64' 'aarch64')
url="https://github.com/sammycage/lunasvg"
license=('MIT')
makedepends=('cmake')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('073629cf858bceff6fe938370d141ac7c0d21ce40acd4ffe1d56109b84d16e0d')

build() {
    cd "$pkgname-$pkgver"
    rm -fr build
    rm -fr plutovg
    git clone git@github.com:sammycage/plutovg.git
    cmake -B build .
    cmake --build build
}

package() {
    cd "$pkgname-$pkgver/build"
    make DESTDIR="$pkgdir/" install
}
