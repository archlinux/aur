# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=tailsnitch-bin
pkgver=1.7
pkgrel=1
pkgdesc="Security auditor for Tailscale configurations"
arch=('x86_64' 'aarch64')
url="https://github.com/Adversis/tailsnitch"
license=('MIT')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/Adversis/tailsnitch/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/tailsnitch-linux-amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/tailsnitch-linux-arm64")
sha256sums=('0681e42a161ee51f4355a895a67ca79b099fc422cf3825a795cb69a92f0df384')
sha256sums_x86_64=('d6635af47c448ec84a340039a78a5825cc210eddb75dddc910705d5201a1daff')
sha256sums_aarch64=('6fa63c9c91ec6d4696b6fde371d96c59782d83e5849e55b17e01497422152de4')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/tailsnitch"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
