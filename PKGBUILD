# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=deeporg-bin
pkgver=3.27.2
pkgrel=1
pkgdesc="DeepORG (formerly GraphJin) one AI agent for your whole organization: databases, APIs, files, and code over MCP"
arch=('x86_64' 'aarch64')
url="https://github.com/dosco/deeporg"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/deeporg_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/deeporg_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('612630f816ba436593980d3e000b6855ac2d213a1aaf8af720b161621da993d9')
sha256sums_aarch64=('145db9eaf548ab07b0c0ea78e268eee9349460c9c06ca7ce376e9a1209a53599')

package() {
  install -Dm755 "deeporg" "${pkgdir}/usr/bin/deeporg"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
