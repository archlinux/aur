# Maintainer: Tanguy ALEXIS <tanguy@metatux.fr>

pkgname=scrolls
pkgver=latest
pkgrel=3
pkgdesc="You use the power of creatures, spells, and ancient machines to gain the edge in battle, deploying your forces by using scrolls."
arch=('x86_64')
license=('custom')
url="https://www.scrolls.com/"
depends=('glu')
source=( scrolls http://download.scrolls.com/client/linux.tar.gz
         scrolls.desktop scrolls.png LICENSE)
md5sums=('906032d3d16ad73b1204d086b0a59e0c'
         'SKIP'
         '747f834cfc610de38986a47d95289f8e'
         '73f17d8db78f23e135effae241e1f2a8'
         'be2ab8f5aba79a6060c12cc23b9c8a2c')

package() {
    cd "$srcdir"
    tar xvzf "${srcdir}/linux.tar.gz"
    mkdir -p "${pkgdir}/usr/share/scrolls"
    cp -r "${srcdir}/Scrolls_Data" "${pkgdir}/usr/share/scrolls/Scrolls_Data"
    chmod -R 755 "${pkgdir}/usr/share/scrolls/Scrolls_Data"
    install -D -m755 "${srcdir}/Scrolls"     "${pkgdir}/usr/share/scrolls/Scrolls"
    install -D -m755 "${srcdir}/scrolls"         "${pkgdir}/usr/bin/scrolls"

    # Desktop launcher with icon
    install -D -m644 "${srcdir}/scrolls.desktop" "${pkgdir}/usr/share/applications/scrolls.desktop"
    install -D -m644 "${srcdir}/scrolls.png"     "${pkgdir}/usr/share/pixmaps/scrolls.png"

    # License
    install -D -m644 "${srcdir}/LICENSE"           "${pkgdir}/usr/share/licenses/scrolls/LICENSE"
}

# vim:set ts=4 sw=4 et: