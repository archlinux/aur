# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=scds
_pkgver=1.18.0
pkgname=r-${_pkgname,,}
pkgver=1.18.0
pkgrel=1
pkgdesc='In-Silico Annotation of Doublets for Single Cell RNA Sequencing Data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-dplyr
  r-proc
  r-s4vectors
  r-singlecellexperiment
  r-summarizedexperiment
  r-xgboost
)
optdepends=(
  r-biocstyle
  r-cowplot
  r-knitr
  r-rmarkdown
  r-rsvd
  r-rtsne
  r-scater
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('c0ba79cd36dc4ba825c0f6cc6cf5a76e61d7215c07902bf48732265103dbbf32')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
