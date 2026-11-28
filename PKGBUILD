# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=ayaflow-bin
pkgver=0.1.2
pkgrel=1
pkgdesc="eBPF-based network traffic analyzer"
arch=('x86_64' 'aarch64')
url="https://github.com/DavidHavoc/ayaFlow"
license=('Apache-2.0')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/DavidHavoc/ayaFlow/v${pkgver}/LICENSE-APACHE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/ayaflow-linux-amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/ayaflow-linux-arm64")
sha256sums=('ca6ca28f9d66737005a1bc0b1b830dc791bece3903b34fd8a4914c8aed3e72eb')
sha256sums_x86_64=('019ec34199cf6e0d5c214f96b1781204748fb09a7a9ef5bde65b1436ef759b2d')
sha256sums_aarch64=('e8d1035a9bf712a27179ff4958b219336b08fea07a96cf506d38b06f71e7cafd')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/ayaflow"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
