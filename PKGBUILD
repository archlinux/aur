# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=made4
_pkgver=1.82.0
pkgname=r-${_pkgname,,}
pkgver=1.82.0
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
sha256sums=('2efbb878a2720e33d4f0bbcb16ae6b8f7b6220b376c3a88a26e05f1bf847eb3f')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
