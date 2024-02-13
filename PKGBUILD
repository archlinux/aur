# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=multiSight
_pkgver=1.7.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Multi-omics Classification, Functional Enrichment and Network Inference analysis"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('CECILL-2.1')
depends=(
  r-anylib
  r-biosigner
  r-caret
  r-clusterprofiler
  r-config
  r-deseq2
  r-dplyr
  r-dt
  r-easypubmed
  r-enrichplot
  r-ggnewscale
  r-golem
  r-htmltools
  r-igraph
  r-infotheo
  r-metap
  r-mixomics
  r-networkd3
  r-ppcor
  r-r6
  r-reactomepa
  r-rmarkdown
  r-rwikipathways
  r-shiny
  r-shinydashboard
  r-stringr
)
optdepends=(
  r-attempt
  r-biocstyle
  r-knitr
  r-markdown
  r-org.mm.eg.db
  r-processx
  r-rlang
  r-testthat
)
source=("https://bioconductor.org/packages/3.17/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('441d8e6ab1b689928f6f623551fe1459')
b2sums=('53069027a9cbc203591ba8a0a5309a90f900385691c0d49692bfa8e1bdf7651f2e573032f6c37b9627e58bbec40a3a022c1d637e4be040bdd59045622cf00dfb')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
