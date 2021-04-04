# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Grey Christoforo <first name at last name dot net>

_cranname=vctrs
_cranver=0.3.7
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Vector Helpers"
arch=(i686 x86_64)
url="https://cran.r-project.org/package=${_cranname}"
license=(GPL3)
depends=('r>=3.3' 'r-ellipsis>=0.2.0' r-glue 'r-rlang>=0.4.10')
optdepends=(r-bit64 r-covr r-crayon r-dplyr r-generics r-knitr r-pillar r-pkgdown r-rmarkdown r-testthat r-tibble r-withr r-xml2 r-waldo r-zeallot)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('5ad9b3bcc77ca5153f21d406ea1503b38bd59e7f079c2e6c73bd0cd3c7ec1e0e')

build() {
  cd "${srcdir}"

  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l ${srcdir}
}

package() {
  cd "${srcdir}"

  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
