# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=reeve-tui-bin
pkgver=1.2.0
pkgrel=1
pkgdesc="A terminal cockpit for AI agents: watch a run live, score it, and step in when it goes sideways"
arch=('x86_64')
url="https://github.com/Dancode-188/reeve"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/Dancode-188/reeve/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/reeve-linux-x86_64")
sha256sums=('498a648147f2a76bf94739e3046725c331b395b6a94d27aaaa2e0b9a85433f21')
sha256sums_x86_64=('9c9971f3f10d20fa45ba52f41403584db0c53cd5473eb67e66539b62011dfcb5')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/reeve"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
