# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=mplot
_pkgver=1.0.6
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Graphical Model Stability and Variable Selection Procedures"
arch=(any)
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL-2.0-or-later')
depends=(
  r-bestglm
  r-doparallel
  r-dorng
  r-dplyr
  r-foreach
  r-ggplot2
  r-glmnet
  r-googlevis
  r-leaps
  r-magrittr
  r-plyr
  r-reshape2
  r-scales
  r-shiny
  r-shinydashboard
  r-tidyr
)
optdepends=(
  r-dt
  r-glmulti
  r-knitr
  r-mvoutlier
  r-rmarkdown
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('78087394e1789662440a3a99a036c03c')
b2sums=('c23cebea73fd1ca40304b3dbb6bff6ce6923e7707c9c88769ae672bd03d5f70a70eee7d2b1122c9943a3b56e270bf050c8ca40ba2569b3e6c7165d15cf9964ab')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
