# Maintainer: hellosway hellosway@protonmail.com
pkgname=mcpppp
pkgver=0.5.6
pkgrel=1
pkgdesc="Converter for minecraft resourcepacks"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/supsm/MCPPPP"
license=('MPL-2.0')
makedepends=('git' 'gcc')
conflicts=(mcpppp-git)
source=(https://github.com/supsm/MCPPPP/archive/refs/tags/$pkgver.tar.gz)
md5sums=('f7d40a9979a7ced73b9403409e27d3bf')

build() {
    cd "${pkgname^^}-$pkgver"
    g++ Source.cpp -Ofast -std=c++17 -o bin/mcpppp
}

package() {
    cd ${pkgname^^}-$pkgver
    mkdir "$pkgdir/usr"
    mkdir "$pkgdir/usr/bin"
    cp bin/mcpppp "$pkgdir/usr/bin"
}
