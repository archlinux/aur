# Maintainer: kyndair <kyndair at gmail dot com>
# Place the gog installation file in the same folder as this PKGBUILD
pkgname=gog-pillars_of_eternity_preorder_item_and_pet_dlc
_dlcparent=pillars_of_eternity
_pkgname=gog_pillars_of_eternity_preorder_item_and_pet_dlc
pkgver=2.0.0.2
pkgrel=1
pkgdesc="DLC for the $(echo ${_dlcparent} | sed 's/_/ /g') game."
arch=('x86_64')
url="https://www.gog.com/en/game/pillars_of_eternity_deadfire_pack"
license=('custom')
depends=($(echo gog-${_dlcparent}))
source=("${_pkgname}_${pkgver}.sh::gog://${_pkgname}_${pkgver}.sh")
# don't download anything via makepkg
DLAGENTS+=("gog::/usr/bin/perl -E print\(\"${RED}\"\ .\ substr\(\"%u\",\ 6\)\ .\ \"\ not\ found.\ \ Check\ the\ PKGBUILD\ for\ further\ information.${ALL_OFF}\\\\n\"\)\;\ exit\ 1")
sha256sums=('ebb7e45e20440606f408df10ddc342411d18c4976aaddd6e2ac279abd3ae5c8a')

package() {
    # install goggame files
    find "${srcdir}/data/noarch/game/PillarsOfEternity_Data" -type d -exec chmod 755 {} +
    find "${srcdir}/data/noarch/game/PillarsOfEternity_Data" -type f -exec chmod 644 {} +
    mkdir -p "${pkgdir}/opt/${_dlcparent}"
    mv "${srcdir}/data/noarch/game/PillarsOfEternity_Data" "${pkgdir}/opt/${_dlcparent}"
}
