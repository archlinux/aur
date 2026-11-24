# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=keen-code-bin
pkgver=0.72.0
pkgrel=1
pkgdesc="Context-aware terminal coding agent"
arch=('x86_64' 'aarch64')
url="https://github.com/mochow13/keen-code"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/keen_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/keen_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('8864d3bb01e1d6fb12233f8ad839c73ac6f0efaadd8ba54a85358000af1ee972')
sha256sums_aarch64=('debc6df573e999add3e54b98cca19b757ad0044a64b79d187b9fdafdad2a79ee')

package() {
  install -Dm755 "keen" "${pkgdir}/usr/bin/keen"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
