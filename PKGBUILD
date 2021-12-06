# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Alex Branham <branham@utexas.edu>

_cranname=lava
_cranver=1.6.10
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Latent Variable Models"
arch=(any)
url="https://cran.r-project.org/package=${_cranname}"
license=(GPL3)
depends=('r>=3.0' r-future.apply r-progressr r-numderiv r-squarem)
optdepends=(r-rgraphviz r-data.table r-ellipse r-fields r-geepack r-graph r-knitr r-bookdown r-rmarkdown r-igraph r-lavasearch2 r-lme4 r-magrittr r-mets r-optimx r-polycor r-quantreg r-rgl r-r.rsp r-testthat r-visnetwork r-zoo)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('7a88f8a885872e2abb3011c446e9e1c4884cd4dbe6ab4cfe9207538e5560232e')

build() {
  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
