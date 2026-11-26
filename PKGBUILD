# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=netpulse-bin
pkgver=2.54.0
pkgrel=1
pkgdesc="Real-time dashboard for monitoring OpenWrt and GL.iNet home networks"
arch=('x86_64' 'aarch64')
url="https://github.com/gnacho/netpulse"
license=('AGPL-3.0-only')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/netpulse_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/netpulse_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('07ca00ed23551483e8f58c499d06e593910761b3d9379613950a2dc9695090e9')
sha256sums_aarch64=('dbe7f40a6a8354fc375606695b77e7f01ad1cf7d5d66cfd0dec8bcb7f1c5c102')

package() {
  install -Dm755 "netpulse" "${pkgdir}/usr/bin/netpulse"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
