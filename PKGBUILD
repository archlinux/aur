# Maintainer: Ranadeep B < mail at rnbguy dot at >

_orgname=cosmos
_reponame=gaia
_pkgname=${_reponame}d
pkgname=${_pkgname}-bin
pkgver=22.1.0
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
sha256sums_x86_64=('7dc5cc730a6c1df5e58c60cd17e55429ed352268ca8a4ec605ecccb94145d7e0')

package() {
    install -D "${_pkgname}-v${pkgver}-linux-${arch}" "$pkgdir/usr/bin/${_pkgname}"
    install -m644 -Dt "$pkgdir/usr/share/licenses/$_pkgname" LICENSE
}
