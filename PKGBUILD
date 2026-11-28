# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=mdmb-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Simulate Apple devices talking to MDM servers"
arch=('x86_64')
url="https://github.com/jessepeterson/mdmb"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/jessepeterson/mdmb/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.zip::${_dl}/mdmb-linux-amd64-v${pkgver}.zip")
sha256sums=('1fc00965a64fd5ac6314f9d2b9df98a542234d410d628a886e4cd25d5d7eadb5')
sha256sums_x86_64=('fd71851ebdd4baae9e7ab4b2493d3a495f4f12e43751beff85461ed5d4c16d81')

package() {
  install -Dm755 "mdmb" "${pkgdir}/usr/bin/mdmb"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
