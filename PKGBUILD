# Maintainer: Kyle Keen <keenerd@gmail.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Jason Chu <jason@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=gforth
pkgver=0.7.3
pkgrel=1
url="http://www.gnu.org/software/gforth/"
pkgdesc="Fast and portable implementation of the ANS Forth language"
arch=('i686' 'x86_64' 'armv6h')
license=('GPL3')
depends=('libtool')
source=("http://www.complang.tuwien.ac.at/forth/$pkgname/$pkgname-$pkgver.tar.gz")
options=('libtool')
install=$pkgname.install
md5sums=('96f2354ec8c4005e1a54035586ed683e')
md5sums=('ff484391e5cdf405867fcf96341820ab')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    CFLAGS='-std=gnu99' ./configure --prefix=/usr 
    make PREFIX=/usr -j1
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make PREFIX=/usr DESTDIR="$pkgdir" install
}

