# Maintainer: Gabriel-Andrew Pollo Guilbert <gabriel14_wii@hotmail.com>

pkgname=lib32-oniguruma
pkgver=5.9.6
pkgrel=1
pkgdesc='Oniguruma is a regular expressions library.'
arch=('x86_64')
url='http://www.geocities.jp/kosako3/oniguruma/'
license=('BSD')
depends=('oniguruma')
source=("http://www.geocities.jp/kosako3/oniguruma/archive/onig-${pkgver}.tar.gz")
sha256sums=('d5642010336a6f68b7f2e34b1f1cb14be333e4d95c2ac02b38c162caf44e47a7')

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


