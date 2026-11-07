# Maintainer: Kercy <kercyding@users.noreply.github.com>

pkgname=kocr-bin
pkgver=0.5.0
pkgrel=1
pkgdesc='Offline OCR for images (prebuilt CLI)'
arch=('x86_64' 'aarch64')
url='https://github.com/KercyDing/kocr'
license=('MIT')
depends=('glibc')
provides=('kocr')
conflicts=('kocr')

source_x86_64=(
    "kocr-cli-${pkgver}-linux-amd64.tar.gz::${url}/releases/download/v${pkgver}/kocr-cli-${pkgver}-linux-amd64.tar.gz"
)
source_aarch64=(
    "kocr-cli-${pkgver}-linux-arm64.tar.gz::${url}/releases/download/v${pkgver}/kocr-cli-${pkgver}-linux-arm64.tar.gz"
)
# The release workflow fills these from the release's .sha256 files.
sha256sums_x86_64=('bd4cac36fc854b03c57374626f93f9b78d4fed82b9c302abff01e97b8812028f')
sha256sums_aarch64=('9b3b5e40359c084737a8859b0637fb31d936258ac84129d7250e062de5d98ed9')

package() {
    local dir="kocr-cli-${pkgver}"

    install -Dm755 "${srcdir}/${dir}/bin/kocr" "${pkgdir}/usr/bin/kocr"
    install -Dm644 "${srcdir}/${dir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/${dir}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
