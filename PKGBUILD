# Maintainer: Ranadeep B < mail at rnbguy dot at >
# Contributor: Ranadeep B < mail at rnbguy dot at >

_pkgname=quint
pkgname="quint-bin"
_orgname=informalsystems
pkgver=0.31.0
pkgrel=1
pkgdesc="An executable specification language with delightful tooling based on the temporal logic of actions (TLA)"
arch=('x86_64' 'aarch64')
url="https://github.com/${_orgname}/${_pkgname}"
license=('Apache')
provides=(${_pkgname})
conflicts=(${_pkgname})
source=("https://github.com/${_orgname}/${_pkgname}/raw/v${pkgver}/LICENSE")
source_x86_64=("quint_${pkgver}_x86_64::https://github.com/${_orgname}/${_pkgname}/releases/download/v${pkgver}/quint-linux-amd64")
source_aarch64=("quint_${pkgver}_aarch64::https://github.com/${_orgname}/${_pkgname}/releases/download/v${pkgver}/quint-linux-arm64")
sha256sums=('0f8c4f9a99d4861ee62ade9a9526d09570844bdeab3e6bca500383d5ae7d9495')
sha256sums_x86_64=('be2c42182ccd277354ccd3788eea41f41a8e0a262ce5472e5cd69c8c225535fe')
sha256sums_aarch64=('d6af8d431a7d0c512a5c3706c0ae13d2f6a91a1a2260edc0b5cbcb6070a5f7b6')

package() {
    install -Dm755 "${srcdir}/quint_${pkgver}_${arch}" "${pkgdir}/usr/bin/quint"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
