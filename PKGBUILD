# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=statlite-bin
pkgver=0.8.0
pkgrel=1
pkgdesc="Lightweight self-hosted application monitoring for small servers"
arch=('x86_64' 'aarch64')
url="https://github.com/PVRLabs/statlite"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/statlite_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/statlite_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('2f8c197865f3289b234b0c455ec504b88c38afce0b6de9473846d0a1e8dd03df')
sha256sums_aarch64=('975e9422a80a2ca12093a0e1856a977364a195afd4f36bc0381e5761ca1dfa30')

package() {
  install -Dm755 "statlite" "${pkgdir}/usr/bin/statlite"
  install -Dm644 "LICENSE-Chart.js.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "LICENSE-Orbitron.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
