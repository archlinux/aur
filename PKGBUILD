# Maintainer: Hannes Graeuler <hgraeule @ uos dot de>
pkgname=pngquant
pkgver=2.5.2
pkgrel=1
pkgdesc="command-line utility to quantize PNGs down to 8-bit paletted PNGs"
arch=('i686' 'x86_64')
url="http://pngquant.org/"
license=('BSD')
depends=('libpng' 'zlib')
source=("http://pngquant.org/$pkgname-$pkgver-src.tar.bz2")
sha256sums=('5b064596305c6f765a753e96e08224dd71b31c20b72bdaf0f205da16b76a347d')

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

