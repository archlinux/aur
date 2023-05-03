# Maintainer: Michał Lisowski <lisu@riseup.net>

pkgname=geocentral-lite
pkgver=1.0.15
pkgrel=1
pkgdesc="Simple desktop application for quick geocaches logging"
arch=('x86_64')
license=('custom')
url="https://www.geocentral.pl/"
depends=('gtk3' 'java-runtime>=8')
noextract=('geocentral-lite-1.0.5-linux64.jar')
source=("https://www.geocentral.pl/files/${pkgname}-${pkgver}-linux64.jar"
        "${pkgname}"
        "${pkgname}.png"
        "${pkgname}.desktop")
md5sums=('9c4e3c8a89cb41915777dd8bb2905543'
         '15531c21c1d3939dffc22e152160a2fd'
         '941e50f8ca6562c5753ffcd6da0513fb'
         '9dd977b6c37dcab0d13c2737c6935881')

package() {
    cd "$srcdir"

    install -D -m755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -D -m644 "${srcdir}/${pkgname}-${pkgver}-linux64.jar" "${pkgdir}/usr/share/geocentral-lite/${pkgname}.jar"

    # Desktop launcher with icon
    install -D -m644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -D -m644 "${srcdir}/${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}

