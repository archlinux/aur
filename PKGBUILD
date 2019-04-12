# Maintainer: Thilo-Alexander Ginkel <tg@tgbyte.de>
# Contributor: Francisco Demartino <demartino.francisco@gmail.com>
# Contributor: Chris Heien <chris.h.heien@gmail.com>

pkgname=pdfbox
pkgver=2.0.15
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
            '72914fd6c945443c1f2e814e5e019e44ceb837a4bc7ec71ed436bf5fc1b468d2b1ae0c6585e219c159c0642e659eff016167a9bd1dba55e4f8411a4b5d93cf7c')

package() {
    cd "${srcdir}"

    install -D -m755 "${srcdir}/pdfbox"   "${pkgdir}/usr/bin/pdfbox"
    install -D -m644 "${srcdir}/${_jarname}" "${pkgdir}/usr/share/pdfbox/pdfbox.jar"
}

