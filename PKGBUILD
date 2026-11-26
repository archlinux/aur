# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=trousseau-bin
pkgver=0.4.1
pkgrel=1
pkgdesc="File-based encrypted key-value store"
arch=('x86_64')
url="https://github.com/oleiade/trousseau"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/trousseau_${pkgver}_Linux_x86_64.tar.gz")
sha256sums_x86_64=('c81aba40c526c464e55d84cad50212f66c7e9c5781c0aa3c97b55dee301081c0')

package() {
  install -Dm755 "trousseau" "${pkgdir}/usr/bin/trousseau"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
