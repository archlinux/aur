# Maintainer: hellosway hellosway@protonmail.com
pkgname=mcpppp
pkgver=0.5.7
pkgrel=1
pkgdesc="Converter for minecraft resourcepacks"
arch=('x86_64' 'aarch64')
url="https://github.com/supsm/MCPPPP"
license=('MPL-2.0')
conflicts=(mcpppp-git)
source=(https://github.com/supsm/MCPPPP/archive/refs/tags/$pkgver.tar.gz)
md5sums=('665d2823e86e78c4b160ca2a9aa0f92a')

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
