# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=service-bus-tui-bin
pkgver=1.7.0
pkgrel=1
pkgdesc="TUI explorer for Azure Service Bus"
arch=('x86_64' 'aarch64')
url="https://github.com/MonsieurTib/service-bus-tui"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/service-bus-tui_Linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/service-bus-tui_Linux_arm64.tar.gz")
sha256sums_x86_64=('2eeedd4b3b5db01b96fbc00a032105ab060d86903733e6ac0ed35231cb588f63')
sha256sums_aarch64=('d8eaba715d12602a6e6e7a39ecb2c5ea86a9b1fc16f38095dc8a99ddc0cf98fa')

package() {
  install -Dm755 "service-bus-tui" "${pkgdir}/usr/bin/service-bus-tui"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
