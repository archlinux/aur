# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=packjpg-bin
pkgver=2.5n
pkgrel=1
pkgdesc="Lossless compression for JPEG image files"
arch=('x86_64')
url="https://github.com/packjpg/packJPG"
license=('LGPL-3.0-only')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/packjpg/packJPG/${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/packJPG-linux-x86_64")
sha256sums=('810d289d74278d72684d26cdc2ac5cbb0f01f2d18212f391c6c4467399a7add5')
sha256sums_x86_64=('8f37661e21577aaed41fa99fa2150ba991a38d4ddb01284083d0f31591bb81f4')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/packJPG"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
