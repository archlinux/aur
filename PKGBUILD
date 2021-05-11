pkgname='khello'
pkgver=0.8
pkgrel=2
arch=('x86_64')
url='https://kurth4cker.github.io/khello'
source=("http://launchpad.net/khello/trunk/0.8/+download/$pkgname-$pkgver.tar.xz")
md5sums=("0cad5de9de71d06d62ef957a168ce375")
description="Test and learning program created by kurth4cker."
license=("GPL")
depends=(glibc)

build () {
    cd $pkgname-$pkgver
    ./configure --prefix /usr
    make
}

check () {
    cd $pkgname-$pkgver
    make -k check
}

package () {
    cd $pkgname-$pkgver
    make DESTDIR=$pkgdir install
}
