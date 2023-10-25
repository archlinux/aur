# Maintainer: Allan Niles allancoding.dev@gmail.com

pkgname=ascii-battleship
pkgver=1.5
pkgrel=1
pkgdesc="An ASCII Battleship game built in Java that can be played in the terminal."
url="https://github.com/allancoding/ascii-battleship"
license=('Apache-2.0')
depends=('java-runtime')
arch=('any')
source=("https://raw.githubusercontent.com/allancoding/ascii-battleship/main/Ascii_Battleship.jar")
sha256sums=('1e142a933e11cfc0002c4cf326c35f5ba1414ea0e5e3cbbdb4cf6595bd432b48')
package() {
    install -d "${pkgdir}/usr/share/java/${pkgname}"
    install -Dm644 "${srcdir}/Ascii_Battleship.jar" "${pkgdir}/usr/share/java/${pkgname}/Ascii_Battleship.jar"
    echo "#!/bin/sh" > "${srcdir}/ascii-battleship.sh"
    echo "java -jar /usr/share/java/${pkgname}/Ascii_Battleship.jar" >> "${srcdir}/ascii-battleship.sh"
    chmod +x "${srcdir}/ascii-battleship.sh"
    install -Dm755 "${srcdir}/ascii-battleship.sh" "${pkgdir}/usr/bin/ascii-battleship"
}
