# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=DExMA
_pkgver=1.10.3
pkgname=r-${_pkgname,,}
pkgver=1.10.3
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
  r-rcolorbrewer
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
sha256sums=('ff5cafff1ce3e3a84eb0653ea3d1fd31313c722414e1a39e08fca7c106ff6841')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
