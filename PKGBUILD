# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Alex Branham <branham@utexas.edu>

_cranname=rio
_cranver=0.5.29
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="A Swiss-Army Knife for Data I/O"
arch=(any)
url="https://cran.r-project.org/package=${_cranname}"
license=(GPL2)
depends=('r>=2.15.0' 'r-haven>=1.1.2' 'r-curl>=0.6' 'r-data.table>=1.9.8' 'r-readxl>=0.1.1' r-openxlsx r-tibble)
optdepends=(r-bit64 r-testthat r-knitr r-magrittr r-arrow r-clipr r-feather r-fst r-hexview r-jsonlite r-pzfx r-readods r-readr r-rmarkdown r-rmatio r-xml2 r-yaml)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('9fa63187e1814053e6ed2a164665b4924e08c3453adccb78f7211d403dcc5412')

build() {
  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
