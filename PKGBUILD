# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=tximeta
_pkgver=1.30.0
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
  r-dbi
  r-ensembldb
  r-genomicfeatures
  r-genomicranges
  r-iranges
  r-jsonlite
  r-s4vectors
  r-seqinfo
  r-summarizedexperiment
  r-tibble
  r-txdbmaker
  r-tximport
)
optdepends=(
  r-deseq2
  r-devtools
  r-edger
  r-knitr
  r-limma
  r-macrophage
  r-org.dm.eg.db
  r-rmarkdown
  r-testthat
  r-tximportdata
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('b20251386c5c3edaafd443f0ba4ee555')
b2sums=('df8d0a238907513c06f5fb3fc0468d8ef71cc5b01a358f9fbd02c7047cbdb86df14b384928f0957892dc9446327aed916d2dc3324952df4f14369544063008ad')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
