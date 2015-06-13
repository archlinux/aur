# Maintainer: Kyle Keen <keenerd@gmail.com>

pkgname=dsd
pkgver=1.6.0
pkgrel=1
pkgdesc="Decoder for P25, ProVoice, X2-TDMA, DMR/MOTOTRBO, NXDN"
arch=('i686' 'x86_64')
url="https://github.com/szechyjs/dsd"
license=('custom:copyright')
depends=('mbelib')
source=("https://github.com/szechyjs/dsd/archive/v${pkgver}.tar.gz")
md5sums=('e1c8faf8b0156215ffefee6a614e07a3')

build() {
    cd "$srcdir/$pkgname-$pkgver"

    # ./configure is baloney
    make DEST_BASE="/usr"
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    install -d "$pkgdir/usr/bin"
    make install DEST_BIN="$pkgdir/usr/bin"
    install -Dm644 COPYRIGHT "$pkgdir/usr/share/licenses/$pkgname/COPYRIGHT"
    install -Dm644 README "$pkgdir/usr/share/doc/$pkgname/$pkgname.txt"
}
