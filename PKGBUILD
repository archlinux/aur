# Maintainer: Simone Cimarelli <aquilairreale@ymail.com>

pkgname=urlencode
pkgver=1.2.1
pkgrel=1
pkgdesc='base64-like encoder/decoder for URL percent-encoding'
arch=('x86_64' 'i686' 'pentium4')
url='https://github.com/AquilaIrreale/urlencode'
license=('GPL3')
source=("https://github.com/AquilaIrreale/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('59cef50a5f2f1fb6f7946a34db13ed754d30a816dafbca942f75b7c5e9c12a8f4360395e3f184cafdafedc4e8e4011c835b2976c0801d68d7485c526a0bac38b')

prepare() {
    cd "${pkgname}-${pkgver}"
    ./autogen.sh
}

build() {
    cd "${pkgname}-${pkgver}"
    ./configure --prefix="$pkgdir/usr"
    make
}

package() {
    cd "${pkgname}-${pkgver}"
    make install
}
