# Maintainer: Daniel Gray <dng@disroot.org>
pkgname=pdfmted-git
pkgver=r6.a5d363d
pkgrel=1
pkgdesc="View and modify PDF metadata on Linux graphically"
arch=("any")
url="https://github.com/glutanimate/PDFMtEd"
license=('GPL3')
depends=('perl-image-exiftool' 'python2' 'qpdf' 'yad' 'xdg-utils')
optdepends=('java-sejda')
makedepends=('git')
source=("${pkgname}::git+https://github.com/glutanimate/pdfmted")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    install -Dm755 "${pkgname}"/pdfmted-editor -t "${pkgdir}"/usr/bin
    install -Dm755 "${pkgname}"/pdfmted-inspector -t "${pkgdir}"/usr/bin
    install -Dm755 "${pkgname}"/pdfmted-thumbnailer -t "${pkgdir}"/usr/bin
    install -Dm644 "${pkgname}"/desktop/pdfmted-editor.desktop -t "${pkgdir}"/usr/share/applications
    install -Dm644 "${pkgname}"/desktop/pdfmted-inspector.desktop -t "${pkgdir}"/usr/share/applications
    install -Dm644 "${pkgname}"/desktop/pdfmted.png -t "${pkgdir}"/usr/share/icons/hicolor/scalable/apps/
    install -Dm644 "${pkgname}"/desktop/pdfmted.svg -t "${pkgdir}"/usr/share/icons/hicolor/scalable/apps/
}
