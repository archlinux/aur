# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=LineagePulse
_pkgver=1.21.0
pkgname=r-${_pkgname,,}
pkgver=1.21.0
pkgrel=1
pkgdesc='Differential expression analysis and model fitting for single-cell RNA-seq data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biocparallel
  r-circlize
  r-complexheatmap
  r-ggplot2
  r-gplots
  r-knitr
  r-rcolorbrewer
  r-singlecellexperiment
  r-summarizedexperiment
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('0fd7a5a7620e3da6fd2120a23981545c7bf8ddcb66b22f6f1b0e6b4ff589a127')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
