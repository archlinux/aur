# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=scRNAseq
_pkgver=2.26.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Collection of Public Single-Cell RNA-Seq Datasets"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('CC0-1.0')
depends=(
  r-alabaster.base
  r-alabaster.matrix
  r-alabaster.sce
  r-annotationdbi
  r-annotationhub
  r-biocgenerics
  r-dbi
  r-delayedarray
  r-ensembldb
  r-experimenthub
  r-genomicfeatures
  r-genomicranges
  r-gypsum
  r-jsonlite
  r-rsqlite
  r-s4vectors
  r-singlecellexperiment
  r-sparsearray
  r-summarizedexperiment
)
optdepends=(
  r-biocmanager
  r-biocstyle
  r-jsonvalidate
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('6b93f67c72fac3ff1eb22285550538ea')
b2sums=('ade2cb6c41cb5ef753dbd67b271b56fea5a988ce5febe5df8c01637417efb1154f8de6d7b166db0ebb45824b750a4f3aac965e865f9cd34452cade2da4477d22')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
