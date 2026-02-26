# Maintainer: qnezor <hello at qnezor.ru>

pkgname=murglar-desktop
pkgver=5.2.149
pkgrel=1
pkgdesc="Murglar Desktop application"
arch=('any')
url="https://github.com/badmannersteam/murglar-downloads"
license=('custom')
depends=('java-runtime')
source=("https://github.com/badmannersteam/murglar-downloads/releases/download/Murglar-Desktop-${pkgver}/Murglar-Desktop-${pkgver}-all-platforms.jar"
        "murglar.png"
        "murglar-desktop.sh"
        "murglar-desktop.desktop")
noextract=("Murglar-Desktop-${pkgver}-all-platforms.jar")
sha256sums=('f0cb5d4937bf19db6c6063ef203eeae30b571ec70d4f90da7d9134492ebb72d6'
        '6ae9f55254656355cb2268d6d11ff268f0827d19bcfae217b616c04b7b7915bd'
        '52cd65b6f7024d8e62f9ca76ad25d8743e9dc6e5f639834f856310ffb0a2023c'
        '58ad0677841f3a35fb85a1b90e7e72603fb6f863dc7a47477bc676a252ebfe6f')

package() {
    install -dm755 "$pkgdir/opt/$pkgname"

    install -Dm644 "Murglar-Desktop-${pkgver}-all-platforms.jar" \
        "${pkgdir}/opt/${pkgname}/${pkgname}.jar"

    install -Dm644 "murglar-desktop.sh" \
        "${pkgdir}/opt/${pkgname}/${pkgname}"

    chmod +x "${pkgdir}/opt/${pkgname}/${pkgname}"

    install -Dm644 "murglar.png" \
        "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

    install -dm755 "${pkgdir}/usr/share/applications"

    install -Dm644 "murglar-desktop.desktop" \
        "${pkgdir}/usr/share/applications/murglar-desktop.desktop"
}
    
