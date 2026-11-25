# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=agenvoy-bin
pkgver=1.4.1
pkgrel=1
pkgdesc="Local AI agent harness that runs continuously with auto-built tools, MCP and Ollama"
arch=('x86_64' 'aarch64')
url="https://github.com/pardnchiu/Agenvoy"
license=('AGPL-3.0-only')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/agen-v${pkgver}-linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/agen-v${pkgver}-linux-arm64.tar.gz")
sha256sums_x86_64=('b2f688e2ac2f3040c85c9a6bcc924ef42c1802d982d8e0d5b36f0fc4751fadfb')
sha256sums_aarch64=('ff14a05ccd15e0e0605c02a3301e5593b51d0e215278520261a63ff8583831e2')

package() {
  install -Dm755 "agen" "${pkgdir}/usr/bin/agen"
  install -Dm644 "skills/skill-creator/license.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "skills/skill-creator/README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
