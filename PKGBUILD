# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=airway
_pkgver=1.22.0
pkgname=r-${_pkgname,,}
pkgver=1.22.0
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
sha256sums=('79713bc8a6078ba93f306e5e8e7ba74aa09b7fb354153112e48dedaf0c5f45f7')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
