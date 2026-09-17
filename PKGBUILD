# Maintainer: Damon Petta <d at disassemble dot net>

pkgname=batdoc-bin
pkgver=1.6.0
pkgrel=1
pkgdesc='cat(1) for doc, docx, xls, xlsx, pptx, pdf, and image files (OCR) -- renders to markdown with bat. Pre-compiled.'
arch=('x86_64' 'aarch64')
url='https://github.com/daemonp/batdoc'
license=('MIT')
depends=()
provides=('batdoc')
conflicts=('batdoc' 'batdoc-debug')
options=('!debug')

source_x86_64=("${url}/releases/download/v${pkgver}/batdoc_${pkgver}_x86_64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/batdoc_${pkgver}_aarch64.tar.gz")

sha256sums_x86_64=('bd9a062a6909bd93183dcdf6539bb6aa26c7aa12163e5f1808db0e66c981c8cc')
sha256sums_aarch64=('22205aadef5f38046fdf6bd8011945877488b69953d3e84fee8e49305aae892e')

package() {
    install -Dm755 "${srcdir}/batdoc_${pkgver}_${CARCH}/batdoc" "${pkgdir}/usr/bin/batdoc"
    install -Dm644 "${srcdir}/batdoc_${pkgver}_${CARCH}/batdoc.1" "${pkgdir}/usr/share/man/man1/batdoc.1"
    install -Dm644 "${srcdir}/batdoc_${pkgver}_${CARCH}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/batdoc_${pkgver}_${CARCH}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
