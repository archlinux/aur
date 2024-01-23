# Maintainer: Frederick Price <fprice at pricemail dot ca >

pkgname=google-location-history-converter
pkgver=0.4.0
pkgrel=1
pkgdesc='google-location-history-converter takes downloaded Google Location Takeout data and converts it to KML'
arch=(x86_64)
url="https://github.com/rickprice/${pkgname}"
license=("BSD")
makedepends=(stack)  
conflicts=("${pkgname}")
source=("${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('c909c42c56280165428c1f271d685d3245043081dd8f6f3ba5131f8fe2c5eff9')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    stack build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    stack install --local-bin-path "${pkgdir}/usr/bin"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
