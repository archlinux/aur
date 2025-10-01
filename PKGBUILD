# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=tximeta
_pkgver=1.26.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Transcript Quantification Import with Automatic Metadata"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-annotationdbi
  r-annotationhub
  r-biocfilecache
  r-biostrings
  r-ensembldb
  r-genomeinfodb
  r-genomicfeatures
  r-genomicranges
  r-iranges
  r-jsonlite
  r-s4vectors
  r-summarizedexperiment
  r-tibble
  r-txdbmaker
  r-tximport
)
optdepends=(
  r-deseq2
  r-devtools
  r-edger
  r-fishpond
  r-knitr
  r-limma
  r-org.dm.eg.db
  r-rmarkdown
  r-testthat
  r-tximportdata
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('a798c1e25611b3b823637bff015d04a1')
b2sums=('b9c43073f47e0f4c10662a9274569b937a75ac932d8b467807b1bcb8ad3fd4c446abe740506d34daebea8990910659fb508c934f3ed6e91b7df4a4d8fdbf2a4a')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
