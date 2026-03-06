# Maintainer: BitterSteel
pkgname=karnmap
pkgver=1.0
pkgrel=1
pkgdesc="A CLI Karnaugh Map simplifier supporting 2-4 variables with don't care conditions"
arch=('x86_64')
url="https://github.com/ido55/karnmap"
license=('MIT')
depends=('gcc-libs')
makedepends=('cmake' 'ninja')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ido55/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('afa06f391e91892bce9e54a4fd5472f58d8f0adb1fd63643c9cdd8f705194c86')

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
