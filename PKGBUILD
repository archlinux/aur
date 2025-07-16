# Maintainer: Ranadeep B < mail at rnbguy dot at >
# Contributor: Ranadeep B < mail at rnbguy dot at >

_pkgname=quint
pkgname="quint-bin"
_orgname=informalsystems
pkgver=0.26.0
pkgrel=2
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
sha256sums_x86_64=('7b51e8af58fc6c2b521a82a84d45065ba1d92c9c82565e0cca7a1afd308ee2b5')
sha256sums_aarch64=('e8405eac6b8c85195a096c7871e10dbe6164f028d482035410c1faa712224e06')

package() {
    install -Dm755 "${srcdir}/quint_${arch}" "${pkgdir}/usr/bin/quint"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
