# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=iteremoval
_pkgver=1.15.1
pkgname=r-${_pkgname,,}
pkgver=1.15.1
pkgrel=1
pkgdesc='Iteration removal method for feature selection'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-genomicranges
  r-ggplot2
  r-magrittr
  r-summarizedexperiment
)
optdepends=(
  r-knitr
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('0218f4fd2bcf4e71df405a78db01a028fa49a8093d6da63cffaab8dd3f45942f')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
