# Maintainer: Kercy <kercyding@users.noreply.github.com>

pkgname=kocr-bin
pkgver=0.5.2
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
sha256sums_x86_64=('0ca7b69c44ea29075383039a58262b6930d49099f98b05b486a068948dbe5f1b')
sha256sums_aarch64=('eeb4355183df17e8d3eb718016937a196931d0ce586be270378b8d5cc7907455')

package() {
    local dir="kocr-cli-${pkgver}"

    install -Dm755 "${srcdir}/${dir}/bin/kocr" "${pkgdir}/usr/bin/kocr"
    install -Dm644 "${srcdir}/${dir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/${dir}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
