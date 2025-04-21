# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Rcpi
_pkgver=1.44.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Molecular Informatics Toolkit for Compound-Protein Interaction in Drug Discovery"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-biostrings
  r-curl
  r-doparallel
  r-foreach
  r-gosemsim
  r-httr2
  r-jsonlite
  r-rlang
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('5924f381e82734644518935856bf1a81')
b2sums=('e145e4d2ce97952c29eedc2a6721f92be74222b830508f0e632877b05bbe1bc335a51f9c0e71179bbdc196b85b8551d9c1594952721a2fcb0ed7c60da512e0c4')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
