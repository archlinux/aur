# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=sangerseqR
_pkgver=1.42.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Tools for Sanger Sequencing Data in R"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-biostrings
  r-pwalign
  r-shiny
  r-stringr
)
optdepends=(
  r-biocgenerics
  r-biocstyle
  r-knitr
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('f23125bae93ccaf24462cf34eb3aa323')
b2sums=('5a13d18cc7c31b75fe221c2ed86eabcda68b06a7542ad1920f6b5872e087627f0af07902db0af0006fdcb28718cd4241ca640344b5d35d7dc354ecd7a30beaf3')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
