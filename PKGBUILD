# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=metagenomeSeq
_pkgver=1.56.0
pkgname=r-${_pkgname,,}
pkgver=1.56.0
pkgrel=1
pkgdesc='Statistical analysis for sparse high-throughput sequencing'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biobase
  r-foreach
  r-glmnet
  r-gplots
  r-limma
  r-matrixstats
  r-rcolorbrewer
  r-wrench
)
optdepends=(
  r-annotate
  r-biocgenerics
  r-biomformat
  r-gss
  r-ihw
  r-interactivedisplay
  r-knitr
  r-testthat
  r-vegan
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('32df8a2e5ce9b61c0f85c0d87b16e550aa24416158300cce3d7ebdc8b57fbeaf')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
