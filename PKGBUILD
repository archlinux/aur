# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Alex Branham <branham@utexas.edu>

_cranname=lava
_cranver=1.6.9
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Latent Variable Models"
arch=(any)
url="https://cran.r-project.org/package=${_cranname}"
license=(GPL3)
depends=('r>=3.0' r-numderiv r-squarem)
optdepends=(r-rgraphviz r-data.table r-ellipse r-fields r-foreach r-geepack r-graph r-knitr r-bookdown r-rmarkdown r-igraph r-lavasearch2 r-lme4 r-magrittr r-mets r-optimx r-polycor r-quantreg r-rgl r-r.rsp r-testthat r-visnetwork r-zoo)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('034d628a22061cf811e7ac9a9210d91e12fec146250da3ad6fbb7ef4f372b11d')

build() {
  cd "${srcdir}"

  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l ${srcdir}
}

package() {
  cd "${srcdir}"

  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
