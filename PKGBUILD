# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=cocoon-bin
pkgver=0.8.1
pkgrel=1
pkgdesc="Lightweight microVM engine built on Cloud Hypervisor"
arch=('x86_64' 'aarch64')
url="https://github.com/cocoonstack/cocoon"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/cocoon_Linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/cocoon_Linux_arm64.tar.gz")
sha256sums_x86_64=('43a90a3c077b055846516d1ef192ceaa5115f79e976bccc7b947c9aa7a749eb3')
sha256sums_aarch64=('0baf8cdba4c366394071d2869b5fbd65203e1fe53e9340b5ac92b9229c064616')

package() {
  install -Dm755 "cocoon" "${pkgdir}/usr/bin/cocoon"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
