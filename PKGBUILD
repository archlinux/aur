# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=peco
_pkgver=1.20.0
pkgname=r-${_pkgname,,}
pkgver=1.20.0
pkgrel=1
pkgdesc='A Supervised Approach for **P**r**e**dicting **c**ell Cycle Pr**o**gression using scRNA-seq data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-assertthat
  r-circular
  r-conicfit
  r-doparallel
  r-foreach
  r-genlasso
  r-scater
  r-singlecellexperiment
  r-summarizedexperiment
)
optdepends=(
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('960f3d750ee02a5cbc43f1688d07420aef1d0867a77ff9abcb81cffbb32c4885')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
