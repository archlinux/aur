# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=chipenrich
_pkgver=2.30.0
pkgname=r-${_pkgname,,}
pkgver=2.30.0
pkgrel=1
pkgdesc='Gene Set Enrichment For ChIP-seq Peak Data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-annotationdbi
  r-biocgenerics
  r-chipenrich.data
  r-genomeinfodb
  r-genomicranges
  r-iranges
  r-latticeextra
  r-org.dm.eg.db
  r-org.dr.eg.db
  r-org.hs.eg.db
  r-org.mm.eg.db
  r-org.rn.eg.db
  r-plyr
  r-rms
  r-rtracklayer
  r-s4vectors
  r-stringr
)
optdepends=(
  r-biocstyle
  r-devtools
  r-knitr
  r-rmarkdown
  r-roxygen2
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('d78fe6be3ce533f6b8c6e4d705f7cfdf326a843ebf32901e548012c2b8958694')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
