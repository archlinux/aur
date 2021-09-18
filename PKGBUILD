# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Ward Segers <w@rdsegers.be>
# Contributor: Alex Branham <branham@utexas.edu>

_cranname=sfsmisc
_cranver=1.1-12
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Utilities from 'Seminar fuer Statistik' ETH Zurich"
arch=(any)
url="https://cran.r-project.org/package=${_cranname}"
license=(GPL2 GPL3)
depends=('r>=3.3.0')
optdepends=(r-cluster r-lokern)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('9b12184a28fff87cacd0c3602d0cf63acb4d0f3049ad3a6ff16177f6df350782')

build() {
  cd "${srcdir}"

  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l ${srcdir}
}

package() {
  cd "${srcdir}"

  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
