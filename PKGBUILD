# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=voiceblender-bin
pkgver=1.0.1
pkgrel=1
pkgdesc="Programmable voice AI platform with SIP and WebRTC call control"
arch=('x86_64' 'aarch64')
url="https://github.com/VoiceBlender/voiceblender"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/voiceblender_v${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/voiceblender_v${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('6acba8c75957185f92a7e12a9eca3ba5d4cbc9599b026b25b97c21c723c764bc')
sha256sums_aarch64=('f5ac66001a6de83060fbcbda1e6c824f240ba0add45b0440c5b80215b5ff9d37')

package() {
  install -Dm755 "voiceblender" "${pkgdir}/usr/bin/voiceblender"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
