# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=raymon-bin
pkgver=0.7.0
pkgrel=1
pkgdesc="A terminal UI and Model Context Protocol (MCP) server"
arch=('x86_64' 'aarch64')
url="https://github.com/bnomei/raymon"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/bnomei/raymon/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/raymon-v${pkgver}-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/raymon-v${pkgver}-aarch64-unknown-linux-musl.tar.gz")
sha256sums=('077d138387dd107179fec3cefab95ced64f27c20845d014488fc542c4093c962')
sha256sums_x86_64=('bee12d3e2bf1b22237ac9f1babfa8e081b0448755fd03b40c512d02fdb3126b8')
sha256sums_aarch64=('fc8b0f5318da201fc6cef6f387e212511db64cf3764fd82c65f99e25cf80f3eb')

package() {
  install -Dm755 "raymon" "${pkgdir}/usr/bin/raymon"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
