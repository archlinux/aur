# Maintainer: Ranadeep B < mail at rnbguy dot at >
# Contributor: Ranadeep B < mail at rnbguy dot at >

_pkgname=wasmvm
pkgname="lib${_pkgname}"
_orgname=CosmWasm
pkgver=3.0.0
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
sha256sums_x86_64=('4bd105706594ae63b6a24d9043adf5f6c4c8e366e8e10f4efbe75b05732cf4ea')
sha256sums_aarch64=('7de57bd0bc7a3301a62930c8aca355f36d2ee8bf17de576235dc1ed58d19e265')
source_x86_64=("https://github.com/${_orgname}/${_pkgname}/releases/download/v${pkgver}/${pkgname}.x86_64.so")
source_aarch64=("https://github.com/${_orgname}/${_pkgname}/releases/download/v${pkgver}/${pkgname}.aarch64.so")

package() {
    install -Dm644 "${srcdir}/${pkgname}.${CARCH}.so" "${pkgdir}/usr/lib/${pkgname}.${CARCH}.so"
    ln -s "${pkgname}.${CARCH}.so" "${pkgdir}/usr/lib/${pkgname}.so"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
