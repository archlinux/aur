# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=macro-bin
pkgver=2026.11.25.1
pkgrel=1
pkgdesc="Macro is a unified workspace for teams: email, chat, docs, tasks, agents, calls, and CRM @-linked together with shared AI memory"
arch=('x86_64' 'aarch64')
url="https://github.com/macro-inc/macro"
license=('AGPL-3.0-only')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/macro-inc/macro/v${pkgver}/LICENSE.txt")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/macrod-linux-x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/macrod-linux-aarch64.tar.gz")
sha256sums=('b1e2de6a24d704320f17b92555c0ee445f2b2af16dabfac6ec26d3fdb38588d5')
sha256sums_x86_64=('9556b729c24035bff2e90601f3f1de2151e097b8869800f5a7f81f27e135c089')
sha256sums_aarch64=('eff4c84ea2c36c7aeb6e931e20a841dedd33c098c097c1509b84f97f7b54c37b')

package() {
  install -Dm755 "macrod" "${pkgdir}/usr/bin/macrod"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
