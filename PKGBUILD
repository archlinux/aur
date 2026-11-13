# Maintainer: Kercy <kercyding@users.noreply.github.com>

pkgname=kocr-bin
pkgver=0.5.6
pkgrel=1
pkgdesc='Offline OCR for images (prebuilt CLI)'
arch=('x86_64' 'aarch64')
url='https://github.com/KercyDing/kocr'
license=('MIT')
depends=('glibc')
provides=('kocr')
conflicts=('kocr')

source_x86_64=(
    "kocr-cli-${pkgver}-x86_64-linux.tar.gz::${url}/releases/download/v${pkgver}/kocr-cli-${pkgver}-x86_64-linux.tar.gz"
)
source_aarch64=(
    "kocr-cli-${pkgver}-aarch64-linux.tar.gz::${url}/releases/download/v${pkgver}/kocr-cli-${pkgver}-aarch64-linux.tar.gz"
)
# The release workflow fills these from the release's .sha256 files.
sha256sums_x86_64=('6f667c7b292d3ea95156c1c421b283e7502b00bcd2d186750d3d3731618a944d')
sha256sums_aarch64=('d7f37aac8da611fc8a40bc49117ce161e84bffce5de703ed64af67f9a7dfed1a')

package() {
    install -Dm755 "${srcdir}/kocr" "${pkgdir}/usr/bin/kocr"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
