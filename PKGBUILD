# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=tximeta
_pkgver=1.30.1
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
md5sums=('46a8df4f4e0f8f70aca0c3ad1ec94c6b')
b2sums=('05887284d2064b703f86a9f2abd052b8db0b8dcdaadec21893bb4d348b4da8252a56ca2188b5cb47a5b642245144d32a5195f732b6e425f8401dd080556bbfbf')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
