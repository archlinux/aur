# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=airway
_pkgver=1.20.0
pkgname=r-${_pkgname,,}
pkgver=1.20.0
pkgrel=1
pkgdesc='RangedSummarizedExperiment for RNA-Seq in airway smooth muscle cells, by Himes et al PLoS One 2014'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('LGPL')
depends=(
  r
  r-summarizedexperiment
)
optdepends=(
  r-geoquery
  r-knitr
  r-markdown
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('2669c3162770a3d4938bfa4c4280d78c936b1b8fc59e8da62a9da82d1415d77c')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
