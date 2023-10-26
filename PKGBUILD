# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=gamlss.dist
_pkgver=6.1-1
pkgname=r-${_pkgname,,}
pkgver=6.1.1
pkgrel=3
pkgdesc='Distributions for Generalized Additive Models for Location Scale and Shape'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
optdepends=(
  r-distributions3
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('d2db3a7658799c2ef212aa18cb75a3ecf4f73faf8c13dfdc3c14b21ae0129069')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
