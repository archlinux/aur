# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=corncob
_pkgver=0.4.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
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
md5sums=('68508e556482936c2c4e8e3f28f90cd4')
b2sums=('742415df0c68c357fe6217ecc3f1883998ae6c6f63004b819a9ac5a3567fb40bc5bb9d0c805054f0a2784b743686a746a524203a317971354cb4004b52d85160')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
