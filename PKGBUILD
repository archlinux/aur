# Maintainer: Thomas Gatzweiler <thomas.gatzweiler@gmail.com>

pkgname=flamp
pkgver=2.2.03
pkgrel=1
pkgdesc="A program for the Amateur Multicast Protocol"
arch=('i686' 'x86_64')
url="http://www.w1hkj.com/flamp2.1-help/index.html"
license=('GPL')
depends=('fldigi')
source=(http://downloads.sourceforge.net/project/fldigi/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('46c2c08516e7fa7c7c53e564c91e1f17')

build() {
    cd $pkgname-$pkgver
    ./configure --prefix=/usr
    make
}

check() {
    cd "$srcdir"/$pkgname-$pkgver
    make -k check
}

package() {
    cd "$srcdir"/$pkgname-$pkgver
    make DESTDIR="$pkgdir" install
}
