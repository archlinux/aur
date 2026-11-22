# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=invoicepilot-bin
pkgver=0.1.24
pkgrel=1
pkgdesc="A TUI for automating invoice and bank statement fetching from Gmail to Google Drive"
arch=('x86_64' 'aarch64')
url="https://github.com/adolfousier/invoicepilot"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/adolfousier/invoicepilot/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/invoicepilot-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/invoicepilot-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('5a07370e7acf7e4d4030e84f86a90b07b83f00e3f656c8742663de057c250586')
sha256sums_x86_64=('eb3aa480a0ecec7584c37ac62924490544e6aa998cc60041775193f79e22294c')
sha256sums_aarch64=('139584f13047c61a79022e156202505320f9bca93223ae19c0426a21b7f8fa05')

package() {
  install -Dm755 "invoicepilot" "${pkgdir}/usr/bin/invoicepilot"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
