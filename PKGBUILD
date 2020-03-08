# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Alex Branham <branham@utexas.edu>

_cranname=roxygen2
_cranver=7.0.2
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="In-Line Documentation for R"
arch=(i686 x86_64)
url="https://cran.r-project.org/package=${_cranname}"
license=(GPL2 GPL3)
depends=('r>=3.2' r-brew r-commonmark 'r-desc>=1.2.0' r-digest 'r-pkgload>=1.0.2' 'r-purrr>=0.3.3' 'r-r6>=2.1.2' 'r-rcpp>=0.11.0' r-rlang r-stringi 'r-stringr>=1.0.0' r-xml2)
makedepends=(gcc)
optdepends=(r-covr r-devtools r-knitr r-rmarkdown r-testthat r-r.methodss3 r-r.oo)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('95a793d446f18c00d2e885b2a0d289ea')

build() {
  cd "${srcdir}"

  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l ${srcdir}
}

package() {
  cd "${srcdir}"

  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
