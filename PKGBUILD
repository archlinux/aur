# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=parlay-bin
pkgver=0.11.0
pkgrel=1
pkgdesc="Enrich SBOMs with data from third-party services"
arch=('x86_64' 'aarch64')
url="https://github.com/snyk/parlay"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/snyk/parlay/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/parlay_Linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/parlay_Linux_arm64.tar.gz")
sha256sums=('c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4')
sha256sums_x86_64=('2654d8e91c53f8e264f439684f657fc0139a8c13d842c30aa4f12c9cc9be1243')
sha256sums_aarch64=('8ad5a108f7bec951eae639ba6bb9bdb1e94416472f91e34429a8a94743552522')

package() {
  install -Dm755 "parlay" "${pkgdir}/usr/bin/parlay"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
