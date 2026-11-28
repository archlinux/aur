# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=netpulse-bin
pkgver=2.55.0
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
sha256sums_x86_64=('a5d49e8fd3f2fc18eadbcf72b6417506a042093af54011f1a1a75cd8f81126fe')
sha256sums_aarch64=('79aee8d73fb135029608d759a85b2026f6be0bbd868da7225d370719a8859952')

package() {
  install -Dm755 "netpulse" "${pkgdir}/usr/bin/netpulse"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
