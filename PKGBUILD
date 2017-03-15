# Maintainer: Hannes Graeuler <hgraeule @ uos dot de>

pkgname=pngquant
pkgver=2.9.0
pkgrel=1
pkgdesc="command-line utility to quantize PNGs down to 8-bit paletted PNGs"
arch=('i686' 'x86_64')
url="http://pngquant.org/"
license=('BSD')
depends=('libpng' 'zlib')
source=("https://pngquant.org/$pkgname-$pkgver-src.tar.gz")
sha256sums=('ed9ae6943a3520c7e14700692ebfbd568dad73790582efaeb4cab93104f21cfc')

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
