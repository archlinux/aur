# Maintainer: tuhtah <tamer.fahmy at gmail dot com>
# Adapted from benthos-bin: https://aur.archlinux.org/packages/benthos-bin

pkgname=bento-bin
_pkgname=${pkgname%-bin}
pkgdesc='Fancy stream processing made operationally mundane'
url='https://warpstreamlabs.github.io/bento/'
_url='https://github.com/warpstreamlabs/bento'
_branch='main'
pkgver=1.6.0
pkgrel=0
arch=(aarch64 armv7h x86_64)
license=("MIT")
provides=($_pkgname)
conflicts=($_pkgname)
source=("${_url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${_url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm64.tar.gz")
source_armv7h=("${_url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_armv7.tar.gz")
sha256sums=('7be29a41095770332271cedf69611723fe0bc4ab09a88834357ee69395423e3c')
sha256sums_aarch64=('e5e02c6d160aa97dc5ff000fae512d1ba09298cb69ce3c34df901e5ec946bfaa')
sha256sums_armv7h=('eaa00b2676d67557be3f4f0faab534076ac74f0197ad6ef894a32f07450efa1e')

package() {
  install -Dm755 $_pkgname "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -Dm644 *.md -t "${pkgdir}/usr/share/doc/${_pkgname}/"
}
