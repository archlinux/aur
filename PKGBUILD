# Maintainer: Pablo Arias <pabloariasal@gmail.com>
# Contributor: John Jenkins <twodopeshaggy@gmail.com>

pkgname=bcal-git
_pkgname=bcal
pkgver=1.8.r5.g0fde1c6
pkgrel=1
pkgdesc="Storage conversion and expression calculator"
arch=("i686" "x86_64")
url="https://github.com/jarun/bcal"
license=('GPL3')
source=("git+https://github.com/jarun/${_pkgname}.git")
sha256sums=('SKIP')
conflicts=('bcal')
provides=('bcal')

pkgver() {
   cd "${srcdir}/${_pkgname}"
   git describe --long | sed 's/v\([^-]*-\)/\1r/;s/-/./g'
}

package() {
  make -C "${srcdir}/${_pkgname}" DESTDIR="${pkgdir}" PREFIX="/usr" install
}
