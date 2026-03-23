# Maintainer: Amolith <amolith@secluded.site>
pkgname='goradion-bin'
_pkgname="${pkgname%-bin}"
pkgdesc='Terminal based online radio player'
pkgver=0.7.2
pkgrel=1
arch=('x86_64' 'aarch64')
url="https://github.com/agejevasv/goradion"
license=('Unlicense')
depends=('mpv')
provides=("${_pkgname}=${pkgver}")
conflicts=("$_pkgname")

source_x86_64=("${_pkgname}-${pkgver}-x86_64::${url}/releases/download/v${pkgver}/${_pkgname}-linux-amd64")
source_aarch64=("${_pkgname}-${pkgver}-aarch64::${url}/releases/download/v${pkgver}/${_pkgname}-linux-arm64")
b2sums_x86_64=('8013adc7b41356775ad66f9b8b96c50b3a76e2439eabaad1c86330161ba65079b4646a9e80526c1c5dc9f7a5b006c54a6f6b1d0d91fe96ecf1f90f322ec8d0a3')
b2sums_aarch64=('8bc050a81a6323b3b3717e05b892e05b3addf0af7726bdc549c7abdaaafb3fe069dca1b7753ae69ba5998cd922d598a1fb6e3f8432fc0213ecae579b4dbdbe38')

package() {
  install -Dm755 "${_pkgname}-${pkgver}-${CARCH}" "$pkgdir/usr/bin/$_pkgname"
}
