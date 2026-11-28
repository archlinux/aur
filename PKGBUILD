# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=goctopus-bin
pkgver=0.0.18
pkgrel=1
pkgdesc="Fast GraphQL discovery and fingerprinting toolbox"
arch=('x86_64' 'aarch64')
url="https://github.com/Escape-Technologies/goctopus"
license=('AGPL-3.0-only')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/goctopus_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/goctopus_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('c92f57fdbe072ce4716bcacdf0969b4ecba5f149e923bc016cd20a7f8b4c7d4c')
sha256sums_aarch64=('bb84a497bc9871d03bdded2ab7c540299cc5f749c284952e77360fdfb6d4576a')

package() {
  install -Dm755 "goctopus" "${pkgdir}/usr/bin/goctopus"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
