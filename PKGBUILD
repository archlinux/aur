# Maintainer: Clint Valentine <valentine.clint@gmail.com>

_cranname=pillar
_cranver=1.3.0
pkgname="r-${_cranname}"
pkgver="${_cranver}"
pkgrel=1
pkgdesc="Format columns of data using the full range of colours in modern terminals."
url="http://cran.r-project.org/web/packages/${_cranname}/index.html"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('r' 'r-cli' 'r-crayon' 'r-fansi' 'r-rlang' 'r-utf8')
source=("http://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('aed845ae4888be9a7340eed57536e3fe6cb46e89d905897fb9b0635797cfcae0')

package() {
  mkdir -p "${pkgdir}/usr/lib/R/library"
  cd "${srcdir}"
  R CMD INSTALL "${_cranname}" -l "${pkgdir}/usr/lib/R/library"
}
