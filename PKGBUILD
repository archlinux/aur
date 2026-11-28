# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=consult-llm-bin
pkgver=3.0.40
pkgrel=1
pkgdesc="Get a second opinion from another AI model"
arch=('x86_64' 'aarch64')
url="https://github.com/raine/consult-llm"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/raine/consult-llm/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/consult-llm-linux-x64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/consult-llm-linux-arm64.tar.gz")
sha256sums=('dfc0be306ac621b63914bf0f4854538a2e0a8d09ad24f20e7edd9a80ece241b2')
sha256sums_x86_64=('4aa328fc403efdff3cd81957dc2ff575744e9e571dad1371fa8f3e006d178765')
sha256sums_aarch64=('add30879608423d27123a02f31b5c4b1f1761058ba87b6b3e3b884f50baf33f7')

package() {
  install -Dm755 "consult-llm" "${pkgdir}/usr/bin/consult-llm"
  install -Dm755 "consult-llm-monitor" "${pkgdir}/usr/bin/consult-llm-monitor"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
