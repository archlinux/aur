# Maintainer: Ranadeep B < mail at rnbguy dot at >

_reponame=osmosis
_orgname=${_reponame}-labs
_pkgname=${_reponame}d
pkgname=${_pkgname}-bin
pkgver=18.0.0
pkgrel=1
pkgdesc="The AMM Laboratory on Cosmos"
arch=('x86_64' 'aarch64')
url="https://github.com/${_orgname}/${_reponame}"
license=('Apache')
provides=(${_pkgname})
conflicts=(${_pkgname})
source=("https://raw.githubusercontent.com/${_orgname}/${_reponame}/v${pkgver}/LICENSE")
source_x86_64=("${_pkgname}-${pkgver}-linux::https://github.com/${_orgname}/${_reponame}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-amd64")
source_aarch64=("${_pkgname}-${pkgver}-linux::https://github.com/${_orgname}/${_reponame}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-arm64")
sha256sums=('5d3757d59c66aefaf44ecc8bbf1cd4ca23fcb43221e94c8d60eff95de5bcfa6b')
sha256sums_x86_64=('9a98a57946e936e7380ae897a205b4e18a188332e91ca84a1f62c21cbb437845')
sha256sums_aarch64=('9a98a57946e936e7380ae897a205b4e18a188332e91ca84a1f62c21cbb437845')

package() {
    install -D "${_pkgname}-${pkgver}-linux" "$pkgdir/usr/bin/${_pkgname}"
    install -m644 -Dt "$pkgdir/usr/share/licenses/$_pkgname" LICENSE
}
