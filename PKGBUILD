# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=outpost-bin
pkgver=1.11.1
pkgrel=1
pkgdesc="Outbound webhooks and event destination infrastructure"
arch=('x86_64' 'aarch64')
url="https://github.com/hookdeck/outpost"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/outpost_Linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/outpost_Linux_arm64.tar.gz")
sha256sums_x86_64=('ddd8e471c6f2fa8bd6c34091c9143c6852ba67eaf142aaf375bc2b115fef50fc')
sha256sums_aarch64=('a6ebb9b0b777992da1cba1d3faa2a0f710c44e90b32d25df94d0ccbf9c68b9a3')

package() {
  install -Dm755 "outpost" "${pkgdir}/usr/bin/outpost"
  install -Dm755 "outpost-server" "${pkgdir}/usr/bin/outpost-server"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
