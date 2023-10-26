# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=optimalFlow
_pkgver=1.14.0
pkgname=r-${_pkgname,,}
pkgver=1.14.0
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
sha256sums=('b97a0a2aa8a800e4fc9c83a266e90a6cf1aae9ed8032185efdf6e18e886c1c3e')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
