# Maintainer: tuhtah <tamer.fahmy at gmail dot com>
# Adapted from benthos-bin: https://aur.archlinux.org/packages/benthos-bin

pkgname=bento-bin
_pkgname=${pkgname%-bin}
pkgdesc='Fancy stream processing made operationally mundane'
url='https://warpstreamlabs.github.io/bento/'
_url='https://github.com/warpstreamlabs/bento'
_branch='main'
pkgver=1.16.1
pkgrel=0
arch=(aarch64 x86_64)
license=("MIT")
provides=($_pkgname)
conflicts=($_pkgname)
source=("${_url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${_url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm64.tar.gz")
sha256sums=('ddfc779e46d348668fbaf481e59a46d3d4c0c90b7110472ac3446ad59acb8b0b')
sha256sums_aarch64=('86ed053f1c6f598674f531081fa821d08246fff3a762138aebdad8945fe694f3')

package() {
  install -Dm755 $_pkgname "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -Dm644 *.md -t "${pkgdir}/usr/share/doc/${_pkgname}/"
}
