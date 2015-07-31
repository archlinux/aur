# Maintainer: Thomas Gatzweiler <thomas.gatzweiler@gmail.com>

pkgname=flmsg
pkgver=2.0.12
pkgrel=1
pkgdesc="Forms management editor for Amateur Radio standard message formats"
arch=('i686' 'x86_64')
url="http://www.w1hkj.com/flmsg-help/index.html"
license=('GPL')
depends=('fldigi')
source=(http://w1hkj.com/downloads/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('e1e52679332f7bacdf5fcd4dd5cee8f5')

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
