# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=deeporg-bin
pkgver=3.21.27
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
sha256sums_x86_64=('b1e3337b8d91e0fe8e51814aef6dc6b8c60f420e91673ab4e2b536e96f669062')
sha256sums_aarch64=('6c9110ca3f5a4dc032ce2350c1fa730018867348fe7484b6fc7fe222a88256dc')

package() {
  install -Dm755 "deeporg" "${pkgdir}/usr/bin/deeporg"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
