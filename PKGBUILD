# Maintainer: Ranadeep B < mail at rnbguy dot at >

_reponame=osmosis
_orgname=${_reponame}-labs
_pkgname=${_reponame}d
pkgname=${_pkgname}-bin
pkgver=23.0.4
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
sha256sums_x86_64=('1dd76be6538c082c3313086ce45039eb4c1abb82862099c6a7d77953d3f32158')
sha256sums_aarch64=('00a1b8e39fbd7090b04a69e55cf50cd34504a523098876e59fb9f073039ce6b1')

package() {
    install -D "${_pkgname}-${pkgver}-linux-${arch}" "$pkgdir/usr/bin/${_pkgname}"
    install -m644 -Dt "$pkgdir/usr/share/licenses/$_pkgname" LICENSE
}
