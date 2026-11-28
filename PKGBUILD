# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=indexer-bin
pkgver=3.11.1
pkgrel=1
pkgdesc="Algorand blockchain indexer"
arch=('x86_64')
url="https://github.com/algorand/indexer"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/indexer_Linux_x86_64_${pkgver}.tar.gz")
sha256sums_x86_64=('b90a6118645dc74c97978f729bf89d11a1baac7f9f52428c7c14004b1e3e3a00')

package() {
  install -Dm755 "algorand-indexer" "${pkgdir}/usr/bin/algorand-indexer"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
