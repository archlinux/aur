# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=macro-bin
pkgver=2026.11.24.1
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
sha256sums_x86_64=('9defd28e244bd0eb0bf5602275c8d99f0cedfad9a8a281b8cf06507dd992ce52')
sha256sums_aarch64=('e825bde2d58dc380ebcc8fbfd238202851cb9dd81bbd7b2123cdaf51138a771a')

package() {
  install -Dm755 "macrod" "${pkgdir}/usr/bin/macrod"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
