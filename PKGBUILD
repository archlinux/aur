# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=rings-bin
pkgver=0.40.0
pkgrel=1
pkgdesc="Browser-native peer-to-peer network over WebRTC with a Chord DHT"
arch=('x86_64' 'aarch64')
url="https://github.com/RingsNetwork/rings"
license=('AGPL-3.0-only')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/RingsNetwork/rings/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.zip::${_dl}/rings-v${pkgver}-x86_64-unknown-linux-musl.zip")
source_aarch64=("${pkgname}-${pkgver}-aarch64.zip::${_dl}/rings-v${pkgver}-aarch64-unknown-linux-gnu.zip")
sha256sums=('0d96a4ff68ad6d4b6f1f30f713b18d5184912ba8dd389f86aa7710db079abcb0')
sha256sums_x86_64=('c3332b6977c2c0f751b645920de5b24e0f333c619199b0d5829978c242f0b159')
sha256sums_aarch64=('78f36cc3ce2a882bbb8794611b2f8cb6d03c249f2e65a8e09f1ef30507f10965')

package() {
  install -Dm755 "rings" "${pkgdir}/usr/bin/rings"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
