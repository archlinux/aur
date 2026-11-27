# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=phi-bin
pkgver=0.30.2
pkgrel=1
pkgdesc="Fast coding agent with sub-agents and MCP support"
arch=('x86_64' 'aarch64')
url="https://github.com/pulseaiclub/phi"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/phi_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/phi_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('9cda65a0de4380ce67a943602293354dea6fc496908122447eb4a4cb736be0b9')
sha256sums_aarch64=('d4722deb5fe02933119f6a1915e851f080f01b076021e8c10505b435935c5476')

package() {
  install -Dm755 "phi" "${pkgdir}/usr/bin/phi"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
