# Maintainer: Kercy <kercyding@users.noreply.github.com>

pkgname=kocr-bin
pkgver=0.5.3
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
sha256sums_x86_64=('008dad3cc9eaae070a3f4bddb79735bf9c51ec56e544f950edd2a63b5e59398a')
sha256sums_aarch64=('d5e7c945a565ab3b1e73d2fee090edaebb9f7d94b564acfab4e5adf6e5f0e053')

package() {
    local dir="kocr-cli-${pkgver}"

    install -Dm755 "${srcdir}/${dir}/bin/kocr" "${pkgdir}/usr/bin/kocr"
    install -Dm644 "${srcdir}/${dir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/${dir}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
