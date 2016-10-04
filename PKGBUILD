# Maintainer: John Jenkins <twodopeshaggy@gmail.com>

pkgname=bcal
pkgver=35.68f5bba
pkgrel=1
pkgdesc="Byte CALculator. The engineer's utility for storage conversions and calculations."
arch=("i686" "x86_64")
url="https://github.com/jarun/bcal"
license=('GPL3')
source=(${pkgname}::"git+https://github.com/jarun/${pkgname}.git")
sha256sums=('SKIP')
conflicts=('bcal')
provides=('bcal')

pkgver() {
   cd "${srcdir}/${pkgname}"
   echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
  make -C "${srcdir}/${pkgname}" DESTDIR="${pkgdir}" PREFIX="/usr" install
}
