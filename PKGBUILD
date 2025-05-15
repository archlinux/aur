# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=DEXSeq
_pkgver=1.54.1
pkgname=r-${_pkgname,,}
pkgver=1.54.1
pkgrel=1
pkgdesc='Inference of differential exon usage in RNA-Seq'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-annotationdbi
  r-biobase
  r-biocgenerics
  r-biocparallel
  r-biomart
  r-deseq2
  r-genefilter
  r-geneplotter
  r-genomicranges
  r-hwriter
  r-iranges
  r-rcolorbrewer
  r-rsamtools
  r-s4vectors
  r-statmod
  r-stringr
  r-summarizedexperiment
)
optdepends=(
  r-biocstyle
  r-genomicalignments
  r-genomicfeatures
  r-glmgampoi
  r-knitr
  r-parathyroidse
  r-pasilla
  r-pasillabamsubset
  r-rmarkdown
  r-roxygen2
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('1820c939d58e260ea941d249a171e312a39c35f1aeaf1e7dbe92b634c6335996')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
