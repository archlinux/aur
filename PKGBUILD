# Maintainer: Simone Cimarelli <aquilairreale@ymail.com>

pkgname=urlencode
pkgver=1.6.0
pkgrel=1
pkgdesc='base64-like encoder/decoder for URL percent-encoding'
arch=('i486' 'i686' 'pentium4' 'x86_64' 'armv7h' 'aarch64')
url='https://github.com/AquilaIrreale/urlencode'
license=('GPL3')
source=("https://github.com/AquilaIrreale/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('68706507cfa798f535bb2605c2f267145d592ddc45d8f00ef296ce335460df60ced710ea684f37946a2a59fa4372e67e5352c5fc78eb099804dbf1399acd60c6')

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
