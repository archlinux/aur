# Maintainer: Alexander Bocken <alexander@bocken.org>

_cranname=ROOPSD
_cranver=0.3.9
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="R Object Oriented Programming for Statistical Distribution"
arch=(any)
url="https://cran.r-project.org/package=${_cranname}"
license=(custom:CeCILLV2)
depends=('r>=3.3' r-r6 r-lmoments r-numderiv)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=(22a11beeb695a88836b9c64a9b0cfdbf4fee4274f7cc601e69949b33de738775)

build() {
  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
