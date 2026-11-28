# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=tparse-bin
pkgver=0.20.0
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
sha256sums_x86_64=('a4a9450551d9a21a03e4046bbcbd09e16a7a52ccbe9c9331fec2ff930caed3da')
sha256sums_aarch64=('6796a8bb605ab6b1361d09d0a85c1281ae9ea65bd738c97cc80361c12b6b378a')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/tparse"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
