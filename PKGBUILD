# Maintainer: Grey Christoforo <first name at last name dot net>

pkgname=digikey-kicad-library-git
_pkgname=digikey-kicad-library
pkgver=r168.6de9241
pkgrel=1
pkgdesc="An atomic parts library for Ki-Cad. From Digi-Key."
arch=('any')
url="https://github.com/digikey/digikey-kicad-library"
license=('CC-BY-SA 4.0')
makedepends=('git')
conflicts=('digikey-kicad-library')
provides=('digikey-kicad-library')
source=("git+https://github.com/digikey/digikey-kicad-library.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

#build() {
#  cd "$srcdir"
#  mkdir -p "$srcdir/build/"
#  cd "$srcdir/build"
#  cmake ../${_pkgname} -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
#}

package() {
  _DEST_DIR="usr/share/kicad/modules"
  mkdir -p "${pkgdir}/${_DEST_DIR}"
  mv "${srcdir}/${_pkgname}/digikey-footprints.pretty" "${pkgdir}/${_DEST_DIR}/."
  

  _DEST_DIR="usr/share/kicad"
  mkdir -p "${pkgdir}/${_DEST_DIR}"
  mv "${srcdir}/${_pkgname}/digikey-symbols" "${pkgdir}/${_DEST_DIR}/library"
}
