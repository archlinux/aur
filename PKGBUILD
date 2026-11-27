# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=zot-agent-bin
pkgver=0.4.90
pkgrel=1
pkgdesc="Lightweight coding agent harness"
arch=('x86_64' 'aarch64')
url="https://github.com/patriceckhart/zot"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}" 'zot')
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/zot_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/zot_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('70449df36045f0285dc5f37c5927d8cde106829751be80aec978bcd1cfe75192')
sha256sums_aarch64=('a366d3eea03b323e5a0202863de75d84f5a2333407989896279f38c382a6d5e6')

package() {
  install -Dm755 "zot" "${pkgdir}/usr/bin/zot"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
