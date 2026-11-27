# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=agenvoy-bin
pkgver=1.4.2
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
sha256sums_x86_64=('7778dac228e3954fce60ed1e43139ac07ce9c68b28632f98994acbfe0f36a840')
sha256sums_aarch64=('d106e2be10de2cd5cd444b715e6b0ce4f1fe71071d762aff3f9cfec504336916')

package() {
  install -Dm755 "agen" "${pkgdir}/usr/bin/agen"
  install -Dm644 "skills/skill-creator/license.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "skills/skill-creator/README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
