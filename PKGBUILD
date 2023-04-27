# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=TrajectoryGeometry
_pkgver=1.8.0
pkgname=r-${_pkgname,,}
pkgver=1.8.0
pkgrel=1
pkgdesc='This Package Discovers Directionality in Time and Pseudo-times Series of Gene Expression Patterns'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-ggplot2
  r-pracma
  r-rgl
)
optdepends=(
  r-dplyr
  r-knitr
  r-rcolorbrewer
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('84d3f6a19a2dbf945b68b96883b8e9a75056354c0d93fa0454257fffc8077ad1')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
