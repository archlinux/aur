# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=sigFeature
_pkgver=1.30.0
pkgname=r-${_pkgname,,}
pkgver=1.30.0
pkgrel=1
pkgdesc='sigFeature: Significant feature selection using SVM-RFE & t-statistic'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocparallel
  r-biocviews
  r-e1071
  r-openxlsx
  r-pheatmap
  r-rcolorbrewer
  r-sparsem
  r-summarizedexperiment
)
optdepends=(
  r-biocgenerics
  r-knitr
  r-rmarkdown
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('c010a6941f528af98589e288fb0970f7f1259df4f8ee51d36cbbcef3a981fb61')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
