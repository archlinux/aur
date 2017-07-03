# Maintainer: Hannes Graeuler <hgraeule @ uos dot de>

pkgname=pngquant
pkgver=2.10.0
pkgrel=1
pkgdesc="command-line utility to quantize PNGs down to 8-bit paletted PNGs"
arch=('i686' 'x86_64')
url="http://pngquant.org/"
license=('BSD')
depends=('libpng' 'zlib')
source=("https://pngquant.org/$pkgname-$pkgver-src.tar.gz")
sha256sums=('89bcad5d0a289305cc5653d9ca75d3051b94f78ff293959a6956925c86fd08fe')

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
