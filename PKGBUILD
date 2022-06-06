# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=feature
_pkgver=1.2.15
pkgname=r-${_pkgname,,}
pkgver=1.2.15
pkgrel=3
pkgdesc='Local Inferential Feature Significance for Multivariate Kernel Density Estimation'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-ks
  r-plot3d
)
optdepends=(
  r-knitr
  r-mass
  r-misc3d
  r-rgl
  r-rmarkdown
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('de38292b7e800068a20824e2a9e7d5d4d0b465b7925db0d165346aa5030ff67b')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
