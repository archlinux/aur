# Maintainer: physkets <physkets // at // tutanota dot com>
_pkgname=tbftss
pkgname=${_pkgname}-the-pandoran-war
pkgver=1.4.0
pkgrel=1
pkgdesc="A 2D mission-based space shooter, based on the Battle for the Solar System space opera novel trilogy."
url="https://www.battleforthesolarsystem.com/"
arch=('x86_64')
license=('GPL2')
depends=('sdl2' 'sdl2_image' 'sdl2_mixer' 'sdl2_ttf')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/stephenjsweeney/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('c8c128f89253a04cfc91a01a2c25fad6b0804df0bc28505c703335cb7a37331f')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
