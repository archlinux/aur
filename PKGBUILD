# Maintainer: Thomas Gatzweiler <thomas.gatzweiler@gmail.com>

pkgname=flamp
pkgver=2.2.02
pkgrel=1
pkgdesc="A program for the Amateur Multicast Protocol"
arch=('i686' 'x86_64')
url="http://www.w1hkj.com/flamp2.1-help/index.html"
license=('GPL')
depends=('fldigi')
source=(http://w1hkj.com/downloads/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('60fe6c7f9b76f2bf937a9a58e2bb7a68')

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
