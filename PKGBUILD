# Maintainer: Gabriel-Andrew Pollo-Guilbert <gabrielpolloguilbert@gmail.com>

pkgname=lib32-oniguruma
pkgver=6.9.8
pkgrel=1
pkgdesc='Oniguruma is a regular expressions library.'
arch=('x86_64')
url='http://www.geocities.jp/kosako3/oniguruma/'
license=('BSD')
depends=('oniguruma')
source=("https://github.com/kkos/oniguruma/releases/download/v$pkgver/onig-$pkgver.tar.gz")
sha256sums=('28cd62c1464623c7910565fb1ccaaa0104b2fe8b12bcd646e81f73b47535213e')

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


