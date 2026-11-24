# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=amtui-bin
pkgver=0.1.6
pkgrel=1
pkgdesc="Terminal UI for Prometheus Alertmanager"
arch=('x86_64' 'aarch64')
url="https://github.com/pehlicd/amtui"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/amtui_v${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/amtui_v${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('bdad80f42018df4ee0fc53ad6902dcf99732639a454de95841e7cc595462a312')
sha256sums_aarch64=('6fe3a0dc9907c9c8a285a6859ed8bd2fbaf7bfb9c15f0e182472f48c2ff4184f')

package() {
  install -Dm755 "amtui" "${pkgdir}/usr/bin/amtui"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
