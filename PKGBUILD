# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Grey Christoforo <first name at last name dot net>

_cranname=matrixStats
_cranver=0.61.0
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Functions that Apply to Rows and Columns of Matrices (and to Vectors)"
arch=(i686 x86_64)
url="https://cran.r-project.org/package=${_cranname}"
license=(Artistic-2.0)
depends=('r>=2.12.0')
optdepends=(r-base64enc r-ggplot2 r-knitr r-markdown r-microbenchmark r-r.devices r-r.rsp)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('dbd3c0ec59b1ae62ff9b4c2c90c4687cbd680d1796f6fdd672319458d4d2fd9a')

build() {
  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
