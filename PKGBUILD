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
depends=('gtk-update-icon-cache' 'java-runtime')
source=( "https://github.com/triplea-game/triplea/archive/${pkgver}.zip"
         "triplea")
sha256sums=('04ff41bc359d76d9432eab31008520688844fcdae670455fa6260680355bef7a' '8bdbbb7cf333a042bde7605f03683e560e97d1cbe8ebaabc5bd2134ce30a462d' )


build(){
    cd "${srcdir}/${pkgname}-${pkgver}"
    ./gradlew assemble
}



package() {
    install -d "${pkgdir}/usr/share/triplea"
    cd ${srcdir}/${pkgname}-${pkgver}
    cp -R * ${pkgdir}/usr/share/triplea
    rm -Rf docs 
    install -D -m 0755 ${srcdir}/triplea ${pkgdir}/usr/bin/triplea
}
