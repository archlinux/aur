# Maintainer: physkets <physkets // at // tutanota dot com>
_pkgname=tbftss
pkgname=${_pkgname}-the-pandoran-war-git
pkgver="r1619.5ed5b6b"
pkgrel=1
pkgdesc="A 2D mission-based space shooter, based on the Battle for the Solar System space opera novel trilogy."
url="https://www.battleforthesolarsystem.com/"
arch=('x86_64')
license=('GPL2')
depends=('sdl2' 'sdl2_image' 'sdl2_mixer' 'sdl2_ttf')
source=("${_pkgname}-${pkgver}.tar.gz::git+https://github.com/stephenjsweeney/${_pkgname}#branch=develop")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
