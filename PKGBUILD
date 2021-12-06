# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Alex Branham <branham@utexas.edu>

_cranname=foreach
_cranver=1.5.1
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Provides Foreach Looping Construct"
arch=(any)
url="https://cran.r-project.org/package=${_cranname}"
license=(Apache2.0)
depends=('r>=2.5.0' r-iterators)
optdepends=(r-randomforest r-domc r-doparallel r-testthat r-knitr r-rmarkdown)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('fb5ad69e295618c52b2ac7dff84a0771462870a97345374d43b3de2dc31a68e1')

build() {
  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
