# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Grey Christoforo <first name at last name dot net>

_cranname=cli
_cranver=3.1.0
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Helpers for Developing Command Line Interfaces"
arch=(i686 x86_64)
url="https://cran.r-project.org/package=${_cranname}"
license=(MIT)
depends=('r>=2.10' r-glue)
optdepends=(r-asciicast r-callr r-covr r-htmltools r-htmlwidgets r-knitr r-mockery r-processx r-ps r-rlang r-rmarkdown r-rstudioapi r-shiny r-testthat r-tibble r-whoami r-withr)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('c70a61830bf706a84c59eb74a809978846cee93742198ab4192742a5df1ace11')

build() {
  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
