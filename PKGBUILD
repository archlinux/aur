# Maintainer: suliman altassan <suliman.p2019@gmail.com>

pkgname=alif
pkgver=3.0.17
pkgrel=3
pkgdesc="The Alif Arabic Programming Language - لغة البرمجة العربية ألف"
arch=('x86_64')
url="https://www.aliflang.org/"
license=('GPL3')
depends=('boost')
source=("https://github.com/alifcommunity/compiler/archive/refs/tags/v3.0.17.tar.gz")
md5sums=('SKIP')

build() {
    cd $srcdir/compiler-$pkgver
    cmake . .
    make
}

package() {
    cd $srcdir/compiler-$pkgver
    mkdir -p $pkgdir/usr/local/lib/
    install -D Alif/alif $pkgdir/usr/local/bin/alif
    cp -vr aliflib $pkgdir/usr/local/lib/
}
