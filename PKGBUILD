# Maintainer: John Jenkins <twodopeshaggy@gmail.com>

pkgname=bcal-git
_pkgname=bcal
pkgver=35.68f5bba
pkgrel=1
pkgdesc="Byte CALculator. The engineer's utility for storage conversions and calculations."
arch=("i686" "x86_64")
url="https://github.com/jarun/bcal"
license=('GPL3')
source=(${_pkgname}::"git+https://github.com/jarun/${_pkgname}.git")
sha256sums=('SKIP')
conflicts=('bcal')
provides=('bcal')

pkgver() {
   cd "${srcdir}/${_pkgname}"
   echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
  make -C "${srcdir}/${_pkgname}" DESTDIR="${pkgdir}" PREFIX="/usr" install
}
