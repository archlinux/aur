# Maintainer: Kercy <kercyding@users.noreply.github.com>

pkgname=kocr-bin
pkgver=0.5.1
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
sha256sums_x86_64=('4506c83977605b9c6198dd38f0706e269e0f45443f167e6db5caf7ca0d30efa3')
sha256sums_aarch64=('0fa0cd0103101bb4a21319d90fcc0904e47df4937c34e9661feea5583be142bd')

package() {
    local dir="kocr-cli-${pkgver}"

    install -Dm755 "${srcdir}/${dir}/bin/kocr" "${pkgdir}/usr/bin/kocr"
    install -Dm644 "${srcdir}/${dir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/${dir}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
