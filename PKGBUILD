# Maintainer: GI Jack <GI_Jack@hackermail.com>
# Contributor: Thomas Gatzweiler <thomas.gatzweiler@gmail.com>

pkgname=flamp
pkgver=2.2.05
pkgrel=2
pkgdesc="A program for the Amateur Multicast Protocol"
arch=('i686' 'x86_64')
url="http://www.w1hkj.com/flamp2.1-help/index.html"
license=('GPL')
groups=('w1hkj')
depends=('fldigi')
source=(http://downloads.sourceforge.net/project/fldigi/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('1f2cd3c8a754b71cb32544f0386aaedf')

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
