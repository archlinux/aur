# Maintainer: Aaron Fischer <mail@aaron-fischer.net>

pkgname=pablodraw
pkgver=3.2.1
pkgrel=1
pkgdesc="An ANSI/ASCII art editor and viewer with multi-user capabilities"
arch=("i686" "x86_64")
url="http://picoe.ca/products/pablodraw/"
license=("custom")
depends=("mono" "gtk-sharp-2")
makedepends=("unzip")
source=("http://download.picoe.ca/pablodraw/3.2/PabloDraw-${pkgver}.zip"
        "pablodraw.sh")
sha256sums=("8fc4a6787062b52bfba481d689d7410788b60bab4efeeabc0b94b3e47cc82f02"
            "f07cfccdce30e64b87ae06f90674ab5aa46943ef5790c1f0f2c004a2692e4553")

package() {
    install -m 755 -d "${pkgdir}/usr/share/pablodraw/"
    cd "${pkgdir}/usr/share/pablodraw"
    unzip "${srcdir}/PabloDraw-${pkgver}.zip"
    
    # install bin wrapper
    install -m 755 -d "${pkgdir}/usr/bin"
    install -m 755 "${srcdir}/pablodraw.sh" "${pkgdir}/usr/bin/pablodraw"
}
