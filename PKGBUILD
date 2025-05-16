# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=tximeta
_pkgver=1.26.1
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
md5sums=('297284429ab0d312b0fb12e93b477e41')
b2sums=('0e6e1f59e68bd5aed80455a7024f7fdca0259a232b657cce2f401a42187a7ef4e8f6cf5d980ee5d63c87f9b371b3dd3285ad0abd628be95bb45887d00a9fdbe0')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
