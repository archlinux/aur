# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=secretless-broker-bin
pkgver=2.0.0
pkgrel=1
pkgdesc="Connect apps to services without handling secrets"
arch=('x86_64')
url="https://github.com/cyberark/secretless-broker"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/secretless-broker_${pkgver}_linux_amd64.tar.gz")
sha256sums_x86_64=('7d7c88cfdcb704a94b9cc5547298eb010ac760a98f7f85b7d8bd0f746ac2d571')

package() {
  install -Dm755 "secretless-broker_${pkgver}_linux_amd64/summon2" "${pkgdir}/usr/bin/summon2"
  install -Dm755 "secretless-broker_${pkgver}_linux_amd64/secretless-broker" "${pkgdir}/usr/bin/secretless-broker"
  install -Dm644 "secretless-broker_${pkgver}_linux_amd64/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "secretless-broker_${pkgver}_linux_amd64/README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
