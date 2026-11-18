# Maintainer: Kercy <kercyding@users.noreply.github.com>

pkgname=kocr-bin
pkgver=0.5.11
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
sha256sums_x86_64=('c13cdef69d149c4377033fd96b59d11fc71b5b6367eaff0d6ee74c53a58cdef4')
sha256sums_aarch64=('7176e27c135b7c34260340758fe60565a7a83ecfcea8038f112d5980bd6775ae')

package() {
    install -Dm755 "${srcdir}/kocr" "${pkgdir}/usr/bin/kocr"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
