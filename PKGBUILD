# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=errata-bin
pkgver=1.12.0
pkgrel=1
pkgdesc="Writing app"
arch=('x86_64')
url="https://github.com/tealios/errata"
license=('GPL-2.0-only')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/tealios/errata/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.zip::${_dl}/errata-${pkgver}-linux-x64.zip")
sha256sums=('640d90f6ee401241ff62834d0d1b33f83049e99b8bfdfa04ed1b0a1635dde3e7')
sha256sums_x86_64=('52cdc308c424f14d3abc4b45a04970a5f755517049907f5f02b12df48ee8905f')

package() {
  install -Dm755 "errata" "${pkgdir}/usr/bin/errata"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
