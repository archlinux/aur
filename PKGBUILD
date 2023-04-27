# system requirements: python
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=msImpute
_pkgver=1.10.0
pkgname=r-${_pkgname,,}
pkgver=1.10.0
pkgrel=1
pkgdesc='Imputation of label-free mass spectrometry peptides'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-data.table
  r-dplyr
  r-fnn
  r-limma
  r-matrixstats
  r-mvtnorm
  r-pdist
  r-reticulate
  r-scran
  r-softimpute
  r-tidyr
  python
)
optdepends=(
  r-biocstyle
  r-complexheatmap
  r-imputelcmd
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('650867e777950289714ee319412e10498883a89ee9e46fa31fb8a7a665abdfd6')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
