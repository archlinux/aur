# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=aocgo-bin
pkgver=0.11.0
pkgrel=1
_tag="aocli-v${pkgver}"
pkgdesc="CLI for Advent of Code: fetch puzzles and inputs and submit answers"
arch=('x86_64')
url="https://github.com/DaltonSW/aocgo"
license=('GPL-3.0-only')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/${_tag}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/DaltonSW/aocgo/${_tag}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/aocli-linux-amd64")
sha256sums=('575d2120c4a7d7eb6848eac24ccb76662085b7948f0b76bb6d71a85bf5fe2230')
sha256sums_x86_64=('b33b77d0c92cd9cf94b5f6e76397602211d39db0a388dc745addd71375e7b05b')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/aocli"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
