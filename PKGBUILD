# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=kubefirst-bin
pkgver=2.10.5
pkgrel=1
pkgdesc="The Kubefirst Open Source Platform"
arch=('x86_64' 'aarch64')
url="https://github.com/konstructio/kubefirst"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/kubefirst_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/kubefirst_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('f8d557a1b1a94e699e5906cffef85b1c2ba00d048601aa19c8a7f95dd5cedf82')
sha256sums_aarch64=('2711443890435853722b04041afa5911972a3ffe5306fb37575e145f15b02c68')

package() {
  install -Dm755 "kubefirst" "${pkgdir}/usr/bin/kubefirst"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
