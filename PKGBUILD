# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=mcpd-bin
pkgver=0.7.0
pkgrel=1
pkgdesc="Declaratively define and run MCP tools across environments"
arch=('x86_64' 'aarch64')
url="https://github.com/mozilla-ai/mcpd"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/mcpd_Linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/mcpd_Linux_arm64.tar.gz")
sha256sums_x86_64=('963408c7c96222a20e4070be6760588fe216576603003fc6799cd602036ed8d3')
sha256sums_aarch64=('377e076c3b4af6e0af72748c8ac17068d6b5be5c49ba5158dcfb511d03dc7946')

package() {
  install -Dm755 "mcpd" "${pkgdir}/usr/bin/mcpd"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
