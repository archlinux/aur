# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=srt2fcpxml-bin
pkgver=3.1.0
pkgrel=1
pkgdesc="Convert SRT subtitles to Final Cut Pro FCPXML and back"
arch=('x86_64' 'aarch64')
url="https://github.com/GanymedeNil/srt2fcpxml"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/srt2fcpxml_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/srt2fcpxml_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('33a07471a33ccbf1764e95c065966cdbc55f598101cbf2821c0b6efc16301bde')
sha256sums_aarch64=('8497e8de616e5b2740943c9cf66ac11c5ad0e21e34e0111fda818e0da5e8d79d')

package() {
  install -Dm755 "srt2fcpxml" "${pkgdir}/usr/bin/srt2fcpxml"
  install -Dm755 "fcpxml2srt" "${pkgdir}/usr/bin/fcpxml2srt"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
