# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Grey Christoforo <first name at last name dot net>

_cranname=pillar
_cranver=1.6.0
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Coloured Formatting for Columns"
arch=(any)
url="https://cran.r-project.org/package=${_cranname}"
license=(GPL3)
depends=(r r-cli 'r-crayon>=1.3.4' r-ellipsis r-fansi r-lifecycle 'r-rlang>=0.3.0' 'r-utf8>=1.1.0' 'r-vctrs>=0.2.0')
optdepends=(r-bit64 r-debugme r-diagrammer r-dplyr r-ggplot2 r-knitr r-lubridate r-nycflights13 r-rmarkdown r-palmerpenguins r-scales r-stringi r-testthat r-tibble r-withr)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('f1101e886f860105a014682e6ea3b7c6f01d15dd5bde35b7c6d544390c36cadd')

build() {
  cd "${srcdir}"

  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l ${srcdir}
}

package() {
  cd "${srcdir}"

  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
