# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RVS
_pkgver=1.32.0
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
md5sums=('75f4503bd29be54cc4ce08924f4fc9ba')
b2sums=('8ad27c3d257694c279f90752fd45333ce1c3edd118f9e9f5ae4db051f5099bf81aba5755a57bf885f01c7610d546cb9dc32e467059dd7283cdf60655dab25af2')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
