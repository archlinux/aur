# Maintainer: Hannes Graeuler <hgraeule @ uos dot de>
pkgname=pngquant
pkgver=2.5.0
pkgrel=1
pkgdesc="command-line utility to quantize PNGs down to 8-bit paletted PNGs"
arch=('i686' 'x86_64')
url="http://pngquant.org/"
license=('BSD')
depends=('libpng' 'zlib')
source=("http://pngquant.org/$pkgname-$pkgver-src.tar.bz2")
sha1sums=('495ab14466d10b6f653bb4f20cf2d2ddd8454969')

build() {
    cd "$srcdir/pngquant-$pkgver"
    unset CFLAGS
    make
}

package() {
    cd "$srcdir/pngquant-$pkgver"
    mkdir -p "$pkgdir/usr/bin"
    unset CFLAGS
    make PREFIX="$pkgdir/usr" install
    mkdir -p "$pkgdir/usr/share/licenses/pngquant"
    cp COPYRIGHT "$pkgdir/usr/share/licenses/pngquant/LICENSE"
}

