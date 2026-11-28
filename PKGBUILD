# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=qrterminal-bin
pkgver=4.0.0
pkgrel=1
pkgdesc="Show QR codes in your terminal"
arch=('x86_64' 'aarch64')
url="https://github.com/mdp/qrterminal"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/qrterminal_Linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/qrterminal_Linux_arm64.tar.gz")
sha256sums_x86_64=('a182c40251fc9db9de276583011b0f0c48e88f1e533424d0ac56b39cfbdf9c00')
sha256sums_aarch64=('3bcaea6fc0bf5ad8e52beb6c56323f3b3990d813ff72f0f87ba19977caaaa82f')

package() {
  install -Dm755 "qrterminal" "${pkgdir}/usr/bin/qrterminal"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
