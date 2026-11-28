# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=rosalind-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Reusable genomic evidence for research and analysis tools"
arch=('x86_64')
url="https://github.com/logannye/rosalind"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/rosalind-x86_64-unknown-linux-musl.tar.gz")
sha256sums_x86_64=('5072a18e83c7e87a406c2e0665f8de675bd68d446c86ba49a48771d0b089517c')

package() {
  install -Dm755 "rosalind-x86_64-unknown-linux-musl/rosalind" "${pkgdir}/usr/bin/rosalind"
  install -Dm644 "rosalind-x86_64-unknown-linux-musl/LICENSE-APACHE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "rosalind-x86_64-unknown-linux-musl/LICENSE-MIT" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "rosalind-x86_64-unknown-linux-musl/README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
