# Maintainer: tuhtah <tamer.fahmy at gmail dot com>
# Adapted from benthos-bin: https://aur.archlinux.org/packages/benthos-bin

pkgname=bento-bin
_pkgname=${pkgname%-bin}
pkgdesc='Fancy stream processing made operationally mundane.'
url='https://warpstreamlabs.github.io/bento/'
_url='https://github.com/warpstreamlabs/bento'
_branch='main'
pkgver=1.2.0
pkgrel=0
arch=(aarch64 armv7h x86_64)
license=("MIT")
provides=($_pkgname)
conflicts=($_pkgname)
source=("${_url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${_url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm64.tar.gz")
source_armv7h=("${_url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_armv7.tar.gz")
sha256sums=('4d275ad7a0383c31801d10effc98a83872ae52d019b039fa7737ef2cc67ea5cd')
sha256sums_aarch64=('0e6f42bab6adf589c3dcfc2255d9f016a0e863454b72feca23de902fc8aeea3a')
sha256sums_armv7h=('84b818bc2ad75dea1867841d48818b23734056948d65ee80e9745fd4fe80b3f5')

package() {
  install -Dm755 $_pkgname "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -Dm644 *.md -t "${pkgdir}/usr/share/doc/${_pkgname}/"
}
