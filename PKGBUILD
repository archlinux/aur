# Maintainer: Ranadeep B < mail at rnbguy dot at >
# Contributor: Ranadeep B < mail at rnbguy dot at >

_pkgname=wasmvm
pkgname="lib${_pkgname}"
_orgname=CosmWasm
pkgver=2.2.4
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
sha256sums_x86_64=('a7f6f5a79f41c756f87e4e3de86439a18fec07238c2521ac21ac2e5655751460')
sha256sums_aarch64=('3a6f1a2448cb88c6a00faf9a2c72262d8b2d6b65a3a1dd3c969e5df42534bb0d')
source_x86_64=("https://github.com/${_orgname}/${_pkgname}/releases/download/v${pkgver}/${pkgname}.x86_64.so")
source_aarch64=("https://github.com/${_orgname}/${_pkgname}/releases/download/v${pkgver}/${pkgname}.aarch64.so")

package() {
    install -Dm644 "${srcdir}/${pkgname}.${CARCH}.so" "${pkgdir}/usr/lib/${pkgname}.${CARCH}.so"
    ln -s "${pkgname}.${CARCH}.so" "${pkgdir}/usr/lib/${pkgname}.so"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
