# Maintainer: Thomas Gatzweiler <thomas.gatzweiler@gmail.com>

pkgname=flmsg
pkgver=2.0.15
pkgrel=2
pkgdesc="Forms management editor for Amateur Radio standard message formats"
arch=('i686' 'x86_64')
url="http://www.w1hkj.com/flmsg-help/index.html"
license=('GPL')
depends=('fldigi')
source=(http://downloads.sourceforge.net/project/fldigi/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('c28483b0694833fde01afa7b9b699558')

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
