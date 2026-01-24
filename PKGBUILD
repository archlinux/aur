# Maintainer: Ranadeep B < mail at rnbguy dot at >

_orgname=cosmos
_reponame=gaia
_pkgname=${_reponame}d
pkgname=${_pkgname}-bin
pkgver=25.3.2
pkgrel=1
pkgdesc="Cosmos SDK application for the Cosmos Hub"
arch=('x86_64')
url="https://github.com/${_orgname}/${_reponame}"
license=('Apache')
provides=(${_pkgname})
conflicts=(${_pkgname})
source=("https://raw.githubusercontent.com/${_orgname}/${_reponame}/v${pkgver}/LICENSE")
source_x86_64=("${_pkgname}-v${pkgver}-linux-x86_64::https://github.com/${_orgname}/${_reponame}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-amd64")
sha256sums=('98bf5ef31e3c439d9d721a2b919fa285ad6a1ee607d71fb062a8b1849ae1e1fc')
sha256sums_x86_64=('90d3b8ae047fad6b4834b2d65a7a9aac38292f10723c586e4e8c9c306a7bb9d2')

package() {
    install -D "${_pkgname}-v${pkgver}-linux-${CARCH}" "$pkgdir/usr/bin/${_pkgname}"
    install -m644 -Dt "$pkgdir/usr/share/licenses/$_pkgname" LICENSE
}
