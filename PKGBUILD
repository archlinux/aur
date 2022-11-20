# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MKmisc
_pkgver=1.9
pkgname=r-${_pkgname,,}
pkgver=1.9
pkgrel=1
pkgdesc='Miscellaneous Functions from M. Kohl'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('LGPL')
depends=(
  r
  r-ggplot2
  r-limma
  r-rcolorbrewer
  r-robustbase
  r-scales
)
optdepends=(
  r-amelia
  r-doparallel
  r-exactranktests
  r-foreach
  r-gplots
  r-knitr
  r-parallel
  r-rmarkdown
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('23f97ab7f80142f870b15d610c2f842e75ffd7ef6a75bb244278f0d29de66d26')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
