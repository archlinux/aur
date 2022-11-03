# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=INSPEcT
_pkgver=1.28.0
pkgname=r-${_pkgname,,}
pkgver=1.28.0
pkgrel=1
pkgdesc='Modeling RNA synthesis, processing and degradation with RNA-seq data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biobase
  r-biocgenerics
  r-biocparallel
  r-deseq2
  r-desolve
  r-gdata
  r-genomeinfodb
  r-genomicalignments
  r-genomicfeatures
  r-genomicranges
  r-iranges
  r-plgem
  r-proc
  r-rootsolve
  r-rsamtools
  r-rtracklayer
  r-s4vectors
  r-shiny
  r-summarizedexperiment
  r-txdb.mmusculus.ucsc.mm9.knowngene
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('c3cf37023eed873232c06ffc334dd17e7e882a359ca9ab4d48d909abac5acc88')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
