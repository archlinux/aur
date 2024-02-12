# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=CNVgears
_pkgver=1.8.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="A Framework of Functions to Combine, Analize and Interpret CNVs Calling Results"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-data.table
  r-ggplot2
)
optdepends=(
  r-biomart
  r-cn.mops
  r-cowplot
  r-delayedarray
  r-devtools
  r-evobir
  r-genomicranges
  r-knitr
  r-r.utils
  r-rmarkdown
  r-scales
  r-testthat
  r-usethis
  r-variantannotation
)
source=("https://bioconductor.org/packages/3.17/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('b1a4be3f56d83bfa3e3c7c67208641b2')
b2sums=('3259fac597d894d6bffe75a997e9c0d8052fd30643f6b947ecfb62bf754a6979a3ea3196ad4324b0b79f56dffea09d879bc600df7cde46b9b43f899a14e3abba')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
