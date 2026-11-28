# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=cyclonedx-gomod-bin
pkgver=1.12.0
pkgrel=1
pkgdesc="Create CycloneDX SBOMs from Go modules"
arch=('x86_64' 'aarch64')
url="https://github.com/CycloneDX/cyclonedx-gomod"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/cyclonedx-gomod_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/cyclonedx-gomod_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('004b9f5cc595b797fb5423e2ae4c97bcf0f18c712ed2faee1640b09e5efd6d15')
sha256sums_aarch64=('b6dd6424755e61c0f7fcd36074fbb78798a33c52f1bd35dd177ba62eccadf404')

package() {
  install -Dm755 "cyclonedx-gomod" "${pkgdir}/usr/bin/cyclonedx-gomod"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
