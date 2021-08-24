# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Grey Christoforo <first name at last name dot net>

_cranname=matrixStats
_cranver=0.60.1
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Functions that Apply to Rows and Columns of Matrices (and to Vectors)"
arch=(i686 x86_64)
url="https://cran.r-project.org/package=${_cranname}"
license=(Artistic-2.0)
depends=('r>=2.12.0')
optdepends=(r-base64enc r-ggplot2 r-knitr r-microbenchmark r-r.devices r-r.rsp)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('2f77f1dc3d157e85d91f468e4ec4c569537b17a156e016ed723bdc4dcf128f7f')

build() {
  cd "${srcdir}"

  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l ${srcdir}
}

package() {
  cd "${srcdir}"

  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
