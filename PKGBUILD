# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=blockcell-bin
pkgver=0.1.7
pkgrel=1
pkgdesc="Self-evolving AI agent"
arch=('x86_64')
url="https://github.com/blockcell-labs/blockcell"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/blockcell-v${pkgver}-linux-amd64.tar.gz")
sha256sums_x86_64=('8a00098f3ca54f329de652e5015663221aec5f5e35d1f8b13ca6509511c7f48b')

package() {
  install -Dm755 "blockcell-v${pkgver}-linux-amd64/blockcell" "${pkgdir}/usr/bin/blockcell"
  install -Dm644 "blockcell-v${pkgver}-linux-amd64/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "blockcell-v${pkgver}-linux-amd64/README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
