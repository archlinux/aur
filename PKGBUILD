# Maintainer: barfin
pkgname='pressure1-unofficial-steam-skin'
pkgver=1.0.9
pkgrel=2
pkgdesc="A fork of dead Pressure1 theme with tons of fixes."
arch=(any)
url="https://steamcommunity.com/groups/pressureskin/discussions/0/1638661595066071420/"
license=("MIT")
makedepends=(unrar)
depends=(steam sssm)
source=(Pressure_${pkgver}_FIX.rar::http://perso.numericable.fr/ghost-ses/Ghost/Plugin_Serveur/Skin_steam/Pressure_${pkgver}_FIX.rar)
noextract=(${source[@]%%::*})
md5sums=('89fd4468b69bec8aa666999d377e8ff6')
install="${pkgname}.install"

package() {
  unrar x ${srcdir}/Pressure_${pkgver}_FIX.rar
  mkdir -p ${pkgdir}/usr/share/steam/skins
  mv ${srcdir}/Pressure ${srcdir}/pressure1-unofficial
  cp -r ${srcdir}/pressure1-unofficial ${pkgdir}/usr/share/steam/skins
}

