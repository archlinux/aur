# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GenomicScores
_pkgver=2.12.0
pkgname=r-${_pkgname,,}
pkgver=2.12.0
pkgrel=1
pkgdesc='Infrastructure to work with genomewide position-specific scores'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-annotationhub
  r-biobase
  r-biocfilecache
  r-biocgenerics
  r-biocmanager
  r-biostrings
  r-delayedarray
  r-genomeinfodb
  r-genomicranges
  r-hdf5array
  r-httr
  r-iranges
  r-rhdf5
  r-s4vectors
  r-xml
)
optdepends=(
  r-biocstyle
  r-bsgenome.hsapiens.ucsc.hg19
  r-data.table
  r-dt
  r-gwascat
  r-knitr
  r-mafdb.1kgenomes.phase1.hs37d5
  r-magrittr
  r-phastcons100way.ucsc.hg19
  r-rcolorbrewer
  r-rmarkdown
  r-runit
  r-shiny
  r-shinycustomloader
  r-shinydashboard
  r-shinyjs
  r-snplocs.hsapiens.dbsnp144.grch37
  r-txdb.hsapiens.ucsc.hg19.knowngene
  r-variantannotation
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('a66fc03f027ba34edc0db4ef4d32e2b975f07ac363641d9d5e1c7793974e10fd')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
