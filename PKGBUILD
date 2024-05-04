# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RCAS
_pkgver=1.30.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="RNA Centric Annotation System"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  pandoc
  r-biocgenerics
  r-biostrings
  r-bsgenome
  r-bsgenome.hsapiens.ucsc.hg19
  r-cowplot
  r-data.table
  r-dt
  r-genomation
  r-genomeinfodb
  r-genomicfeatures
  r-genomicranges
  r-ggplot2
  r-gprofiler2
  r-iranges
  r-knitr
  r-pbapply
  r-pheatmap
  r-plotly
  r-plotrix
  r-proxy
  r-ranger
  r-rmarkdown
  r-rsqlite
  r-rtracklayer
  r-s4vectors
  r-seqlogo
  r-txdbmaker
)
optdepends=(
  r-biocmanager
  r-covr
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('c8c7d967f8176593fc445ba48baee3a0')
b2sums=('87d137d33e3fc03f0ceccc201f9d544e8be948a8c7cf13274b2241ff8934a5a83a1f714f80449ff20b1f1dd0452e801ff3e4c9de4ce8f4c6f3ff413699d347e2')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
