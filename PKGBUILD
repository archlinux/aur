# Maintainer: Simone Cimarelli <aquilairreale@ymail.com>

pkgname=urlencode
pkgver=1.3.1
pkgrel=1
pkgdesc='base64-like encoder/decoder for URL percent-encoding'
arch=('x86_64' 'i686' 'pentium4')
url='https://github.com/AquilaIrreale/urlencode'
license=('GPL3')
source=("https://github.com/AquilaIrreale/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('87a57d15b638575c899bddd6f5f37fca0123734fa76872a1af094073e8787f3f77845ec963243056b28554a021b03fc7d6491be6e6e6697a676ae546aba22b44')

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
