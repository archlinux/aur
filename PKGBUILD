# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=DExMA
_pkgver=1.4.5
pkgname=r-${_pkgname,,}
pkgver=1.4.5
pkgrel=1
pkgdesc='Differential Expression Meta-Analysis'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biobase
  r-bnstruct
  r-dexmadata
  r-geoquery
  r-impute
  r-limma
  r-pheatmap
  r-plyr
  r-scales
  r-snpstats
  r-sva
  r-swamp
)
optdepends=(
  r-biocgenerics
  r-biocstyle
  r-qpdf
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('e034a5c66963d5bb24fb5edb5b58d04a6058976e9b0a0f84323b09d40368fd22')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
