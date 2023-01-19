# Maintainer: kyndair <kyndair at gmail dot com>
# Place the gog installation file in the same folder as this PKGBUILD
pkgname=gog-pillars_of_eternity_ii_deadfire_beast_of_winter_dlc
_dlcparent=pillars_of_eternity_ii_deadfire
_pkgname=pillars_of_eternity_ii_deadfire_beast_of_winter
pkgver=5.0.0.0040
_pkgver=v5_0_0_0040
_build=29222
pkgrel=1
pkgdesc="DLC for the $(echo ${_dlcparent} | sed 's/_/ /g') game."
arch=('x86_64')
url="https://www.gog.com/en/game/pillars_of_eternity_ii_deadfire_the_beast_of_winter"
license=('custom')
depends=($(echo gog-${_dlcparent}))
source=("${_pkgname}_${_pkgver}_${_build}.sh::gog://${_pkgname}_${_pkgver}_${_build}.sh")
# don't download anything via makepkg
DLAGENTS+=("gog::/usr/bin/perl -E print\(\"${RED}\"\ .\ substr\(\"%u\",\ 6\)\ .\ \"\ not\ found.\ \ Check\ the\ PKGBUILD\ for\ further\ information.${ALL_OFF}\\\\n\"\)\;\ exit\ 1")
sha256sums=('7d3454e2ba4285d9c862820cf373e86818257e3a9823edd89b82de56ae37ba7d')

package() {
    # install goggame files
    find "${srcdir}/data/noarch/game/PillarsOfEternityII_Data" -type d -exec chmod 755 {} +
    find "${srcdir}/data/noarch/game/PillarsOfEternityII_Data" -type f -exec chmod 644 {} +
    mkdir -p "${pkgdir}/opt/${_dlcparent}"
    mv "${srcdir}/data/noarch/game/PillarsOfEternityII_Data" "${pkgdir}/opt/${_dlcparent}"
}
