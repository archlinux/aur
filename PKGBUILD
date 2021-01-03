# Maintainer: Thilo-Alexander Ginkel <tg@tgbyte.de>
# Contributor: Francisco Demartino <demartino.francisco@gmail.com>
# Contributor: Chris Heien <chris.h.heien@gmail.com>

pkgname=pdfbox
pkgver=2.0.22
pkgrel=1
pkgdesc="An open source Java tool for working with PDF documents. (pdfbox, fontbox, jempbox)"
arch=(any)
url="https://pdfbox.apache.org"
license=('Apache 2')
depends=('java-runtime')
_jarname=${pkgname}-app-${pkgver}.jar
noextract=($_jarname)

source=(pdfbox
        https://www-eu.apache.org/dist/${pkgname}/${pkgver}/${_jarname})

sha512sums=('f6cb390ac097ef07b4b2910a1d7772b09a9a86b6876619a607b15879f37747da162256decd0212d06851bb292f042868a98cdfcab81c420ecc66fa98b0cb2706'
            '24077504894b711177330bd550d8cf0263640b17e54020f9b10cf0e2a9b5b80c8d81dd094b214b216fddc1fd3ee23258d46cc0926f3891907a9e9d0fc77a10df')

package() {
    cd "${srcdir}"

    install -D -m755 "${srcdir}/pdfbox"   "${pkgdir}/usr/bin/pdfbox"
    install -D -m644 "${srcdir}/${_jarname}" "${pkgdir}/usr/share/pdfbox/pdfbox.jar"
}

