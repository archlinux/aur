# Maintainer: Peter Ivanov <ivanovp@gmail.com>

pkgname=z80dasm
pkgver=1.1.3
pkgrel=2
pkgdesc="Disassembler for the Zilog Z80 microprocessor"
arch=('i686' 'x86_64')
url="http://www.tablix.org/~avian/blog/articles/z80dasm/"
license=('GPL2')
depends=()
source=(http://www.tablix.org/~avian/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('66931f5e94c6722fe381d0b57d7177dd')

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
