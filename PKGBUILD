# Maintainer: Damon Petta <d at disassemble dot net>

pkgname=batdoc-bin
pkgver=1.4.0
pkgrel=1
pkgdesc='cat(1) for doc, docx, xls, xlsx, pptx, and pdf -- renders to markdown with bat. Pre-compiled.'
arch=('x86_64' 'aarch64')
url='https://github.com/daemonp/batdoc'
license=('MIT')
depends=()
provides=('batdoc')
conflicts=('batdoc' 'batdoc-debug')
options=('!debug')

source_x86_64=("${url}/releases/download/v${pkgver}/batdoc_${pkgver}_x86_64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/batdoc_${pkgver}_aarch64.tar.gz")

sha256sums_x86_64=('3b37d0fed844f656e94e791da973476a04870f1e3d4ce6a3e1b6db62f2f87587')
sha256sums_aarch64=('3b9a44617ad97903f5fdd67a65d2abc57f25260c78bfb7912d791ceba297c408')

package() {
    install -Dm755 "${srcdir}/batdoc_${pkgver}_${CARCH}/batdoc" "${pkgdir}/usr/bin/batdoc"
    install -Dm644 "${srcdir}/batdoc_${pkgver}_${CARCH}/batdoc.1" "${pkgdir}/usr/share/man/man1/batdoc.1"
    install -Dm644 "${srcdir}/batdoc_${pkgver}_${CARCH}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/batdoc_${pkgver}_${CARCH}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
