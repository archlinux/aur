# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=cueitup-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Inspect messages in an AWS SQS queue from the terminal"
arch=('x86_64' 'aarch64')
url="https://github.com/dhth/cueitup"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/cueitup_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/cueitup_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('e427e33fc6964b78cb070bdc88a6dc21469efc0957c923e556c3ffc0798cc15f')
sha256sums_aarch64=('25b6fd6aae5a58423540ed4140b5ec0f1ac6b5e96aa4930fd99d868ad142ce05')

package() {
  install -Dm755 "cueitup" "${pkgdir}/usr/bin/cueitup"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
