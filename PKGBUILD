# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=adguarddnscli-bin
pkgver=0.2.1
pkgrel=1
pkgdesc="Client for AdGuard DNS"
arch=('x86_64' 'aarch64')
url="https://github.com/AdguardTeam/AdGuardDNSCLI"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/AdGuardDNSCLI_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/AdGuardDNSCLI_linux_arm64.tar.gz")
sha256sums_x86_64=('92d9406e961957b383cc056c821f4c04ae2967715b385b1eb9f71a531e698255')
sha256sums_aarch64=('ba589b425148e342728e70ddfa8721b0433fd0e423649b8c3f12394fda2a9b8b')

package() {
  install -Dm755 "./AdGuardDNSCLI/adguarddns-cli" "${pkgdir}/usr/bin/adguarddns-cli"
  install -Dm644 "./AdGuardDNSCLI/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "./AdGuardDNSCLI/README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
