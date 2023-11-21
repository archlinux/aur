# Contributor: Daniel Gray <dng@disroot.org>
# Maintainer: Tom Hu <tom@bluespice.org>
pkgname=pdfmted-git
pkgver=r21.7d7af77
pkgrel=1
pkgdesc="View and modify PDF metadata on Linux graphically"
arch=('any')
url="https://github.com/glutanimate/PDFMtEd"
license=('GPL3')
depends=('perl-image-exiftool' 'python3' 'qpdf' 'yad' 'xdg-utils')
optdepends=('sejda-console')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/glutanimate/pdfmted#branch=master')
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    install -Dm755 "${pkgname%-git}"/pdfmted-editor -t "${pkgdir}"/usr/bin
    install -Dm755 "${pkgname%-git}"/pdfmted-inspector -t "${pkgdir}"/usr/bin
    install -Dm755 "${pkgname%-git}"/pdfmted-thumbnailer -t "${pkgdir}"/usr/bin
    install -Dm644 "${pkgname%-git}"/desktop/pdfmted-editor.desktop -t "${pkgdir}"/usr/share/applications
    install -Dm644 "${pkgname%-git}"/desktop/pdfmted-inspector.desktop -t "${pkgdir}"/usr/share/applications
    install -Dm644 "${pkgname%-git}"/desktop/pdfmted.png -t "${pkgdir}"/usr/share/icons/hicolor/scalable/apps/
    install -Dm644 "${pkgname%-git}"/desktop/pdfmted.svg -t "${pkgdir}"/usr/share/icons/hicolor/scalable/apps/
}
