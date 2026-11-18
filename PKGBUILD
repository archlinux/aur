# Maintainer: Kercy <kercyding@users.noreply.github.com>

pkgname=kocr-bin
pkgver=0.5.12
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
# The AUR workflow computes these after verifying the release signatures.
sha256sums_x86_64=('6c21abb42838230085578ccf2cc4e13250ccd4a2df04ed3312375cf52e7ecdd3')
sha256sums_aarch64=('f7c7af5836165d8f9f6aeaeb439ed1dad21cfdc5d84f576ebcf590a2c6324e9a')

package() {
    install -Dm755 "${srcdir}/kocr" "${pkgdir}/usr/bin/kocr"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
