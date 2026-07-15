# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=AnnotationHub
_pkgver=4.2.2
pkgname=r-${_pkgname,,}
pkgver=4.2.2
pkgrel=1
pkgdesc='Client to access AnnotationHub resources'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r-annotationdbi
  r-biocbaseutils
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
sha256sums=('a589d443b1c9ff99fc52d021cfbf73613417edda2366f2dfdf4643d07caa292a')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
