# Maintainer: Ranadeep B < mail at rnbguy dot at >

_pkgname=quint
pkgname="quint-bin"
_orgname=informalsystems
pkgver=0.21.0
pkgrel=1
pkgdesc="An executable specification language with delightful tooling based on the temporal logic of actions (TLA)"
arch=('any')
url="https://github.com/${_orgname}/${_pkgname}"
license=('Apache')
provides=(${_pkgname})
conflicts=(${_pkgname})
makedepends=('deno' 'unzip')
source=("https://github.com/${_orgname}/${_pkgname}/raw/v${pkgver}/LICENSE")
sha256sums=('f6fe921a1fc4130262213e9a211327796782d6bbd234d14eba80b1285005b6e9')

package() {
    deno compile -Ao "${pkgdir}/usr/bin/quint" "npm:@${_orgname}/${_pkgname}@${pkgver}"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
