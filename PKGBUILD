# Maintainer: Frederick Price <fprice at pricemail dot ca >

pkgname=google-location-history-converter
pkgver=0.3.0
pkgrel=2
pkgdesc='google-location-history-converter takes downloaded Google Location Takeout data and converts it to KML'
arch=(x86_64)
url="https://github.com/rickprice/${pkgname}"
license=("BSD")
makedepends=(stack)  
conflicts=("${pkgname}")
source=("${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('b173d1f839d914e74fba004dc2bb56d22adafbff0093e4e9795527905ab357ab')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    stack build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    stack install --local-bin-path "${pkgdir}/usr/bin"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
