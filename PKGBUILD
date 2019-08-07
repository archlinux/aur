# Maintainer: Thilo-Alexander Ginkel <tg@tgbyte.de>
# Contributor: Francisco Demartino <demartino.francisco@gmail.com>
# Contributor: Chris Heien <chris.h.heien@gmail.com>

pkgname=pdfbox
pkgver=2.0.16
pkgrel=2
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
            '54da86442dab390db50b8d57eb1469e71dfdff9678e3e4420cbcc09c072b1b5f29d5facbb20807eb058fdc5384f67b930d1324aecb175da8cb3a80c3a9ce581e')

package() {
    cd "${srcdir}"

    install -D -m755 "${srcdir}/pdfbox"   "${pkgdir}/usr/bin/pdfbox"
    install -D -m644 "${srcdir}/${_jarname}" "${pkgdir}/usr/share/pdfbox/pdfbox.jar"
}

