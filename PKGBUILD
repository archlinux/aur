# Maintainer: kyndair <kyndair at gmail dot com>
# Place the gog installation file in the same folder as this PKGBUILD
pkgname=gog-pillars_of_eternity_ii_deadfire_seeker_slayer_survivor_dlc
_dlcparent=pillars_of_eternity_ii_deadfire
_pkgname=pillars_of_eternity_ii_deadfire_seeker_slayer_survivor
pkgver=5.0.0.0040
_pkgver=v5_0_0_0040
_build=29222
pkgrel=1
pkgdesc="DLC for the $(echo ${_dlcparent} | sed 's/_/ /g') game."
arch=('x86_64')
url="https://www.gog.com/en/game/pillars_of_eternity_ii_deadfire_seeker_slayer_survivor"
license=('custom')
depends=($(echo gog-${_dlcparent}))
source=("${_pkgname}_${_pkgver}_${_build}.sh::gog://${_pkgname}_${_pkgver}_${_build}.sh")
# don't download anything via makepkg
DLAGENTS+=("gog::/usr/bin/perl -E print\(\"${RED}\"\ .\ substr\(\"%u\",\ 6\)\ .\ \"\ not\ found.\ \ Check\ the\ PKGBUILD\ for\ further\ information.${ALL_OFF}\\\\n\"\)\;\ exit\ 1")
sha256sums=('fb72bdb4c506f6d748d82709f52cd863267d2aaea509020bb5ebd6aee9cec927')

package() {
    # install goggame files
    find "${srcdir}/data/noarch/game/PillarsOfEternityII_Data" -type d -exec chmod 755 {} +
    find "${srcdir}/data/noarch/game/PillarsOfEternityII_Data" -type f -exec chmod 644 {} +
    mkdir -p "${pkgdir}/opt/${_dlcparent}"
    mv "${srcdir}/data/noarch/game/PillarsOfEternityII_Data" "${pkgdir}/opt/${_dlcparent}"
}
