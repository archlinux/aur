# Maintainer: Antoine Bolvy <antoine.bolvy@gmail.com>

pkgname=pdfbox-legacy
pkgver=0.7.3
pkgrel=1
pkgdesc="An open source Java tool for working with PDF documents. (pdfbox, fontbox, jempbox)"
arch=(any)
url="https://pdfbox.apache.org"
license=('Apache 2')
depends=('java-runtime')
_jarname=PDFBox-${pkgver}.jar
noextract=($_jarname)

source=(https://sourceforge.net/projects/pdfbox/files/PDFBox/PDFBox-${pkgver}/PDFBox-${pkgver}.zip)

sha1sums=('5e986e2e436cd3d06bc59abd1eb14f3ed7400120')

package() {
    cd "${srcdir}"
    unzip "PDFBox-${pkgver}.zip" "PDFBox-${pkgver}/lib/${_jarname}"
    install -D -m644 "${srcdir}/PDFBox-${pkgver}/lib/${_jarname}" "${pkgdir}/usr/share/pdfbox/${_jarname}"
    install -d "${pkgdir}/usr/share/java"
    ln -sf "${pkgdir}/usr/share/pdfbox/${_jarname}" "${pkgdir}/usr/share/java/${_jarname}"
}

