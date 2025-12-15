# Maintainer: Ranadeep B < mail at rnbguy dot at >
# Contributor: Ranadeep B < mail at rnbguy dot at >

_pkgname=wasmvm
pkgname="lib${_pkgname}"
_orgname=CosmWasm
pkgver=2.3.1
pkgrel=1
pkgdesc="Go bindings to the CosmWasm VM"
arch=(
    'x86_64'
    'aarch64'
)
url="https://github.com/${_orgname}/${_pkgname}"
license=('Apache')
source=("https://github.com/${_orgname}/${_pkgname}/raw/v${pkgver}/LICENSE")
sha256sums=('cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30')
sha256sums_x86_64=('95bb066f5a9af2b7518f79dc38dcd2603beb8dfd4e2e149aedb171c7674e3488')
sha256sums_aarch64=('f1e2e2f1320d5c5d8589e3735898ba17a09d3e056ea9663e95321f312652d5f4')
source_x86_64=("https://github.com/${_orgname}/${_pkgname}/releases/download/v${pkgver}/${pkgname}.x86_64.so")
source_aarch64=("https://github.com/${_orgname}/${_pkgname}/releases/download/v${pkgver}/${pkgname}.aarch64.so")

package() {
    install -Dm644 "${srcdir}/${pkgname}.${CARCH}.so" "${pkgdir}/usr/lib/${pkgname}.${CARCH}.so"
    ln -s "${pkgname}.${CARCH}.so" "${pkgdir}/usr/lib/${pkgname}.so"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
