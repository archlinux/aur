# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RVS
_pkgver=1.34.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Computes estimates of the probability of related individuals sharing a rare variant"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-genlib
  r-grain
  r-kinship2
  r-r.utils
  r-snpstats
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-testthat
  r-variantannotation
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('1dab58490a758ebf28538ff73016dfa8')
b2sums=('4c1bdc69f69b4c1d5301d1d67779d322f1870be4488d93d54cf448f685e834099d80b6303b47b760d61d26ee737729760d43d80a2e120a258403931f80a088f7')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
