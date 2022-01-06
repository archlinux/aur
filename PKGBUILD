# Maintainer: Simone Cimarelli <aquilairreale@ymail.com>

pkgname=urlencode
pkgver=1.5.1
pkgrel=1
pkgdesc='base64-like encoder/decoder for URL percent-encoding'
arch=('x86_64' 'i686' 'pentium4')
url='https://github.com/AquilaIrreale/urlencode'
license=('GPL3')
source=("https://github.com/AquilaIrreale/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('291e6de944312e48d66b47f5ab0a6a1d81a0f05232a4e5989cb7027319419721861a16730dacf43288740b049564d10303ec4372416657a40ce8677924a318a4')

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
