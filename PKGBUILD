# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=corncob
_pkgver=0.4.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Count Regression for Correlated Observations with the Beta-Binomial"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-detectseparation
  r-dplyr
  r-ggplot2
  r-magrittr
  r-numderiv
  r-rlang
  r-scales
  r-trust
  r-vgam
)
optdepends=(
  r-covr
  r-knitr
  r-limma
  r-optimx
  r-phyloseq
  r-r.rsp
  r-rmarkdown
  r-slam
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('050e514bd0806ade62b58aba13f15cf1')
b2sums=('a3e6617f76b8fe23d037a04d47114c0547b03fa5160d345fc99d43267c8767815573d291ffa8f12b7fae97fde51fdadd89d77f0e49326c3511ab2310023918e0')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
