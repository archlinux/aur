# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ERSSA
_pkgver=1.22.0
pkgname=r-${_pkgname,,}
pkgver=1.22.0
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
sha256sums=('22f996208f868fd505ac17e076ada9d202a6533219c3dcb6a98e62f09b27a6ae')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
