# Maintainer: Frederick Price <fprice at pricemail dot ca >

pkgname=google-location-history-converter
pkgver=0.2.0
pkgrel=1
pkgdesc='google-location-history-converter takes downloaded Google Location Takeout data and converts it to KML'
arch=(x86_64)
url="https://github.com/rickprice/${pkgname}"
license=("BSD")
makedepends=(stack)  
conflicts=("${pkgname}")
source=("${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('a7a4504f000d3648947294135118411af2b7f0a8f261dd244bbf834af4e8f7d3')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    stack build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    stack install --local-bin-path "${pkgdir}/usr/bin"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
