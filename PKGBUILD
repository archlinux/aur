# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Clint Valentine <valentine.clint@gmail.com>
# Contributor: wagnerflo <florian@wagner-flo.net>

_cranname=lubridate
_cranver=1.7.10
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Make Dealing with Dates a Little Easier"
arch=(i686 x86_64)
url="https://cran.r-project.org/package=${_cranname}"
license=(GPL2 GPL3)
depends=('r>=3.2' r-generics 'r-rcpp>=0.12.13')
optdepends=(r-covr r-knitr r-testthat r-vctrs r-rmarkdown)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('15121d213893255f1c8257a5a06acae7b3269b2378d56efd5cc95d9b4d1bc5e8')

build() {
  cd "${srcdir}"

  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l ${srcdir}
}

package() {
  cd "${srcdir}"

  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}

