# Maintainer: Christopher P. Fair  

pkgname=triplea
pkgver=2.1.20730
pkgrel=1
pkgdesc='An online multiplayer turn based strategy game and board game engine.'
arch=('any')
url="http://www.triplea-game.org/"
license=('GPL')
install=${pkgname}.install
depends=('gtk-update-icon-cache' 'java-runtime')
source=( "https://github.com/triplea-game/triplea/archive/${pkgver}.zip")
sha256sums=('5c31abe25f2178ac2881fea78652cedbf0409bf47ea57403f9619159f2afb9d5')
package() {
    echo ${source}
    install -d ${pkgdir}/usr/share/${pkgname}
    install -d ${pkgdir}/usr/bin
    cp -rfpv ${srcdir}/* ${pkgdir}/usr/share/${pkgname}
    cp -rfpv ${srcdir}/triplea-${pkgver} ${pkgdir}/usr/share/${pkgname}
#rm ${pkgdir}/usr/share/${pkgname}/${pkgname}-${pkgver}.zip
    cd ${pkgdir}/usr/bin
    printf "#! /usr/bin/bash \n cd /usr/share/${pkgname}-${pkgver}/bin \n java -jar ${pkgname}-${pkgver}.jar" > triplea
    chmod +x triplea
}
