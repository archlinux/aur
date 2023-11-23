# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=lefser
_pkgver=1.12.1
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
md5sums=('c3b2deaf4b58de1bb930164df11a388f')
sha256sums=('157dbfc094dc414ae49baa7b55a3ff48d857a6bb0f189c45509c73726de4dc2b')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
