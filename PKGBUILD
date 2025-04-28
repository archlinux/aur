# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=atena
_pkgver=1.14.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Analysis of Transposable Elements"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-annotationhub
  r-biocgenerics
  r-biocparallel
  r-cli
  r-genomeinfodb
  r-genomicalignments
  r-genomicfeatures
  r-genomicranges
  r-iranges
  r-matrixgenerics
  r-matrixstats
  r-rsamtools
  r-s4vectors
  r-sparsematrixstats
  r-squarem
  r-summarizedexperiment
)
optdepends=(
  r-biocstyle
  r-covr
  r-knitr
  r-rcolorbrewer
  r-rmarkdown
  r-runit
  r-txdb.dmelanogaster.ucsc.dm6.ensgene
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('6df35452c39403adb449a974ef1d8d4d')
b2sums=('36eb79f1032d1bb134d6c5238322eea9e69d85c561072dbfe2c4dcd873e3cf3a7d2c483136d6a068250086d37379bc78239f8c150fc2e54b5dcd3bca5a014650')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
