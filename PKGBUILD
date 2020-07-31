# Maintainer: Christopher P. Fair  

pkgname=triplea
pkgver=2.1.20730
pkgrel=2
pkgdesc='An online multiplayer turn based strategy game and board game engine.'
arch=('any')
appname="triplea-game-headed-${pkgver}"
url="http://www.triplea-game.org/"
license=('GPL')
install=${pkgname}.install
depends=('gtk-update-icon-cache' 'java-runtime')
source=( "https://github.com/triplea-game/triplea/releases/download/${pkgver}/${appname}.zip")
sha256sums=('0c97cce9486ed50f72e16d8b630a0e519fdb66984b1a6a45042dd724c7a83446')

package() {
    echo ${source}
    install -d ${pkgdir}/usr/share/${pkgname}
    install -d ${pkgdir}/usr/bin
    cp -rfpv ${srcdir}/* ${pkgdir}/usr/share/${pkgname}
    cp -rfpv ${srcdir}/.triplea-root ${pkgdir}/usr/share/${pkgname}
    cp ${srcdir}/.triplea-root ${pkgdir}/usr/share/${pkgname}
    rm ${pkgdir}/usr/share/${pkgname}/${appname}.zip
    cd ${pkgdir}/usr/bin
    printf "#! /usr/bin/bash \n cd /usr/share/${pkgname}/bin \n java -jar ${appname}.jar" > triplea 
    chmod +x triplea
}
