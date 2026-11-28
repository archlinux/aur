# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=groksearch-rs-bin
pkgver=0.1.26
pkgrel=1
pkgdesc="MCP server for Grok web search and Tavily source retrieval"
arch=('x86_64' 'aarch64')
url="https://github.com/Episkey-G/GrokSearch-rs"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/Episkey-G/GrokSearch-rs/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/grok-search-rs_Linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/grok-search-rs_Linux_aarch64.tar.gz")
sha256sums=('03cdda9c6cc97a8267e756df11ecb35ec6f1b5c658b9b9e87bf02f3f1865d2de')
sha256sums_x86_64=('e8ced45392738bac691e41de9793c7941ed7f56c7e53697f8084b2e9ef4acf86')
sha256sums_aarch64=('9e04d09b4104dd95854d446c15a0c923cd8a376855a2fa4f1c5dc1c93546958d')

package() {
  install -Dm755 "grok-search-rs" "${pkgdir}/usr/bin/grok-search-rs"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
