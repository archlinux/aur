# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=cola
_pkgver=2.2.0
pkgname=r-${_pkgname,,}
pkgver=2.2.0
pkgrel=1
pkgdesc='A Framework for Consensus Partitioning'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-biocgenerics
  r-brew
  r-circlize
  r-clue
  r-complexheatmap
  r-crayon
  r-digest
  r-doparallel
  r-eulerr
  r-foreach
  r-getoptlong
  r-globaloptions
  r-httr
  r-impute
  r-irlba
  r-knitr
  r-markdown
  r-matrixstats
  r-mclust
  r-microbenchmark
  r-png
  r-rcolorbrewer
  r-rcpp
  r-skmeans
  r-xml2
)
optdepends=(
  r-annotationdbi
  r-biocmanager
  r-clusterprofiler
  r-cowplot
  r-data.tree
  r-dendextend
  r-dose
  r-flexclust
  r-genefilter
  r-gplots
  r-hu6800.db
  r-kohonen
  r-mvtnorm
  r-nmf
  r-pamr
  r-polychrome
  r-reactomepa
  r-rmarkdown
  r-rtsne
  r-samr
  r-simplifyenrichment
  r-testthat
  r-umap
  r-wgcna
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('6ada8a4840e5a9c0aa7c32b389595fe06cbde8b939437bfd9c612c8b2f5680a4')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
