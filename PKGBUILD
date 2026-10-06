# Maintainer: Damon Petta <d at disassemble dot net>

pkgname=batdoc-bin
pkgver=1.7.1
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

sha256sums_x86_64=('50fd64500291c60f34090ce22ace1f54cb57839627d15b3ac662356763445c2a')
sha256sums_aarch64=('2c9e293874212ebde94b05ead953c82f756b24c0c68237137bb79f7e0f817b07')

package() {
    install -Dm755 "${srcdir}/batdoc_${pkgver}_${CARCH}/batdoc" "${pkgdir}/usr/bin/batdoc"
    install -Dm644 "${srcdir}/batdoc_${pkgver}_${CARCH}/batdoc.1" "${pkgdir}/usr/share/man/man1/batdoc.1"
    install -Dm644 "${srcdir}/batdoc_${pkgver}_${CARCH}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/batdoc_${pkgver}_${CARCH}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
