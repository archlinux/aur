# Maintainer: Peter Ivanov <ivanovp@gmail.com>

pkgname=z80dasm
pkgver=1.1.6
pkgrel=3
pkgdesc="Disassembler for the Zilog Z80 microprocessor"
arch=('i686' 'x86_64')
# www.tablix.org cannot be resolved
#url="http://www.tablix.org/~avian/blog/articles/z80dasm/"
url="https://launchpad.net/ubuntu/+source/z80dasm/1.1.6-1"
license=('GPL2')
depends=()
#source=(http://www.tablix.org/~avian/$pkgname/$pkgname-$pkgver.tar.gz)
source=(https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/$pkgname/$pkgver-1/z80dasm_$pkgver.orig.tar.gz)
#md5sums=('2b20ebc6d712ff7393030a6d35c20c4b')
md5sums=('2b20ebc6d712ff7393030a6d35c20c4b')
sha256sums=('76d3967bb028f380a0c4db704a894c2aa939951faa5c5630b3355c327c0bd360')

build() {
    cd $pkgname-$pkgver
    ./configure --prefix=/usr
    make
}

package() {
    cd $pkgname-$pkgver
    make DESTDIR="$pkgdir" install
    install -Dm755 src/$pkgname "$pkgdir/usr/bin/$pkgname"
    install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim:et:
