# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=BioMM
_pkgver=1.15.0
pkgname=r-${_pkgname,,}
pkgver=1.15.0
pkgrel=1
pkgdesc='BioMM: Biological-informed Multi-stage Machine learning framework for phenotype prediction using omics data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocparallel
  r-cmplot
  r-e1071
  r-ggplot2
  r-glmnet
  r-imager
  r-nsprcomp
  r-precrec
  r-ranger
  r-rms
  r-topgo
  r-vioplot
  r-xlsx
)
optdepends=(
  r-biocgenerics
  r-biocstyle
  r-knitr
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('d7bc67ffaf2afc3c56f0456a37c25c39022e139670760131f68c32762de08e06')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
