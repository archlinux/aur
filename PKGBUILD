# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=nixvis-bin
pkgver=1.0.1
pkgrel=1
pkgdesc="Nginx website log analysis tool"
arch=('x86_64')
url="https://github.com/BeyondXinXin/nixvis"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/BeyondXinXin/nixvis/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/nixvis-linux-amd64")
sha256sums=('3a00d808dc379c46447a073869f7fb8629cd814f9f09157fb7bcd0078a09c9d5')
sha256sums_x86_64=('1042a75db2106334a584e1fa2770ff6d16d144b0bfb3c07e13082ee9ca29e023')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/nixvis"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
