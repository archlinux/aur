# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=pentest-swarm-ai-bin
pkgver=0.3.7
pkgrel=1
pkgdesc="Open-source autonomous AI pentester (the open-source XBOW alternative)"
arch=('x86_64' 'aarch64')
url="https://github.com/Armur-Ai/Pentest-Swarm-AI"
license=('AGPL-3.0-only')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/Armur-Ai/Pentest-Swarm-AI/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/pentestswarm-linux-amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/pentestswarm-linux-arm64")
sha256sums=('0d96a4ff68ad6d4b6f1f30f713b18d5184912ba8dd389f86aa7710db079abcb0')
sha256sums_x86_64=('658c169f08c229bae47a228aa87a912f942422c684f164db9b5083f61eb328fa')
sha256sums_aarch64=('a6082df732c31d1c9466793ec3ec5b77bd13c6df5f6cbc3a89e57c5441d55f6b')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/pentestswarm"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
