# Maintainer: Hannes Graeuler <hgraeule @ uos dot de>
pkgname=pngquant
pkgver=2.7.1
pkgrel=1
pkgdesc="command-line utility to quantize PNGs down to 8-bit paletted PNGs"
arch=('i686' 'x86_64')
url="http://pngquant.org/"
license=('BSD')
depends=('libpng' 'zlib')
source=("https://pngquant.org/$pkgname-$pkgver-src.tar.gz")
sha256sums=('6b9aa72083035ed29a56001e02e25f2ab009670ac80e91694cb3f6c4b3603d81')

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

