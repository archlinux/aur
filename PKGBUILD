# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=CNVgears
_pkgver=1.10.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
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
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('f0eab3ecb6d1587e739595086c91d265')
b2sums=('6b7c8ab9dc36b719f546010be2fa047cb06f4f9ec631d81187a686330087e2e3ffa219915e2446c3fbe82057852d004ef13be2342f7c98a32800ede8f35ebdf0')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
