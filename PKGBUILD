# Maintainer: Marco <marcomania2012 at gmail dot com>

pkgname=kf6-servicemenus-pdftools
pkgver=1
pkgrel=2
pkgdesc='KDE service menus for PDF file processing'
arch=('any')
url='https://github.com/marco-mania/kf6-servicemenus-pdftools'
license=('GPL')
depends=('dolphin' 'kdialog' 'ghostscript' 'texlive-bin' 'poppler' 'pdftk' 'texlive-binextra' 'texlive-latexrecommended')
conflicts=("kde-servicemenus-imagetools" "kf5-servicemenus-imagetools")
replaces=("kf5-servicemenus-pdf")

source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")

sha256sums=('82c0d6c937d36a4e9e88ba0b9a988204f215ff99d8a399b463f032a45c31780b')

package() {
    cd "${srcdir}"
    install -dm 755 "${pkgdir}/usr/share/kio/servicemenus/"
    install -m 644 "${pkgname}-${pkgver}"/servicemenus/*.desktop "${pkgdir}/usr/share/kio/servicemenus/"
    install -dm 755 "${pkgdir}/usr/bin/"
    install -m 755 "${pkgname}-${pkgver}"/bin/* "${pkgdir}/usr/bin/"
    install -Dm 644 "${pkgname}-${pkgver}"/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
