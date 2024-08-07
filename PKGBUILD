# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ecoCopula
_pkgver=1.0.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Graphical Modelling and Ordination using Copulas"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('LGPL-2.1-or-later')
depends=(
  r-betareg
  r-doparallel
  r-foreach
  r-glasso
  r-glm2
  r-igraph
  r-mvabund
  r-ordinal
  r-plyr
  r-sna
  r-tweedie
)
optdepends=(
  r-ggplot2
  r-ggraph
  r-knitr
  r-labdsv
  r-rcolorbrewer
  r-rmarkdown
  r-testthat
  r-tidygraph
  r-tidyr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('575012c6205ca194826e775a9060abbb')
b2sums=('5e35b831095a79e7471ddd754429a066639ce442824a9b3b92806dd878707d5bd78b3327c370700c1a8f711f1c7a8f8b7a0c1c41176c62dd8fbad21da2d590cd')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
