pkgname=ascii-battleship
pkgver=1.0
pkgrel=1
pkgdesc="An ASCII Battleship game built in Java that can be played in the terminal."
url="https://github.com/allancoding/ascii-battleship"
license=('Apache-2.0')
depends=('java-runtime')
arch=('any')
source=("https://github.com/allancoding/ascii-battleship/raw/main/Ascii_Battleship.jar")
sha256sums=('77d350710fe8cebeb15572713fe0c016ac42da13cee1ca4d5d0f915cdb4f2fe8')
package() {
    install -d "${pkgdir}/usr/share/java/${pkgname}"
    install -Dm644 "${srcdir}/Ascii_Battleship.jar" "${pkgdir}/usr/share/java/${pkgname}/Ascii_Battleship.jar"
    echo "#!/bin/sh" > "${srcdir}/ascii-battleship.sh"
    echo "java -jar /usr/share/java/${pkgname}/Ascii_Battleship.jar" >> "${srcdir}/ascii-battleship.sh"
    chmod +x "${srcdir}/ascii-battleship.sh"
    install -Dm755 "${srcdir}/ascii-battleship.sh" "${pkgdir}/usr/bin/ascii-battleship"
}
