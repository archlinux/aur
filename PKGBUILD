# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=hummingbird
_pkgver=1.14.0
pkgname=r-${_pkgname,,}
pkgver=1.14.0
pkgrel=1
pkgdesc='Bayesian Hidden Markov Model for the detection of differentially methylated regions'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-genomicranges
  r-iranges
  r-rcpp
  r-summarizedexperiment
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('37a5700caae867484483ad54d53389dd6c116118195242adee52fba7603d11d1')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
