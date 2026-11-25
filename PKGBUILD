# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=gshark-bin
pkgver=2.1.30
pkgrel=1
pkgdesc="Scan code hosting platforms for leaked sensitive information"
arch=('x86_64')
url="https://github.com/madneal/gshark"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/madneal/gshark/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.zip::${_dl}/gshark_linux_amd64.zip")
sha256sums=('b43e0ab02760dc8cc1d36c80a922791d811af7a8a64343d7b60f726f300e88ac')
sha256sums_x86_64=('3f01908d9e8c552cfdc7b6a69f0940fd8e1a4953f3fd83c829ff3ec3a741d62e')

package() {
  install -Dm755 "gshark_linux_amd64/gshark" "${pkgdir}/usr/bin/gshark"
  install -Dm755 "gshark_linux_amd64/gshark-cli" "${pkgdir}/usr/bin/gshark-cli"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
