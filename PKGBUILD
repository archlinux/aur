# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=AnnotationHubData
_pkgver=1.32.0
pkgname=r-${_pkgname,,}
pkgver=1.32.0
pkgrel=1
pkgdesc='Transform public data resources into Bioconductor Data Structures'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-annotationdbi
  r-annotationforge
  r-annotationhub
  r-biobase
  r-bioccheck
  r-biocgenerics
  r-biocmanager
  r-biocviews
  r-biostrings
  r-dbi
  r-futile.logger
  r-genomeinfodb
  r-genomicfeatures
  r-genomicranges
  r-graph
  r-iranges
  r-jsonlite
  r-organismdbi
  r-rcurl
  r-rsamtools
  r-rsqlite
  r-rtracklayer
  r-s4vectors
  r-xml
)
optdepends=(
  r-biocstyle
  r-genomeinfodbdata
  r-grasp2db
  r-hubpub
  r-knitr
  r-rmarkdown
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('7fb469b51448ede438fccbcf979d5733abad5a2659df6d5aec6a277a7e317f4a')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
