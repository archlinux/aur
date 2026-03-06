# Maintainer: BitterSteel
pkgname=baseconv
pkgver=1.0
pkgrel=1
pkgdesc="A CLI tool to convert numbers between binary, decimal and hexadecimal"
arch=('x86_64')
url="https://github.com/ido55/baseconv"
license=('MIT')
depends=('gcc-libs')
makedepends=('cmake' 'ninja')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ido55/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('3781e744cbd04ec0bf0f6904b73280e346b2f5f3c080276c1229dbe2ddf844f0')

build() {
    cd "$pkgname-$pkgver"
    cmake -B build -G Ninja \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package() {
    cd "$pkgname-$pkgver"
    DESTDIR="$pkgdir" cmake --install build
}
