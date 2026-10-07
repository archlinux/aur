# Maintainer: Marco <marcomania2012 at gmail dot com>

pkgname=kf6-servicemenus-pdftools
pkgver=3
pkgrel=1
pkgdesc='KDE service menus for PDF file processing'
arch=('any')
url='https://github.com/marco-mania/kf6-servicemenus-pdftools'
license=('GPL')
depends=('dolphin' 'kdialog' 'ghostscript' 'texlive-bin' 'poppler' 'cups' 'texlive-binextra' 'texlive-latexrecommended')
optdepends=('pdf2djvu')
conflicts=("kde-servicemenus-imagetools" "kf5-servicemenus-imagetools")
replaces=("kde-servicemenu-imagetools" "kf5-servicemenus-pdf")

source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")

sha256sums=('34e84a29937675895abbf6916ff4c44b10aca51115853d99556d8c4089f16079')

package() {
    cd "${srcdir}"
    install -dm 755 "${pkgdir}/usr/share/kio/servicemenus/"
    install -m 644 "${pkgname}-${pkgver}"/servicemenus/*.desktop "${pkgdir}/usr/share/kio/servicemenus/"
    install -dm 755 "${pkgdir}/usr/bin/"
    install -m 755 "${pkgname}-${pkgver}"/bin/* "${pkgdir}/usr/bin/"
}
