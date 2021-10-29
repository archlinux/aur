# Maintainer: Simone Cimarelli <aquilairreale@ymail.com>

pkgname=urlencode
pkgver=1.4.0
pkgrel=1
pkgdesc='base64-like encoder/decoder for URL percent-encoding'
arch=('x86_64' 'i686' 'pentium4')
url='https://github.com/AquilaIrreale/urlencode'
license=('GPL3')
source=("https://github.com/AquilaIrreale/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('685131bf72e23568c770bfbb573d14950aa9aa0b4198f6d842067a7777dc1b72a968d645d82e942dab9cae662a63721149b78667f986c94e09b2ae0ffd67828d')

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
