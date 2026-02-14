# Maintainer: Damon Petta <d at disassemble dot net>

pkgname=batdoc-bin
pkgver=1.3.0
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

sha256sums_x86_64=('c2205b7f97742f33a110962481d94cbcd2724584ad07518e811c9245ae4f392c')
sha256sums_aarch64=('df68c5ca65f7826b9895ce4cf7cf800fbd6bc32981eeb5950e1a7b531827fb42')

package() {
    install -Dm755 "${srcdir}/batdoc_${pkgver}_${CARCH}/batdoc" "${pkgdir}/usr/bin/batdoc"
    install -Dm644 "${srcdir}/batdoc_${pkgver}_${CARCH}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/batdoc_${pkgver}_${CARCH}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
