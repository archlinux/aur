# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RVS
_pkgver=1.36.0
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
md5sums=('bf0926814d42170ed5501444cdc61ab2')
b2sums=('b42acf7c996d075567ec4da9c4db88dcad42d5f127d19d3c7997e501798dd1cb7c536108fcba772aecbacf4dacd14d3321b2fb3d80809adea2e82b0df06ce880')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
