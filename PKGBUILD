# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=tfstate-lookup-bin
pkgver=1.12.2
pkgrel=1
pkgdesc="Look up resource attributes in Terraform state"
arch=('x86_64' 'aarch64')
url="https://github.com/fujiwara/tfstate-lookup"
license=('MPL-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/tfstate-lookup_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/tfstate-lookup_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('e17985dbb75ee82c46670026ad4dd6485d286b34e3fc235427b666f49a1fa68a')
sha256sums_aarch64=('0e6df8a7ae28cabc0e4db1be4e4365f4c43c1a627ecfbd28a36ece37c42af9d8')

package() {
  install -Dm755 "tfstate-lookup" "${pkgdir}/usr/bin/tfstate-lookup"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
