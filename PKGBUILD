# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=cc-relay-bin
pkgver=0.0.21
pkgrel=1
pkgdesc="Fast LLM API gateway"
arch=('x86_64' 'aarch64')
url="https://github.com/omarluq/cc-relay"
license=('AGPL-3.0-only')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/omarluq/cc-relay/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/cc-relay_${pkgver}_linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/cc-relay_${pkgver}_linux_arm64.tar.gz")
sha256sums=('0d96a4ff68ad6d4b6f1f30f713b18d5184912ba8dd389f86aa7710db079abcb0')
sha256sums_x86_64=('fb625b218e3c61f575e2f24060352f6c8304b4adcc82ea08a909f3c3b1954f97')
sha256sums_aarch64=('7a59c1f78e00b56ad9947c01c2648a2b1e4f30fea206614c4cd5eaac5ab4675e')

package() {
  install -Dm755 "cc-relay" "${pkgdir}/usr/bin/cc-relay"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
