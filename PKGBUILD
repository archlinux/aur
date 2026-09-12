# Maintainer: imjiaoyuan <imjiaoyuan@gmail.com>

pkgname=fastv
pkgver=0.10.0
pkgrel=1
pkgdesc="Ultra-fast tool for identifying anomic microbes from sequencing data"
arch=('x86_64')
url="https://github.com/OpenGene/fastv"
license=('MIT')
options=('!strip' '!debug')
depends=('glibc' 'zlib')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('06acd1b57f1d3df0dbd344f7b47506b7a0b667481a36263a6ebbe3710f3d361f')

build() {
    cd "$srcdir/fastv-$pkgver"
    make INCLUDE_DIRS=/usr/include LIBRARY_DIRS=/usr/lib
}

check() {
    cd "$srcdir/fastv-$pkgver"
    ./fastv --version
}

package() {
    cd "$srcdir/fastv-$pkgver"
    install -Dm755 fastv "$pkgdir/usr/bin/fastv"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
