# Maintainer: kyndair <kyndair at gmail dot com>
# Place the gog installation file in the same folder as this PKGBUILD
pkgname=humble-tangledeep-legend-of-shara
_dlcparent=tangledeep
pkgver=1
pkgrel=1
pkgdesc="DLC for the ${_dlcparent} game."
arch=('i686' 'pentium4' 'x86_64')
url="https://www.humblebundle.com/store/tangledeep-legend-of-shara"
license=('custom')
depends=("${_dlcparent}")
confilcts=("gog-tangledeep-legend-of-shara")
source=("Tangledeep_LegendOfShara_Keyfile.zip::humble://Tangledeep_LegendOfShara_Keyfile.zip")
# don't download anything via makepkg
DLAGENTS+=("humble::/usr/bin/perl -E print\(\"${RED}\"\ .\ substr\(\"%u\",\ 6\)\ .\ \"\ not\ found.\ \ Check\ the\ PKGBUILD\ for\ further\ information.${ALL_OFF}\\\\n\"\)\;\ exit\ 1")
sha256sums=('0c61be9bc404e28a02c5b08284a2ec3f4b2c97402b939c2214a522bb3b029adc')

package() {
    # install DLC key. Assets are now pre-installed in the main game
    install -Dm644 "${srcdir}/los/loschk" "${pkgdir}/opt/${_dlcparent}/Tangledeep_Data/dlc/loschk"
}
