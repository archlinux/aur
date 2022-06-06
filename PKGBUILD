# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=DEsingle
_pkgver=1.16.0
pkgname=r-${_pkgname,,}
pkgver=1.16.0
pkgrel=1
pkgdesc='DEsingle for detecting three types of differential expression in single-cell RNA-seq data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-bbmle
  r-biocparallel
  r-gamlss
  r-maxlik
  r-pscl
  r-vgam
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-singlecellexperiment
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('f3838ccc43eba65df7b638fc1a3b34e0edeaf67ebab0db6eb0568290f0fa823f')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
