# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=mergetopus-bin
pkgver=0.8
pkgrel=1
pkgdesc="Orchestrator to untangle complex merges"
arch=('x86_64')
url="https://github.com/mwallner/mergetopus"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/mwallner/mergetopus/v${pkgver}/LICENSE.txt")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/mergetopus-linux-x64.tar.gz")
sha256sums=('62d6ceca9ba4061371748920ddfe841407711f31ab5755ee2b4f83fe07c9d580')
sha256sums_x86_64=('6de05728d968a6a24a074244fb699d1dc1ded78f75455123885d3de1411ca003')

package() {
  install -Dm755 "mergetopus" "${pkgdir}/usr/bin/mergetopus"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
