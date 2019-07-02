# Maintainer: Fredrick Brennan <copypaste@kittens.ph>
# Contributor: Skef Iterum <https://github.com/skef>
pkgname=libuninameslist
pkgver=20190701
pkgrel=1
pkgdesc='Library with sparse array mapping for Unicode code points.'
url='https://github.com/fontforge/libuninameslist/'
arch=('x86_64')
license=('BSD')
provides=('libuninameslist')
conflicts=('libuninameslist')
source=("https://github.com/fontforge/libuninameslist/archive/$pkgver.zip")
sha256sums=('4ff2c53663f5cef6d1626bdf2f1314107f8730d15633b1a7ac3649ed19863891')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    autoreconf -i
    automake
    ./configure \
        --prefix=/usr \
        --mandir=/usr/share/man 
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir" install
}
