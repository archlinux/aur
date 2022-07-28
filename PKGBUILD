# Maintainer: barfin
pkgname='pressure2-unofficial-steam-skin'
pkgver=1.1.1
pkgrel=2
pkgdesc="A fork of dead Pressure2 theme with tons of fixes."
arch=(any)
url="https://steamcommunity.com/groups/pressureskin/discussions/0/6244776732848407076/"
license=("MIT")
makedepends=(unrar)
depends=(steam sssm)
source=(Pressure2_${pkgver}_FIX.rar::http://perso.numericable.fr/ghost-ses/Ghost/Plugin_Serveur/Skin_steam/Pressure2_${pkgver}_FIX.rar)
noextract=(${source[@]%%::*})
md5sums=('53d6f1e095b3cf2c2128b5bf604cde62')
install="${pkgname}.install"

package() {
  unrar x ${srcdir}/Pressure2_${pkgver}_FIX.rar
  mkdir -p ${pkgdir}/usr/share/steam/skins
  mv ${srcdir}/Pressure2 ${srcdir}/pressure2-unofficial
  cp -r ${srcdir}/pressure2-unofficial ${pkgdir}/usr/share/steam/skins
}

