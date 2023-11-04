# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=lefser
_pkgver=1.11.5
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="R implementation of the LEfSE method for microbiome biomarker discovery"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(Artistic2.0)
depends=(
  r-coin
  r-ggplot2
  r-s4vectors
  r-summarizedexperiment
)
optdepends=(
  r-biocstyle
  r-covr
  r-curatedmetagenomicdata
  r-knitr
  r-phyloseq
  r-pkgdown
  r-rmarkdown
  r-testthat
  r-withr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('a65d492fab0511df011242671a8055c3')
sha256sums=('4273d86f862935ac23ced81899bbdb1ce86e4c067bb34a5b28ae3f4aa565ccba')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
