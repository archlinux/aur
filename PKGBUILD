# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=provenant-bin
pkgver=1.0.18
pkgrel=1
pkgdesc="Scan for licenses, copyrights, package metadata and SBOM data"
arch=('x86_64' 'aarch64')
url="https://github.com/getprovenant/provenant"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/provenant-linux-x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/provenant-linux-aarch64.tar.gz")
sha256sums_x86_64=('c89e47d1cd069721b298de1fee3c83f8d5d78d0041d48666339f6482d9b42cc4')
sha256sums_aarch64=('bee9ebf47a77638e87e54ab4a60a4c4455b3573d7c8d6e1da2d1cb17fddc8066')

package() {
  install -Dm755 "provenant" "${pkgdir}/usr/bin/provenant"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
