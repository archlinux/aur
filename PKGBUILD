# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GSEABenchmarkeR
_pkgver=1.20.0
pkgname=r-${_pkgname,,}
pkgver=1.20.0
pkgrel=1
pkgdesc='Reproducible GSEA Benchmarking'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-annotationdbi
  r-annotationhub
  r-biobase
  r-biocfilecache
  r-biocparallel
  r-edger
  r-enrichmentbrowser
  r-experimenthub
  r-keggandmetacoredzpathwaysgeo
  r-keggdzpathwaysgeo
  r-s4vectors
  r-summarizedexperiment
)
optdepends=(
  r-biocstyle
  r-gse62944
  r-knitr
  r-rappdirs
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('859a81a71b27d006b586d5a69e31b72b89f70ee43237ff9ee42add1860e53666')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
