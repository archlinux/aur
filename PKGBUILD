# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=causal-memory-bin
pkgver=0.10.0
pkgrel=1
pkgdesc="MCP server that records decision and outcome relationships for AI agents"
arch=('x86_64' 'aarch64')
url="https://github.com/JingxuanC/causal-memory"
license=('Apache-2.0')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/JingxuanC/causal-memory/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/causal-memory-v${pkgver}-linux-x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/causal-memory-v${pkgver}-linux-aarch64.tar.gz")
sha256sums=('012b02b89568f2943aa06c76a94db5c63f7669034cdff24eaf34ec9c1dd12c0e')
sha256sums_x86_64=('87f667d290b8ae5d5a2286db78b349ac207d78e27609f272cec1e2bd609b71b9')
sha256sums_aarch64=('09e01a6c34402cc896076accb2870f784539763bf146a288f1ff951965d07ae8')

package() {
  install -Dm755 "causal-memory" "${pkgdir}/usr/bin/causal-memory"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
