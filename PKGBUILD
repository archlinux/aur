# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=goalert-bin
pkgver=0.35.0
pkgrel=1
pkgdesc="Open source on-call scheduling, automated escalations, and notifications so you never miss a critical alert"
arch=('x86_64' 'aarch64')
url="https://github.com/target/goalert"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/target/goalert/v${pkgver}/LICENSE.md")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tgz::${_dl}/goalert-linux-amd64.tgz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tgz::${_dl}/goalert-linux-arm64.tgz")
sha256sums=('739e3558be82be5306044750c7c03eb3b1a16ef434b026a639e149069c36c538')
sha256sums_x86_64=('ce8a23bab571163d1d9b90b7ab94fac4b523df44f6680c445f701d0428dfead6')
sha256sums_aarch64=('c011db0819efe66755204156e4ba72d7556b0b25889c7d4dd7febee389041beb')

package() {
  install -Dm755 "./goalert/bin/goalert-slack-email-sync" "${pkgdir}/usr/bin/goalert-slack-email-sync"
  install -Dm755 "./goalert/bin/goalert" "${pkgdir}/usr/bin/goalert"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
