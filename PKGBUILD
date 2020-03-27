# Maintainer: Christopher P. Fair  

pkgname=triplea
pkgver=2.0.18511
pkgrel=2
pkgdesc='An online multiplayer turn based strategy game and board game engine.'
arch=('any')
appname="triplea-game-headed-${pkgver}"
url="http://www.triplea-game.org/"
license=('GPL')
install=${pkgname}.install
depends=('gtk-update-icon-cache' 'java-runtime')
source=( "https://github.com/triplea-game/triplea/releases/download/${pkgver}/${appname}.zip")
sha256sums=('030f6b919be16875347fbb724b53c46b7a23bed30d9c18abdb33c6f7f9ad52c5')
package() {
    echo ${source}
    install -d ${pkgdir}/usr/share/${pkgname}
    install -d ${pkgdir}/usr/bin
    cp -rfpv ${srcdir}/* ${pkgdir}/usr/share/${pkgname}
    cd ${pkgdir}/usr/bin
    printf "#! /usr/bin/bash \n cd /usr/share/${pkgname}/bin \n java -jar ${appname}.jar" > triplea 
    chmod +x triplea
}
