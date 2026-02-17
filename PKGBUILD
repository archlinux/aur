# Maintainer: Damon Petta <d at disassemble dot net>

pkgname=batdoc-bin
pkgver=1.3.1
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

sha256sums_x86_64=('bbbfdf385a6348e2d3895603a802c5a5e7e300c20b798e41f64eb4e62d458942')
sha256sums_aarch64=('41a6bfc47b92cddb9971df70885b01dfb0a664874529bcb9a6fa3946c7dff292')

package() {
    install -Dm755 "${srcdir}/batdoc_${pkgver}_${CARCH}/batdoc" "${pkgdir}/usr/bin/batdoc"
    install -Dm644 "${srcdir}/batdoc_${pkgver}_${CARCH}/batdoc.1" "${pkgdir}/usr/share/man/man1/batdoc.1"
    install -Dm644 "${srcdir}/batdoc_${pkgver}_${CARCH}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/batdoc_${pkgver}_${CARCH}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
