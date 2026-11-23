# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GenomicState
_pkgver=0.99.17
pkgname=r-${_pkgname,,}
pkgver=0.99.17
pkgrel=1
pkgdesc='Build and access GenomicState objects for use with derfinder tools from sources like Gencode'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-annotationdbi
  r-annotationhub
  r-bumphunter
  r-derfinder
  r-genomicfeatures
  r-iranges
  r-org.hs.eg.db
  r-rtracklayer
  r-seqinfo
  r-txdbmaker
)
optdepends=(
  r-annotationhubdata
  r-biocstyle
  r-covr
  r-derfinderplot
  r-genomeinfodbdata
  r-genomicranges
  r-glue
  r-knitr
  r-refmanager
  r-rmarkdown
  r-sessioninfo
  r-testthat
)
source=("https://bioconductor.org/packages/release/data/annotation/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('79c0f654cb21f3618e3494b2593d9917d3ad378e574a59456fc3609ccb71bfc1')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
