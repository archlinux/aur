# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@kth.se>

pkgname=sleep-until
pkgver=2
pkgrel=1
pkgdesc='Sleep until a specified time'
arch=('i686' 'x86_64')
url='https://github.com/maandree/sleep-until'
license=('custom:ISC')
depends=('linux>=2.6.25' 'glibc>=2.8')
makedepends=('glibc>=2.8' 'gcc' 'sed' 'auto-auto-complete')
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(42d36bf374aa4505d82715bea95d907161619aa4a549432e907b0ab8e1eecdcb)

build() {
    cd "$srcdir/sleep-until-$pkgver"
    make
}

package() {
    cd "$srcdir/sleep-until-$pkgver"
    make install DESTDIR="$pkgdir"
}
