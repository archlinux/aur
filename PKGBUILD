# Maintainer: qnezor <hello at qnezor.ru>

pkgname=murglar-desktop
pkgver=5.4.151
pkgrel=1
pkgdesc="Listen and download music from your favorite music services — VK, Yandex Music, SoundCloud, Deezer, Zvuk and WebDAV"
arch=('any')
url="https://github.com/badmannersteam/murglar-downloads"
license=('custom')
depends=('java-runtime')
source=("https://github.com/badmannersteam/murglar-downloads/releases/download/Murglar-Desktop-${pkgver}/Murglar-Desktop-${pkgver}-all-platforms.jar"
        "murglar.png"
        "murglar-desktop.sh"
        "murglar-desktop.desktop")
noextract=("Murglar-Desktop-${pkgver}-all-platforms.jar")
sha256sums=('9e627aa0d8380e30527be3d033c8b428d795d0465cd3ff86bff3f54ccce1127d'
        '6ae9f55254656355cb2268d6d11ff268f0827d19bcfae217b616c04b7b7915bd'
        '52cd65b6f7024d8e62f9ca76ad25d8743e9dc6e5f639834f856310ffb0a2023c'
        '2747f8f58ca204e5e6fc4b96a70b502fa5ad77dde71e9b103c2aa6ea3042510e')

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
    
