# Maintainer: dreieck

_pkgname="widelands-maps-rttr"
pkgname="${_pkgname}-localver"
pkgdesc="Makes the maps installed by the Settlers II-remake 'Return to the Roots' available to play with widelands."
url='http://siedler25.org/'
arch=('any')
pkgver=v0.9.5.85
pkgrel=2
depends=('return-to-the-roots')
makedepends=('return-to-the-roots') # Needed for pkgver()
optdepends=('widelands: To play the maps with widelands.')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
replaces=()
license=('GPL2')
options+=('emptydirs')
source=()
sha256sums=()

pkgver() {
  # Set the pkgver to that of the installed return-to-the-root.
  pacman -Q return-to-the-roots | awk '{print $2}' | sed 's|-.*||'
}

package() {
  install -d -v -m755                             "${pkgdir}/usr/share/widelands/maps"
  ln -svr "${pkgdir}/usr/share/s25rttr/RTTR/MAPS" "${pkgdir}/usr/share/widelands/maps/Return to the Roots-maps"
}
