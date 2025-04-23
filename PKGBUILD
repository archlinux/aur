# Maintainer: Ranadeep B < mail at rnbguy dot at >
# Contributor: Ranadeep B < mail at rnbguy dot at >

_pkgname=wasmvm
pkgname="lib${_pkgname}"
_orgname=CosmWasm
pkgver=2.2.3
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
sha256sums_x86_64=('aa0bf5358dba094bda22f6eedb5bf10e86cee44584ccb2ccee54311f11bf7a3a')
sha256sums_aarch64=('50dcd5befdbfd74764739c333caf79481b5eaf0b6f15de8cac741a74594b2a03')
source_x86_64=("https://github.com/${_orgname}/${_pkgname}/releases/download/v${pkgver}/${pkgname}.x86_64.so")
source_aarch64=("https://github.com/${_orgname}/${_pkgname}/releases/download/v${pkgver}/${pkgname}.aarch64.so")

package() {
    install -Dm644 "${srcdir}/${pkgname}.${CARCH}.so" "${pkgdir}/usr/lib/${pkgname}.${CARCH}.so"
    ln -s "${pkgname}.${CARCH}.so" "${pkgdir}/usr/lib/${pkgname}.so"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
