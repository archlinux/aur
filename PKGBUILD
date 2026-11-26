# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=OCplus
_pkgver=1.88.0
pkgname=r-${_pkgname,,}
pkgver=1.88.0
pkgrel=1
pkgdesc='Operating characteristics plus sample size and local fdr for microarray experiments'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('LGPL')
depends=(
  r
  r-interp
  r-multtest
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('744462feb96b6f8bbdce53c78d2eabb1ca58586980bb4526f858a851b9728e29')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
