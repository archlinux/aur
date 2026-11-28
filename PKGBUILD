# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=macondo-bin
pkgver=0.14.0
pkgrel=1
pkgdesc="Crossword board game AI"
arch=('x86_64')
url="https://github.com/domino14/macondo"
license=('GPL-3.0-only')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/domino14/macondo/v${pkgver}/LICENSE.md")
source_x86_64=("${pkgname}-${pkgver}-x86_64.zip::${_dl}/macondo-v${pkgver}-linux-x86_64.zip")
sha256sums=('e1c0ad728983d8a57335e52cf1064f1affd1d454173d8cebd3ed8b4a72b48704')
sha256sums_x86_64=('23cfb67950cb3141de51982849708773c7779a9194f3510a6caa093ef2a8ae16')

package() {
  install -Dm755 "macondo" "${pkgdir}/usr/bin/macondo"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
