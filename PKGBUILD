# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=optimalFlow
_pkgver=1.12.0
pkgname=r-${_pkgname,,}
pkgver=1.12.0
pkgrel=1
pkgdesc='optimalFlow'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-dbscan
  r-doparallel
  r-dplyr
  r-ellipse
  r-flowmeans
  r-foreach
  r-optimalflowdata
  r-randomforest
  r-rfast
  r-rgl
  r-rlang
  r-robustbase
  r-transport
)
optdepends=(
  r-biocstyle
  r-knitr
  r-magick
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('53c4536bf661bf529164ef11d7c83cd721d03f060142c59228925dabd0dc9e59')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
