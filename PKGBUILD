# Maintainer: Allan Niles allancoding.dev@gmail.com

pkgname=ascii-battleship
pkgver=1.3
pkgrel=2
pkgdesc="An ASCII Battleship game built in Java that can be played in the terminal."
url="https://github.com/allancoding/ascii-battleship"
license=('Apache-2.0')
depends=('java-runtime')
arch=('any')
source=("https://github.com/allancoding/ascii-battleship/raw/main/Ascii_Battleship.jar")
sha256sums=('f9a7290d2ddd513a9e4409c93d25e0d0e6b07a97e57c1217466870e970dda2a9')
package() {
    install -d "${pkgdir}/usr/share/java/${pkgname}"
    install -Dm644 "${srcdir}/Ascii_Battleship.jar" "${pkgdir}/usr/share/java/${pkgname}/Ascii_Battleship.jar"
    echo "#!/bin/sh" > "${srcdir}/ascii-battleship.sh"
    echo "java -jar /usr/share/java/${pkgname}/Ascii_Battleship.jar" >> "${srcdir}/ascii-battleship.sh"
    chmod +x "${srcdir}/ascii-battleship.sh"
    install -Dm755 "${srcdir}/ascii-battleship.sh" "${pkgdir}/usr/bin/ascii-battleship"
}
