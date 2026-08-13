# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ecoCopula
_pkgver=1.0.6
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
  r-tidygraph
  r-tidyr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('9d421f9399464dd2ac34f3610b4152d0')
b2sums=('92cecd63d8bf345a77fbf89f13c6c7a5e50187603680d6bdeffdfd12c1ad0b4657371c7bda9d7abab731108de8557d9735e3260ce69d0c8d743e6635812a0d5a')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
