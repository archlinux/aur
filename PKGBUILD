# Contributor: Raniz <raniz *AT* gmx *DOT* net>
# Maintainer: Parth Nobel <pnob99 *AT* gmail *DOT* com>

pkgname=triplea
pkgver=1.9.0.0.7594
pkgrel=1
pkgdesc='An online multiplayer turn based strategy game and board game engine.'
arch=('any')
url="http://www.triplea-game.org/"
license=('GPL')
install=${pkgname}.install
depends=('gradle' 'jdk' 'gtk-update-icon-cache' 'java-runtime')
source=( "https://github.com/triplea-game/triplea/archive/${pkgver}.zip"
         "triplea")
sha256sums=('04ff41bc359d76d9432eab31008520688844fcdae670455fa6260680355bef7a' '4fdd7ad0c1a802a3142e800dc1f354a246586d8bb75b8c17b6dc948b5cf35f05' )
https://github.com/triplea-game/triplea/archive/1.9.0.0.7594.zip
package() {
    install -d "${pkgdir}/usr/share/triplea"
    cd ${pkgdir}
    unzip ${pkgver}.zip 
    cd ${srcdir}/${pkgver//./_}
    cp -R * ${pkgdir}/usr/share/triplea
    rm -Rf docs 
    install -D -m 0755 ${srcdir}/triplea ${pkgdir}/usr/bin/triplea
}
