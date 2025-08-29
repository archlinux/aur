# Maintainer: Ranadeep B < mail at rnbguy dot at >
# Contributor: Ranadeep B < mail at rnbguy dot at >

_pkgname=quint
pkgname="quint-bin"
_orgname=informalsystems
pkgver=0.27.0
pkgrel=1
pkgdesc="An executable specification language with delightful tooling based on the temporal logic of actions (TLA)"
arch=('x86_64' 'aarch64')
url="https://github.com/${_orgname}/${_pkgname}"
license=('Apache')
provides=(${_pkgname})
conflicts=(${_pkgname})
makedepends=('deno>=2.1.10')
source=("https://github.com/${_orgname}/${_pkgname}/raw/v${pkgver}/LICENSE")
source_x86_64=("quint_x86_64::https://github.com/${_orgname}/${_pkgname}/releases/download/v${pkgver}/quint-linux-amd64")
source_aarch64=("quint_aarch64::https://github.com/${_orgname}/${_pkgname}/releases/download/v${pkgver}/quint-linux-arm64")
sha256sums=('0f8c4f9a99d4861ee62ade9a9526d09570844bdeab3e6bca500383d5ae7d9495')
sha256sums_x86_64=('461ee1f129cbccd7e3df6164d70ec850b69ecb4fda2867b6b872dd59fa1e9791')
sha256sums_aarch64=('085a4cb63f502834ad93699f26ae01836cf7882fed23427321a6af4d7fc12ee2')

package() {
    install -Dm755 "${srcdir}/quint_${arch}" "${pkgdir}/usr/bin/quint"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
