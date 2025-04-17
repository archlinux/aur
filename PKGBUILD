# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=scRecover
_pkgver=1.24.0
pkgname=r-${_pkgname,,}
pkgver=1.24.0
pkgrel=1
pkgdesc='scRecover for imputation of single-cell RNA-seq data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-bbmle
  r-biocparallel
  r-doparallel
  r-foreach
  r-gamlss
  r-kernlab
  r-penalized
  r-preseqr
  r-pscl
  r-rsvd
  r-saver
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-singlecellexperiment
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('d2f7c28c873e7ed3f76a40f9188100ddb293c1e4a7e21360d5c5953db8903ebc')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
