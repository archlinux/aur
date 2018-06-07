# Maintainer: Clint Valentine <valentine.clint@gmail.com>
# Contributer: wagnerflo <florian@wagner-flo.net>

_cranname=lubridate
_cranver=1.7.4
pkgname=r-cran-$_cranname
pkgver=${_cranver}
pkgrel=3
pkgdesc="Functions to work with date-times and time-spans"
url="http://cran.r-project.org/web/packages/${_cranname}/index.html"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('r' 'r-stringr' 'r-cpp')
provides=('r-lubridate')
conflicts=('r-lubridate')
source=(http://cran.r-project.org/src/contrib/"${_cranname}"_"${_cranver}".tar.gz)
sha256sums=('510ca87bd91631c395655ee5029b291e948b33df09e56f6be5839f43e3104891')

package() {
  mkdir -p "${pkgdir}"/usr/lib/R/library
  cd "${srcdir}"
  R CMD INSTALL "${_cranname}" -l "${pkgdir}"/usr/lib/R/library
}
