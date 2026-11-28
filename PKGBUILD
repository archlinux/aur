# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=agent-tincan-bin
pkgver=0.34.0
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
sha256sums_x86_64=('3d87f82ef6a2cc3aa872bab83023a57ec15c4bfc1da159b6479f67b3a01746c1')
sha256sums_aarch64=('5d3b6985747f368048158379c9338d1b1132efb34d82ee4f3949023290852498')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/tincan"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
