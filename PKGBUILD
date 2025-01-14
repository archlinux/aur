# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: sukanka <su975853527@gmail.com>

_pkgname=heplots
_pkgver=1.7.3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Visualizing Hypothesis Tests in Multivariate Linear Models"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-broom
  r-car
  r-magrittr
  r-purrr
  r-rgl
  r-tibble
)
optdepends=(
  r-animation
  r-archdata
  r-bookdown
  r-candisc
  r-cardata
  r-corrgram
  r-dplyr
  r-effects
  r-ggplot2
  r-glue
  r-gplots
  r-here
  r-knitr
  r-mvinfluence
  r-patchwork
  r-qqtest
  r-reshape
  r-reshape2
  r-rmarkdown
  r-rrcov
  r-sleuth2
  r-tidyr
  r-tinytable
  r-markdown
  r-vcdextra
  r-r.rsp
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('8b0c9db6ab03e7725fd261deefe5e1bc')
b2sums=('adc627a81806d2c7a8149449e2bfd20e3f693e644372a9c0c2dcb4933279feac0579078134d28fe16241839e96db3015a65ce4f247dae5f1700e5b32eae265a7')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
