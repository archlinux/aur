# Maintainer: Aneesh <anemovva@gmail.com>
# Contributor: Imperivm Romanvm (SPQR) <augustus@rome.rm>

pkgname=lunar-client-qt2
pkgver=2.5.0
pkgrel=5
_srcname="${pkgname}-${pkgver}.tar.gz"
source=(
    "$_srcname::https://github.com/Nilsen84/lcqt2/releases/download/v${pkgver}/linux-portable.tar.gz"
    "https://cdn.discordapp.com/icons/1134376256750755890/0d129e0190943de0d230cac3a5c79a2c.png?size=4096"
    "https://gist.githubusercontent.com/anemovva/141e7b3c76ba3065ea1beacf6d8680f5/raw/b18cf377fa108a6899685afbec4bc4dfb4f183bc/lcqt2.desktop"
)
depends=(lunar-client)
license=(unknown)
pkgdesc="Lunar Client QT2 is a program that adds features to the popular PvP client Lunar Client."
arch=('x86_64')
url=https://github.com/Nilsen84/lcqt2
sha256sums=('c70872fc81a1ef5ea46b590c7aa92e1e21e249315712a93e4a4de8ec05d0e29b'
            '943e3a2b10516e05dc603b194792e7bebd5dd4f00c9a651ba22c94ef1aba1572'
            'e5e5610cc8f07722b00fbc78da8157671d86d9ca932102260f1ae252c0524505')

prepare(){
    mv "0d129e0190943de0d230cac3a5c79a2c.png?size=4096" lcqt2.png
}

package(){
    install -D "${srcdir}/gui.asar" "${pkgdir}/opt/lcqt2/gui.asar"
    install -D "${srcdir}/agent.jar" "${pkgdir}/opt/lcqt2/agent.jar"
    install -D "${srcdir}/Lunar Client Qt" "${pkgdir}/opt/lcqt2/Lunar Client Qt"
    install -D "${srcdir}/lcqt2.png" "${pkgdir}/opt/lcqt2/lcqt2.png"

    install -Dm644 "${srcdir}/lcqt2.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    install -d "${pkgdir}/usr/bin/"

    ln -sf "/opt/lcqt2/Lunar Client Qt" "${pkgdir}/usr/bin/lunarclientqt2"
}
