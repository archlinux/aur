# Maintainer: Hannes Graeuler <hgraeule @ uos dot de>

pkgname=pngquant
pkgver=2.10.1
pkgrel=1
pkgdesc="command-line utility to quantize PNGs down to 8-bit paletted PNGs"
arch=('i686' 'x86_64')
url="http://pngquant.org/"
license=('BSD')
depends=('libpng' 'zlib')
source=("https://pngquant.org/$pkgname-$pkgver-src.tar.gz")
sha256sums=('e07a21fe37b6ae9fa5524f1e20a8e73b698566d42d2cc3edd469531745faa850')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -dm755 "$pkgdir/usr/bin"
    make PREFIX="$pkgdir/usr" install
    install -Dm644 COPYRIGHT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
