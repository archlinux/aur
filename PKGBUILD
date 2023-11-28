# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=tximeta
_pkgver=1.20.1
pkgname=r-${_pkgname,,}
pkgver=1.20.1
pkgrel=1
pkgdesc='Transcript Quantification Import with Automatic Metadata'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-annotationdbi
  r-annotationhub
  r-biocfilecache
  r-biostrings
  r-ensembldb
  r-genomeinfodb
  r-genomicfeatures
  r-genomicranges
  r-iranges
  r-jsonlite
  r-s4vectors
  r-summarizedexperiment
  r-tibble
  r-tximport
)
optdepends=(
  r-deseq2
  r-devtools
  r-edger
  r-fishpond
  r-knitr
  r-limma
  r-org.dm.eg.db
  r-rmarkdown
  r-testthat
  r-tximportdata
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('4d137c4c904a2969f61311fbb5047d694b6568c2141fa171e9ab9c69767c9e03')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
