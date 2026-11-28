# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=dnsping-bin
pkgver=1.12.0
pkgrel=1
pkgdesc="Check DNS server packet loss and latency"
arch=('x86_64' 'aarch64')
url="https://github.com/fortio/dnsping"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/dnsping_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/dnsping_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('48ac073d4d7b73fa03c5d316599746a832b67d302f7c4392c9b53d58cec4a657')
sha256sums_aarch64=('2e301da459b1a542a818bb1543d06497cad5d272085b0682c71b948522ba3202')

package() {
  install -Dm755 "dnsping" "${pkgdir}/usr/bin/dnsping"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
