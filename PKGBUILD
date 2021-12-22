# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Matt Frichtl <frichtlm@gmail.com>
# Contributor: Alex Branham <branham@utexas.edu>

_cranname=DBI
_cranver=1.1.2
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="R Database Interface"
arch=(any)
url="https://cran.r-project.org/package=${_cranname}"
license=(LGPL2.1 LGPL3)
depends=('r>=3.0.0')
optdepends=(r-blob r-covr r-dbitest r-dbplyr r-downlit r-dplyr r-glue r-hms r-knitr r-magrittr r-rmariadb r-rmarkdown r-rprojroot r-rsqlite r-testthat r-xml2)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('56ec377d471c76ac234ddfd313bd01a050c99fb6fa5f704f5333b34a5d714f58')

build() {
  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
