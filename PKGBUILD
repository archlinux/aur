# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=swfdr
_pkgver=1.34.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Estimation of the science-wise false discovery rate and the false discovery rate conditional on covariates"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-or-later')
depends=(
  r
)
optdepends=(
  r-biocstyle
  r-dplyr
  r-ggplot2
  r-knitr
  r-qvalue
  r-reshape2
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('7dd25893ca2375679d2146baa0614538')
b2sums=('c4478f4b0898c29ea4138de3d2764a834200c0dcb542419f1ca0138c867be3f6d18ac35c2d6792dda8f2bcc87453d7bec83cf6c1765628cd2a8f3293bf81cb54')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
