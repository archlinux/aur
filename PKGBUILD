# Maintainer: Gabriel-Andrew Pollo Guilbert <gabriel14_wii@hotmail.com>

pkgname=lib32-oniguruma
pkgver=6.2.0
pkgrel=1
pkgdesc='Oniguruma is a regular expressions library.'
arch=('x86_64')
url='http://www.geocities.jp/kosako3/oniguruma/'
license=('BSD')
depends=('oniguruma')
source=("https://github.com/kkos/oniguruma/releases/download/v$pkgver/onig-$pkgver.tar.gz")
sha256sums=('6561637f340c6cae468aa4df45c7a4d8525fad65495b0dcef72d749aa8733a4b')

build() {
    cd onig-${pkgver}

    export CC='gcc -m32'
    export CXX='g++ -m32'
    export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

    ./configure --libdir='/usr/lib32'

    make
}

package() {
    cd onig-${pkgver}

    make DESTDIR="${pkgdir}" install
}


