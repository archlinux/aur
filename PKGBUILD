# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Organism.dplyr
_pkgver=1.30.1
pkgname=r-${_pkgname,,}
pkgver=1.30.1
pkgrel=1
pkgdesc='dplyr-based Access to Bioconductor Annotation Resources'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-annotationdbi
  r-annotationfilter
  r-biocfilecache
  r-dbi
  r-dbplyr
  r-dplyr
  r-genomeinfodb
  r-genomicfeatures
  r-genomicranges
  r-iranges
  r-rlang
  r-rsqlite
  r-s4vectors
  r-tibble
)
optdepends=(
  r-biocstyle
  r-ggplot2
  r-knitr
  r-org.hs.eg.db
  r-org.mm.eg.db
  r-rmarkdown
  r-testthat
  r-txdb.hsapiens.ucsc.hg38.knowngene
  r-txdb.mmusculus.ucsc.mm10.ensgene
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('85e0093b2775950560ec3c0d27b2aea1a1fbd2f6a5423c88b5bfe5fe7074a5e8')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
