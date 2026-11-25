# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=pretender-bin
pkgver=1.4.1
pkgrel=1
pkgdesc="MitM tool for relaying attacks using DHCPv6 DNS takeover and mDNS, LLMNR and NetBIOS-NS spoofing"
arch=('x86_64' 'aarch64')
url="https://github.com/RedTeamPentesting/pretender"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/pretender_Linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/pretender_Linux_arm64.tar.gz")
sha256sums_x86_64=('c6d359a95211f2d5f2e87c4bd17cab183971aa82b889a45d64f46b4bf434916e')
sha256sums_aarch64=('3ecd476eb2315bec9078a4a73b34144f093b78473631a08e64e5f77d9e47d040')

package() {
  install -Dm755 "pretender" "${pkgdir}/usr/bin/pretender"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
