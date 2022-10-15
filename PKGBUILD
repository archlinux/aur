# Maintainer: Ranadeep B < mail at rnbguy dot at >

_orgname=cosmos
_reponame=gaia
_pkgname=${_reponame}d
pkgname=${_pkgname}-bin
pkgver=7.1.0
pkgrel=1
pkgdesc="Cosmos SDK application for the Cosmos Hub"
arch=('x86_64' 'aarch64')
url="https://github.com/${_orgname}/${_reponame}"
license=('Apache')
provides=(${_pkgname})
conflicts=(${_pkgname})
source=("https://raw.githubusercontent.com/${_orgname}/${_reponame}/v${pkgver}/LICENSE")
source_x86_64=("${_pkgname}-v${pkgver}-linux::https://github.com/${_orgname}/${_reponame}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-amd64")
source_aarch64=("${_pkgname}-v${pkgver}-linux::https://github.com/${_orgname}/${_reponame}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-arm64")
sha256sums=('98bf5ef31e3c439d9d721a2b919fa285ad6a1ee607d71fb062a8b1849ae1e1fc')
sha256sums_x86_64=('7a24fd361b0259878a5aeb1f890ca0df20be1a875e7fc94aaef36eec4edf99c4')
sha256sums_aarch64=('7a24fd361b0259878a5aeb1f890ca0df20be1a875e7fc94aaef36eec4edf99c4')

package() {
    install -D "${_pkgname}-v${pkgver}-linux" "$pkgdir/usr/bin/${_pkgname}"
    install -m644 -Dt "$pkgdir/usr/share/licenses/$_pkgname" LICENSE
}
