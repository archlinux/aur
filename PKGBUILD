# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=gobrew-bin
pkgver=1.10.17
pkgrel=1
pkgdesc="Go version manager"
arch=('x86_64' 'aarch64')
url="https://github.com/kevincobain2000/gobrew"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/kevincobain2000/gobrew/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/gobrew-linux-amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/gobrew-linux-arm64")
sha256sums=('10e01565f766b4a464a76c8f29518d71417940f7f5458a60c1895a51c03760ad')
sha256sums_x86_64=('48123f6503b6ce76a03ff4c6ff3d87fa76e40d931ee914bf1c8c74ba22703401')
sha256sums_aarch64=('fb8c5d6b9e3e78209ceb5824e41e34956aa71e887f25924024a119b3e15be03d')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/gobrew"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
