# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=bnbc
_pkgver=1.24.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Bandwise normalization and batch correction of Hi-C data"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-biocgenerics
  r-data.table
  r-ebimage
  r-genomeinfodb
  r-genomicranges
  r-hicbricks
  r-iranges
  r-matrixstats
  r-preprocesscore
  r-rcpp
  r-rhdf5
  r-s4vectors
  r-summarizedexperiment
  r-sva
)
optdepends=(
  r-biocstyle
  r-bsgenome.hsapiens.ucsc.hg19
  r-knitr
  r-rmarkdown
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('b67ce630de09f407a25d2e7c8fb1cd8b')
b2sums=('0028d04999c144f4fa190a222d4d5f4ed186ce92d1d62363c4579c6e2862ac95a1948e24ea84ac2b4682500dceaae331ddd8dbc2619d700b172df795019552aa')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
