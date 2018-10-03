# Maintainer: Peter Ivanov <ivanovp@gmail.com>

pkgname=z80dasm
pkgver=1.1.5
pkgrel=1
pkgdesc="Disassembler for the Zilog Z80 microprocessor"
arch=('i686' 'x86_64')
url="http://www.tablix.org/~avian/blog/articles/z80dasm/"
license=('GPL2')
depends=()
source=(http://www.tablix.org/~avian/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('a4f2cd7ec99dfda66a80f2e72b3041ae')

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
