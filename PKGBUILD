# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=apprise-go-bin
pkgver=0.4.1
pkgrel=1
pkgdesc="Go port of the Apprise notification library and CLI"
arch=('x86_64' 'aarch64')
url="https://github.com/unraid/apprise-go"
license=('BSD-2-Clause')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/unraid/apprise-go/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/apprise-go-linux-amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/apprise-go-linux-arm64")
sha256sums=('04c2c31515d8e9388275e9a37e0c7a2c6323dc28fb6a0d02bfecde9a4aa9fb12')
sha256sums_x86_64=('48b22ad5d2c25c14fb18ab2ea695028561132af6e4097aa470e440a9b8a033b1')
sha256sums_aarch64=('0e6656ae27992a95a6460500bec8acf05e5858773cb4a372273add832c2557d5')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/apprise-go"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
