# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Maaslin2
_pkgver=1.10.0
pkgname=r-${_pkgname,,}
pkgver=1.10.0
pkgrel=1
pkgdesc='"Multivariable Association Discovery in Population-scale Meta-omics Studies"'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-biglm
  r-car
  r-chemometrics
  r-cplm
  r-data.table
  r-dplyr
  r-edger
  r-ggplot2
  r-glmmtmb
  r-hash
  r-lme4
  r-lmertest
  r-logging
  r-lpsymphony
  r-metagenomeseq
  r-optparse
  r-pbapply
  r-pcapp
  r-pheatmap
  r-pscl
  r-robustbase
  r-vegan
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('e0f458b8d34b4b0b7d17f7c801b18b19ee6497d7cece2b648e14fdf27add82e3')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
