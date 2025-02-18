# Maintainer: Ranadeep B < mail at rnbguy dot at >

_reponame=osmosis
_orgname=${_reponame}-labs
_pkgname=${_reponame}d
pkgname=${_pkgname}-bin
pkgver=28.0.4
pkgrel=1
pkgdesc="The AMM Laboratory on Cosmos"
arch=('x86_64' 'aarch64')
url="https://github.com/${_orgname}/${_reponame}"
license=('Apache')
provides=(${_pkgname})
conflicts=(${_pkgname})
source=("https://raw.githubusercontent.com/${_orgname}/${_reponame}/v${pkgver}/LICENSE")
source_x86_64=("${_pkgname}-${pkgver}-linux-x86_64::https://github.com/${_orgname}/${_reponame}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-amd64")
source_aarch64=("${_pkgname}-${pkgver}-linux-aarch64::https://github.com/${_orgname}/${_reponame}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-arm64")
sha256sums=('5d3757d59c66aefaf44ecc8bbf1cd4ca23fcb43221e94c8d60eff95de5bcfa6b')
sha256sums_x86_64=('11650fb61a494cc59f6c197478ddc97cf292103ef27a838a26c67d67ffa251bf')
sha256sums_aarch64=('10f38f06ed597a9e0b620da8e943e1418b11a0bc412ecf79ce02d2b6ee1b8128')

package() {
    install -D "${_pkgname}-${pkgver}-linux-${arch}" "$pkgdir/usr/bin/${_pkgname}"
    install -m644 -Dt "$pkgdir/usr/share/licenses/$_pkgname" LICENSE
}
