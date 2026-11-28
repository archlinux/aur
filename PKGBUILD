# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=miabi-bin
pkgver=1.10.32
pkgrel=1
pkgdesc="Self-hosted platform-as-a-service with GitOps, registry and monitoring"
arch=('x86_64' 'aarch64')
url="https://github.com/miabi-io/miabi"
license=('AGPL-3.0-only')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/miabi_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/miabi_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('08df84ef6181118a503bd5911abbead9238f3dc85548efadcf29d6afa0af1ba0')
sha256sums_aarch64=('1d3bd99d3e4dd814f1da3abde68c16eab10eae3b61a4945878d20bf4c6fb5ec3')

package() {
  install -Dm755 "miabi" "${pkgdir}/usr/bin/miabi"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
