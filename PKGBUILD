# Maintainer: Frederick Price <fprice at pricemail dot ca >

pkgname=google-location-history-converter
pkgver=0.1.0
pkgrel=1
pkgdesc='google-location-history-converter takes downloaded Google Location Takeout data and converts it to KML'
arch=(x86_64)
url="https://github.com/rickprice/${pkgname}"
license=("BSD")
makedepends=(stack)  
conflicts=("${pkgname}")
source=("${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('ef9902913e19d42cc7ebf27b1bb36f5f1f8187672b263d574e94383f3f96847b')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    stack build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    stack install --local-bin-path "${pkgdir}/usr/bin"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
