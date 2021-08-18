# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Grey Christoforo <first name at last name dot net>

_cranname=pillar
_cranver=1.6.2
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Coloured Formatting for Columns"
arch=(any)
url="https://cran.r-project.org/package=${_cranname}"
license=(GPL3)
depends=(r r-cli 'r-crayon>=1.3.4' 'r-ellipsis>=0.3.2' r-fansi r-lifecycle 'r-rlang>=0.3.0' 'r-utf8>=1.1.0' 'r-vctrs>=0.3.8')
optdepends=(r-bit64 r-debugme r-diagrammer r-dplyr r-ggplot2 r-knitr r-lubridate r-nycflights13 r-rmarkdown r-palmerpenguins r-scales r-stringi r-testthat r-tibble r-withr)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('dad1840cff4f6922dabf0f7008ed01ba443d840709c468d3aceeaa92f0b1c698')

build() {
  cd "${srcdir}"

  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l ${srcdir}
}

package() {
  cd "${srcdir}"

  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
