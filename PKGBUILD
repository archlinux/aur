# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=IntEREst
_pkgver=1.28.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Intron-Exon Retention Estimator"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-biocgenerics
  r-biocparallel
  r-biostrings
  r-dbi
  r-deseq2
  r-dexseq
  r-edger
  r-genomicalignments
  r-genomicfeatures
  r-genomicfiles
  r-genomicranges
  r-iranges
  r-rmysql
  r-rsamtools
  r-s4vectors
  r-seqinr
  r-seqlogo
  r-summarizedexperiment
  r-txdbmaker
)
optdepends=(
  r-bsgenome.hsapiens.ucsc.hg19
  r-clinfun
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('34b2ef2a05b7c64d9ca8091957da686f')
b2sums=('5ddc5e1e14b43223671c5a7452440a034033aa7983a66b4e08fb12c58f9e55f5f7339e61aaa2640148773703463450a6323d40492822eee550a4af53bbcb5a7d')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
