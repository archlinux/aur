# Maintainer: Peter Ivanov <ivanovp@gmail.com>

pkgname=z80dasm
pkgver=1.1.6
pkgrel=2
pkgdesc="Disassembler for the Zilog Z80 microprocessor"
arch=('i686' 'x86_64')
# www.tablix.org cannot be resolved
#url="http://www.tablix.org/~avian/blog/articles/z80dasm/"
url="https://launchpad.net/ubuntu/+source/z80dasm/1.1.6-1"
license=('GPL2')
depends=()
#source=(http://www.tablix.org/~avian/$pkgname/$pkgname-$pkgver.tar.gz)
source=(https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/$pkgname/$pkgver-1/z80dasm_$pkgver-1.debian.tar.xz)
#md5sums=('2b20ebc6d712ff7393030a6d35c20c4b')
md5sums=('4c0ec1111d71ea4280ebb2c517a532d3')
sha256sums=('9b1aff60e589daf2dcad57c0840d025473a4dfaf05a737199810f2676b14dbaf')

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
