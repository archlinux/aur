# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=claude-ast-index-search-bin
pkgver=3.56.0
pkgrel=1
pkgdesc="AST-based code search for AI coding agents that saves tokens"
arch=('x86_64' 'aarch64')
url="https://github.com/defendend/Claude-ast-index-search"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/defendend/Claude-ast-index-search/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/ast-index-v${pkgver}-linux-x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/ast-index-v${pkgver}-linux-arm64.tar.gz")
sha256sums=('704ed39e482cc852b8b26aafc25cb59c96e652f6cd795e12936e8a0087be2e0b')
sha256sums_x86_64=('88c84ed45c16528c1884da0c960110aed42bc6697a5bba1604d954863bf6a1b8')
sha256sums_aarch64=('088e7f30ccd39629e9987e4d5e09d576e0c92190207fc4ab49f991a6b904edb0')

package() {
  install -Dm755 "ast-index" "${pkgdir}/usr/bin/ast-index"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
