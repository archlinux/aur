# Maintainer: Kercy <kercyding@users.noreply.github.com>

pkgname=kocr-bin
pkgver=0.5.8
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
sha256sums_x86_64=('2ceab7a53374f48daef6acac5e3d9a0d0610fa400ba10ad79bef256d2361c23f')
sha256sums_aarch64=('96c17055fa9230b32d69e914cdb173029d986e90c4b5dca45403e665f2225643')

package() {
    install -Dm755 "${srcdir}/kocr" "${pkgdir}/usr/bin/kocr"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
