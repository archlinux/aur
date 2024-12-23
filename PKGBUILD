# Maintainer: tuhtah <tamer.fahmy at gmail dot com>
# Adapted from benthos-bin: https://aur.archlinux.org/packages/benthos-bin

pkgname=bento-bin
_pkgname=${pkgname%-bin}
pkgdesc='Fancy stream processing made operationally mundane'
url='https://warpstreamlabs.github.io/bento/'
_url='https://github.com/warpstreamlabs/bento'
_branch='main'
pkgver=1.4.0
pkgrel=0
arch=(aarch64 armv7h x86_64)
license=("MIT")
provides=($_pkgname)
conflicts=($_pkgname)
source=("${_url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${_url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm64.tar.gz")
source_armv7h=("${_url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_armv7.tar.gz")
sha256sums=('2253d34e0c2fc9f9f86dc36044122697aa6daaeaffb85514aa47dd89edf08cb3')
sha256sums_aarch64=('2557c46734ef02e6daa80bdd957497f88f58b04024f248f47115386cafa13f60')
sha256sums_armv7h=('423304998cf9dacb7c5b1d3d05da7bde48f626bf7314f051e2dab16636336658')

package() {
  install -Dm755 $_pkgname "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -Dm644 *.md -t "${pkgdir}/usr/share/doc/${_pkgname}/"
}
