# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=calnode-bin
pkgver=0.14.0
pkgrel=1
pkgdesc="Self-hosted scheduling service, an alternative to Calendly and Cal.com"
arch=('x86_64' 'aarch64')
url="https://github.com/Calnode/calnode"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/calnode_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/calnode_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('54b702fa54c7e27df0b11a932595b13834b83985c9359f3b6dd33c6f3d9ed2b2')
sha256sums_aarch64=('9bd2b004c69bed0e9426583b1a52a6da3a0d4d6715ee846e06ff1e9653aad499')

package() {
  install -Dm755 "calnode" "${pkgdir}/usr/bin/calnode"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
