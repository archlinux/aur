# Maintainer: Thilo-Alexander Ginkel <tg@tgbyte.de>
# Contributor: Francisco Demartino <demartino.francisco@gmail.com>
# Contributor: Chris Heien <chris.h.heien@gmail.com>

pkgname=pdfbox
pkgver=2.0.11
pkgrel=1
pkgdesc="An open source Java tool for working with PDF documents. (pdfbox, fontbox, jempbox)"
arch=(any)
url="https://pdfbox.apache.org"
license=('Apache 2')
depends=('java-runtime')
_jarname=${pkgname}-app-${pkgver}.jar
noextract=($_jarname)

source=(pdfbox
        http://www.us.apache.org/dist/${pkgname}/${pkgver}/${_jarname})

sha512sums=('f6cb390ac097ef07b4b2910a1d7772b09a9a86b6876619a607b15879f37747da162256decd0212d06851bb292f042868a98cdfcab81c420ecc66fa98b0cb2706'
            'fbb2d39f720b647cd4cb93476e555d6e7edb6111129def568546fe7023214234d264faaab9dfff3e2daa0dd8b0dc13271aaa7948cabc7b68a0fa98864cb29ef8')

package() {
    cd "${srcdir}"

    install -D -m755 "${srcdir}/pdfbox"   "${pkgdir}/usr/bin/pdfbox"
    install -D -m644 "${srcdir}/${_jarname}" "${pkgdir}/usr/share/pdfbox/pdfbox.jar"
}

