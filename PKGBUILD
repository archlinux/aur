# Maintainer: Ranadeep B < mail at rnbguy dot at >
# Contributor: Ranadeep B < mail at rnbguy dot at >

_pkgname=quint
pkgname="quint-bin"
_orgname=informalsystems
pkgver=0.30.0
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
sha256sums_x86_64=('5cc656969dcddd02b872bda0af8425aab01557fc876112832890a792ce50a912')
sha256sums_aarch64=('e5591883c166512b52968df93da7245d007e24fa91a06d75e859b9dc71c87331')

package() {
    install -Dm755 "${srcdir}/quint_${pkgver}_${arch}" "${pkgdir}/usr/bin/quint"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
