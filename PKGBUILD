# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=klirr-bin
pkgver=0.2.15
pkgrel=1
pkgdesc="Generate invoices for services and expenses"
arch=('x86_64')
url="https://github.com/sajjon/klirr"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/sajjon/klirr/v${pkgver}/LICENSE.txt")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/klirr-x86_64-unknown-linux-gnu")
sha256sums=('08adbdd9b30e478ac8e3e21865743326530abaa1b06eeff666602d53eb89def1')
sha256sums_x86_64=('14c54f5b36a3152b5fcc406c309a088216ac8e80dc1fff330894502fff93baa8')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/klirr"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
