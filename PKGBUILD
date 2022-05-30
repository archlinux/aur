# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Alex Branham <branham@utexas.edu>

_cranname=readxl
_cranver=1.4.0
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=2
pkgdesc="Read Excel Files"
arch=(i686 x86_64)
url="https://cran.r-project.org/package=${_cranname}"
license=(GPL3)
depends=(r r-cellranger 'r-cpp11>=0.4.0' 'r-tibble>=1.3.1' r-progress)
optdepends=(r-covr r-knitr r-rmarkdown r-rprojroot r-testthat)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('ab9239c249f79b649f7665a612b3dbf4b774ab633115e6dee41091a8cb2491f7')

build() {
  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
