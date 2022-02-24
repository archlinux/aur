# Maintainer: Gobidev <adrian[dot]groh[at]t-online[dot]de>

pkgname=triplea
pkgver=2.6.586
pkgrel=1
pkgdesc='An online multiplayer turn based strategy game and board game engine.'
arch=('any')
appname="triplea-game-headed-${pkgver}"
url="http://www.triplea-game.org/"
license=('GPL')
install=${pkgname}.install
depends=('gtk-update-icon-cache' 'java-runtime')
source=( "https://github.com/triplea-game/triplea/releases/download/${pkgver}/${appname}.zip")
sha256sums=('27df0633f71b408d17962572ff0702e5a9cd5e874d71b20fbc421d4ca8327ab7')

package() {
    install -d ${pkgdir}/usr/share/${pkgname}
    install -d ${pkgdir}/usr/bin
    cp -rfpv ${srcdir}/bin ${pkgdir}/usr/share/${pkgname}
    cp -rfpv ${srcdir}/assets ${pkgdir}/usr/share/${pkgname}/bin
    cp -rfpv ${srcdir}/.triplea-root ${pkgdir}/usr/share/${pkgname}
    cp ${srcdir}/.triplea-root ${pkgdir}/usr/share/${pkgname}
    cd ${pkgdir}/usr/bin
    printf "#! /usr/bin/bash \n cd /usr/share/${pkgname}/bin \n java -jar ${appname}.jar" > triplea 
    chmod +x triplea
}
