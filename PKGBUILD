# Maintainer: Robert Greener <me@r0bert.dev>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Alex Branham <branham@utexas.edu>

_cranname=roxygen2
_cranver=7.2.0
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="In-Line Documentation for R"
arch=(i686 x86_64)
url="https://cran.r-project.org/package=${_cranname}"
license=(MIT)
depends=('r>=3.3' r-brew r-commonmark 'r-desc>=1.2.0' r-digest r-knitr 'r-pkgload>=1.0.2' 'r-purrr>=0.3.3' 'r-r6>=2.1.2' r-rlang r-stringi 'r-stringr>=1.0.0' r-xml2 r-cpp11)
optdepends=(r-covr r-devtools r-rmarkdown r-testthat r-r.methodss3 r-r.oo)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('2ebfcfd567b9db6c606c6d42be1645b4e987f987995a2ad8954fa963a519448b')

build() {
  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
