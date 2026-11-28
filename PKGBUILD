# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=cftunnel-bin
pkgver=0.4.4
pkgrel=1
pkgdesc="Expose local services through Cloudflare Tunnel and TCP/UDP relays"
arch=('x86_64' 'aarch64')
url="https://github.com/qingchencloud/cftunnel"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/cftunnel_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/cftunnel_linux_arm64.tar.gz")
sha256sums_x86_64=('fd5fb74b5403ddd27a9c52ae1cddec135cdfc1f38f20e612b13163e89b318335')
sha256sums_aarch64=('2cecc60293d02a9008abb3006be305511afadf3ae2666ea4ed207da51936fc5c')

package() {
  install -Dm755 "cftunnel" "${pkgdir}/usr/bin/cftunnel"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
