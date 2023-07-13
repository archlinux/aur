# Maintainer: Ranadeep B < mail at rnbguy dot at >

_reponame=osmosis
_orgname=${_reponame}-labs
_pkgname=${_reponame}d
pkgname=${_pkgname}-bin
pkgver=16.1.0
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
sha256sums=('5eef0621386cdfd51981e4a6880d3b1acbe5bce94eb3b16217b6d58c84701faf')
sha256sums_x86_64=('2c21a7478d9ed13a428d487861685b1ce43e10e034b46b11500b25756f3b6a6d')
sha256sums_aarch64=('2c21a7478d9ed13a428d487861685b1ce43e10e034b46b11500b25756f3b6a6d')

package() {
    install -D "${_pkgname}-${pkgver}-linux" "$pkgdir/usr/bin/${_pkgname}"
    install -m644 -Dt "$pkgdir/usr/share/licenses/$_pkgname" LICENSE
}
