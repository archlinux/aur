# Maintainer: mfwolffe <wolffemf@dukes.jmu.edu>
pkgname=fortty
pkgver=0.1.0
pkgrel=1
pkgdesc="GPU-accelerated terminal emulator written in Fortran"
arch=('x86_64')
url="https://github.com/FortranGoingOnForty/fortty"
license=('MIT')
depends=('glfw' 'freetype2' 'fontconfig')
makedepends=('cmake' 'gcc-fortran')
source=("$pkgname-$pkgver.tar.gz::https://github.com/FortranGoingOnForty/fortty/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('9b7c33683d6f1b79dfa00a16f46d693cf0673ca1e483c5af734e85ba6e562b12')

build() {
    cd "$pkgname-$pkgver"
    cmake -B build -DCMAKE_BUILD_TYPE=Release
    cmake --build build
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 build/fortty "$pkgdir/usr/bin/fortty"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
