# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=issue-finder-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="Local-first handoff preparation for coding agents"
arch=('x86_64')
url="https://github.com/lifuyue/issue-finder"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/lifuyue/issue-finder/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/issue-finder-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('8d524a098f8d4eb1f38b81b93c778f898b7967716f427ade7741c8dd7364bd08')
sha256sums_x86_64=('fa827e72a09aa8d1ebc7e770ba920c38671cd9443729013fa7c546f957cab131')

package() {
  install -Dm755 "issue-finder" "${pkgdir}/usr/bin/issue-finder"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
