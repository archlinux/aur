# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=tparse-bin
pkgver=0.18.0
pkgrel=1
pkgdesc="Summarize go test output"
arch=('x86_64' 'aarch64')
url="https://github.com/mfridman/tparse"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/mfridman/tparse/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/tparse_linux_x86_64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/tparse_linux_arm64")
sha256sums=('285c7b2eb9b0db7c6dfa5a1910ade5beede8338583adb7f6506d69d5e3920b64')
sha256sums_x86_64=('d042b0dfdd43dfe5340b9b1cedfcab3018cdd4cfceedcf9cb242bcff9b534b70')
sha256sums_aarch64=('96ce6434fbf58f9fbfd5fb7429f77ed4eedac51a528d2314b52b1793d52851b3')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/tparse"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
