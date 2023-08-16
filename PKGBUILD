# Maintainer: Ranadeep B < mail at rnbguy dot at >

_orgname=cosmos
_reponame=gaia
_pkgname=${_reponame}d
pkgname=${_pkgname}-bin
pkgver=11.0.0
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
sha256sums_x86_64=('258df2eec5b22f8baadc988e184fbfd2ae6f9f888e9f4461a110cc365fe86300')
sha256sums_aarch64=('258df2eec5b22f8baadc988e184fbfd2ae6f9f888e9f4461a110cc365fe86300')

package() {
    install -D "${_pkgname}-v${pkgver}-linux" "$pkgdir/usr/bin/${_pkgname}"
    install -m644 -Dt "$pkgdir/usr/share/licenses/$_pkgname" LICENSE
}
