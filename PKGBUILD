# Maintainer: tuhtah <tamer.fahmy at gmail dot com>
# Adapted from benthos-bin: https://aur.archlinux.org/packages/benthos-bin

pkgname=bento-bin
_pkgname=${pkgname%-bin}
pkgdesc='Fancy stream processing made operationally mundane'
url='https://warpstreamlabs.github.io/bento/'
_url='https://github.com/warpstreamlabs/bento'
_branch='main'
pkgver=1.5.0
pkgrel=0
arch=(aarch64 armv7h x86_64)
license=("MIT")
provides=($_pkgname)
conflicts=($_pkgname)
source=("${_url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${_url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm64.tar.gz")
source_armv7h=("${_url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_armv7.tar.gz")
sha256sums=('5755b900afc9b7537396afab9ebbae1cf17a83e1d1fda759ef463bfd1595b620')
sha256sums_aarch64=('862fc0a6633f792e607819fe873e8a8bed7b185483b5fb6e6883203955cac7c4')
sha256sums_armv7h=('d7bdb9bf49128ae3299edc0ab07a36a704e4a56c78dead96c13c9166e40e2055')

package() {
  install -Dm755 $_pkgname "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -Dm644 *.md -t "${pkgdir}/usr/share/doc/${_pkgname}/"
}
