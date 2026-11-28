# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=agenvoy-bin
pkgver=1.5.0
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
sha256sums_x86_64=('bf5ef6708b45c2abc920cabf0b882cb9f9f60f9af6f828b27058cef6b92e08ad')
sha256sums_aarch64=('91f271582b2aec36fa287e6a89ba4fd2825045fc334b0b5af31d7f500db1d297')

package() {
  install -Dm755 "agen" "${pkgdir}/usr/bin/agen"
  install -Dm644 "skills/skill-creator/license.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "skills/skill-creator/README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
