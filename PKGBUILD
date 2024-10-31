# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=survcomp
_pkgver=1.56.0
pkgname=r-${_pkgname,,}
pkgver=1.56.0
pkgrel=1
pkgdesc='Performance Assessment and Comparison for Survival Analysis'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-bootstrap
  r-ipred
  r-prodlim
  r-rmeta
  r-suppdists
  r-survivalroc
)
optdepends=(
  r-biobase
  r-biocmanager
  r-clinfun
  r-hmisc
  r-xtable
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('a8272f134418e54778b531e86997c55f99aa138c6ab62c8750739ea43d51b181')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
