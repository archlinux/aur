# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ramr
_pkgver=1.14.0
pkgname=r-${_pkgname,,}
pkgver=1.14.0
pkgrel=1
pkgdesc='Detection of Rare Aberrantly Methylated Regions in Array and NGS Data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biocgenerics
  r-doparallel
  r-dorng
  r-envstats
  r-extdist
  r-foreach
  r-genomicranges
  r-ggplot2
  r-iranges
  r-matrixstats
  r-reshape2
  r-s4vectors
)
optdepends=(
  r-annotatr
  r-gridextra
  r-knitr
  r-lola
  r-org.hs.eg.db
  r-rmarkdown
  r-runit
  r-txdb.hsapiens.ucsc.hg19.knowngene
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('3f7054db9fee339154715efd85b7406c5c822208a296b039d1c1e28744135e54')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
