# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=made4
_pkgver=1.72.0
pkgname=r-${_pkgname,,}
pkgver=1.72.0
pkgrel=1
pkgdesc='Multivariate analysis of microarray data using ADE4'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-ade4
  r-biobase
  r-gplots
  r-rcolorbrewer
  r-scatterplot3d
  r-summarizedexperiment
)
optdepends=(
  r-affy
  r-biocstyle
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('c219050859cb4fcf60dc5a41712bd6f5334e5a12384cec544a2c42b5fe8b8c7a')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
