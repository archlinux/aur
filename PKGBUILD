# Maintainer: Ranadeep B < mail at rnbguy dot at >
# Contributor: Ranadeep B < mail at rnbguy dot at >

_pkgname=quint
pkgname="quint-bin"
_orgname=informalsystems
pkgver=0.26.0
pkgrel=1
pkgdesc="An executable specification language with delightful tooling based on the temporal logic of actions (TLA)"
arch=('any')
url="https://github.com/${_orgname}/${_pkgname}"
license=('Apache')
provides=(${_pkgname})
conflicts=(${_pkgname})
makedepends=('deno>=2.1.10')
source=("https://github.com/${_orgname}/${_pkgname}/raw/v${pkgver}/LICENSE")
sha256sums=('0f8c4f9a99d4861ee62ade9a9526d09570844bdeab3e6bca500383d5ae7d9495')

build() {
    deno compile --node-modules-dir=auto --allow-scripts -Aro "${srcdir}/quint" "npm:@${_orgname}/${_pkgname}@${pkgver}"
}

package() {
    install -Dm755 "${srcdir}/quint" "${pkgdir}/usr/bin/quint"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
