# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=herdr-dagr-bin
pkgver=0.3.1
pkgrel=1
pkgdesc="Show a herdr agent swarm as a live orchestration graph"
arch=('x86_64' 'aarch64')
url="https://github.com/aemrebarut/herdr-dagr"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/aemrebarut/herdr-dagr/v${pkgver}/LICENSE-APACHE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/dagr-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/dagr-aarch64-unknown-linux-musl.tar.gz")
sha256sums=('cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30')
sha256sums_x86_64=('d70cbdf4ce69218b681ca56ecfdc280380489f67c84f539eed8149ba07920188')
sha256sums_aarch64=('53bb5f5b555bc75d3e8c5942cb1d6623e354475e38a65a986c6122b7c9b76efb')

package() {
  install -Dm755 "dagr" "${pkgdir}/usr/bin/dagr"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
