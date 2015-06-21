# Maintainer: Alan Jenkins <alan.james.jenkins@gmail.com>

pkgname=ftb
pkgver=latest
pkgrel=1
pkgdesc="The Feed The Beast Minecraft mod pack manager and launcher."
arch=('i686' 'x86_64')
url="http://www.feed-the-beast.com/"
license=('apache')
depends=('java-runtime' 'xorg-server-utils' 'openal')
provides=('ftb-launcher')

install='ftb.install'

source=("http://ftb.cursecdn.com/FTB2/launcher/FTB_Launcher.jar"
        "ftb"
        "ftb.desktop"
        "ftb.png"
        "LICENSE")
noextract=('FTB_Launcher.jar')

md5sums=(SKIP
         '510cfebbd916203c15b5cb4187f8d133'
         '108626111fbd1557dd7517d71a5e7bef'
         '8b65032bcc390af97255244c0558c780'
         'dbff5a2b542fa58854455bf1a0b94b83')

package() {
    cd "$srcdir"
    # mkdir -p "${pkgdir}/usr/share/ftb/"
    # chmod -R 777 "${pkgdir}/usr/share/ftb/"

    install -D -m555 "${srcdir}/FTB_Launcher.jar"     "${pkgdir}/usr/share/java/ftb/FTB_Launcher.jar"
    install -D -m555 "${srcdir}/ftb"         "${pkgdir}/usr/bin/ftb"

    # Desktop launcher with icon
    install -D -m444 "${srcdir}/ftb.desktop" "${pkgdir}/usr/share/applications/ftb.desktop"
    install -D -m444 "${srcdir}/ftb.png"     "${pkgdir}/usr/share/pixmaps/ftb.png"

    # License
    install -D -m444 "${srcdir}/LICENSE"           "${pkgdir}/usr/share/licenses/ftb/LICENSE"
}

# vim:set ts=4 sw=4 et:
