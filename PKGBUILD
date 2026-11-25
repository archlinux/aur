# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=agent-tincan-bin
pkgver=0.33.0
pkgrel=1
pkgdesc="Let your AI agents ask each other for help, over Tailscale"
arch=('x86_64' 'aarch64')
url="https://github.com/mvanhorn/agent-tincan"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/mvanhorn/agent-tincan/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/tincan_linux_amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/tincan_linux_arm64")
sha256sums=('be567392323b5023cb95cedbe384f23549efea46ad3acefaba5cc8285632c802')
sha256sums_x86_64=('b3e52eefdba574b05c89db0179e1e96ddecd5a4fc42cb4c01cd7549eed3382de')
sha256sums_aarch64=('c23560e2c2c5b5ce7a709188ddc480bfdbb0afb0c3c7a126ad9ba88132e025c8')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/tincan"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
