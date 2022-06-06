# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=evmix
_pkgver=2.12
pkgname=r-${_pkgname,,}
pkgver=2.12
pkgrel=3
pkgdesc='Extreme Value Mixture Modelling, Threshold Estimation and Boundary Corrected Kernel Density Estimation'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-gsl
  r-sparsem
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('6e47d53463b68ac2782201bcc6240fbc5263b2db1ac0d383062032ab135b2a0b')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
