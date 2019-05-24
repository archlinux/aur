# Maintainer: Fredrick Brennan <copypaste@kittens.ph>
# Contributor: Skef Iterum <https://github.com/skef>
pkgname=libuninameslist
pkgver=20190305
pkgrel=2
pkgdesc='Library with sparse array mapping for Unicode code points.'
url='https://github.com/fontforge/libuninameslist/'
arch=('x86_64')
license=('BSD')
provides=('libuninameslist')
conflicts=('libuninameslist')
source=('https://github.com/fontforge/libuninameslist/archive/20190305.zip')
sha256sums=('8140fbd532c95c0df7f56ab404a20fefd6d6f106bb96d323df83369b1f650c4c')

build() {
    cd "$srcdir/$pkgname"
    autoreconf -i
    automake
    ./configure \
        --prefix=/usr \
        --mandir=/usr/share/man 
    make
}

package() {
    cd "$srcdir/$pkgname"
    make DESTDIR="$pkgdir" install
}
