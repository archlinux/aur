# Maintainer: kamisaki
pkgname=animefetch
pkgver=0.1.0
pkgrel=1
pkgdesc="View your favorite anime details instantly in the terminal"
arch=('x86_64')
url="https://github.com/xeyossr/animefetch"
license=('GPL-3')
depends=('libcurl' 'curl') 
makedepends=('cmake' 'gcc' 'make')
source=("$pkgname-$pkgver.tar.gz::https://github.com/xeyossr/animefetch/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    mkdir -p build
    cd build
    cmake .. -DCMAKE_BUILD_TYPE=Release
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver/build"
    install -Dm755 animefetch "$pkgdir/usr/bin/animefetch"
}
