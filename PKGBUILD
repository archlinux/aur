# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=IntEREst
_pkgver=1.30.2
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
  r-rmariadb
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
md5sums=('0a0cd82d16894bb4e5302aefe455c0b9')
b2sums=('a2e820711e6187fde48a3ec3326e84284f9e697b7521c9c7e470a6d401e1af039053be3ebb025733853b0fb2df629e5cea1dba48080d7b202dfb6fcb8a3e79b8')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
