# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=nullboiler-bin
pkgver=2026.5.29
pkgrel=1
pkgdesc="Orchestrate multi-step AI agent workflows with checkpoints and streaming"
arch=('x86_64' 'aarch64')
url="https://github.com/nullclaw/nullboiler"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/nullclaw/nullboiler/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/nullboiler-linux-x86_64.bin")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/nullboiler-linux-aarch64.bin")
sha256sums=('3239c83ea66a66234f0d4d2c71a9b4dbafd9883a5b659222e0752a32de2617a7')
sha256sums_x86_64=('ecec08fb781b29ca2e0d8d23890ce445d0fb7578d7c2e44eee054655d695b7f7')
sha256sums_aarch64=('7558958e1e13782a27000e19617994c3adf839ef22a38903e60ceb6492917d4b')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/nullboiler"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
