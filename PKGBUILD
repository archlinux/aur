# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=scanMiR
_pkgver=1.10.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="scanMiR"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-biocparallel
  r-biostrings
  r-cowplot
  r-data.table
  r-genomeinfodb
  r-genomicranges
  r-ggplot2
  r-iranges
  r-pwalign
  r-s4vectors
  r-seqlogo
  r-stringi
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('1539e336dcb43018479f7661a71ee7fc')
b2sums=('7abcdb6ade1aa89edb49464500d408282ce57558e1c0c54eaf9f1b77e27078ba4044dbdae28dffda0c5513bdc4bed0ab290ab07bc7d58972afe5db76e93546fc')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
