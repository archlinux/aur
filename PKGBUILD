# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ERSSA
_pkgver=1.26.0
pkgname=r-${_pkgname,,}
pkgver=1.26.0
pkgrel=1
pkgdesc='Empirical RNA-seq Sample Size Analysis'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-apeglm
  r-biocparallel
  r-deseq2
  r-edger
  r-ggplot2
  r-plyr
  r-rcolorbrewer
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('7288d9fcc0899b2c2c131bd447dd3676dfbed1c7a7b8ffd9eb34a41ef60c1974')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
