# Maintainer: Kercy <kercyding@users.noreply.github.com>

pkgname=kocr-bin
pkgver=0.5.5
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
sha256sums_x86_64=('c14405fdec7bb63703acb35158f9d4c172415fb5e9456d66a3484565e92543ac')
sha256sums_aarch64=('64359152f869f8ef320ebd544d121fdb2a3b9948265fd9e7c4dce0a33140bc06')

package() {
    install -Dm755 "${srcdir}/kocr" "${pkgdir}/usr/bin/kocr"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
