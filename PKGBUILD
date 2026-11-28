# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=sonoscli-bin
pkgver=0.3.6
pkgrel=1
pkgdesc="Control Sonos speakers from your terminal"
arch=('x86_64' 'aarch64')
url="https://github.com/steipete/sonoscli"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/steipete/sonoscli/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/sonoscli_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/sonoscli_${pkgver}_linux_arm64.tar.gz")
sha256sums=('14293556b79940745123d0160c71d27ed0e9fe9b8a848093f3ed78f4853caafe')
sha256sums_x86_64=('8af3567397b37822cf3260cd4d79cfa9fdffad5cdcf4a963c7506a2f5a4910db')
sha256sums_aarch64=('2b419de3e7cacbf61576242464ab7ca2d594f5b7f2278f9c4d26a96a2f9b72ea')

package() {
  install -Dm755 "./sonos" "${pkgdir}/usr/bin/sonos"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
