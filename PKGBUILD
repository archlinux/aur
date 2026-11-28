# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=saki-panel-bin
pkgver=6.1
pkgrel=1
pkgdesc="AI-assisted server operations panel"
arch=('x86_64')
url="https://github.com/EthanChan050430/Saki-Panel"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/EthanChan050430/Saki-Panel/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/saki-panel-linux-amd64")
sha256sums=('ce73d060173e3116d804fb007d7402825431cdfbc12d575b4434cee9b604bfa5')
sha256sums_x86_64=('ec2969934e2efa632999ca0dbd94b7026fedab40600db92f2810979a09cbdf4e')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/saki-panel"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
