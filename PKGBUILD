# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=AnnotationHub
_pkgver=3.14.0
pkgname=r-${_pkgname,,}
pkgver=3.14.0
pkgrel=1
pkgdesc='Client to access AnnotationHub resources'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-annotationdbi
  r-biocfilecache
  r-biocgenerics
  r-biocmanager
  r-biocversion
  r-curl
  r-dplyr
  r-httr
  r-interactivedisplaybase
  r-rappdirs
  r-rsqlite
  r-s4vectors
  r-yaml
)
optdepends=(
  r-annotationforge
  r-annotationhubdata
  r-biocstyle
  r-biostrings
  r-compounddb
  r-ensembldb
  r-experimenthub
  r-gdsfmt
  r-genomeinfodb
  r-genomicfeatures
  r-genomicranges
  r-hubpub
  r-iranges
  r-keras
  r-knitr
  r-msnbase
  r-mzr
  r-rbiopaxparser
  r-rmarkdown
  r-rsamtools
  r-rtracklayer
  r-runit
  r-summarizedexperiment
  r-variantannotation
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('362279548b64dc2d075e66ed4aab14e1e996552927847708907b5e350d931cd0')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
