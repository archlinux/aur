# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Rcpi
_pkgver=1.40.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Molecular Informatics Toolkit for Compound-Protein Interaction in Drug Discovery"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-biostrings
  r-doparallel
  r-foreach
  r-gosemsim
  r-pwalign
  r-rcurl
  r-rjson
  r-rlang
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('a96804d0873834e384d594a6a0b87845')
b2sums=('c79601c8cb2b028a93d73f0808647631833145922eceab6be786b7e407ac46dc37d6013293a918c3b865220d6668a538e40214714e0f5719b4b2595595430e3e')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
