# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=tradingagents-bin
pkgver=1.0.1
pkgrel=1
pkgdesc="TradingAgents: Towards Agentic Finance Research"
arch=('x86_64' 'aarch64')
url="https://github.com/TauricResearch/TradingAgents"
license=('Apache-2.0')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/TauricResearch/TradingAgents/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/tradingagents-linux-x64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/tradingagents-linux-arm64")
sha256sums=('c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4')
sha256sums_x86_64=('6bf8f17a4fa02c74358c2943756038f840044c025a68329075c07497bae32717')
sha256sums_aarch64=('e2d77efb02c718f03a2007d35a469521bc569a5e31fab1c6938538aba94de30c')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/tradingagents"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
