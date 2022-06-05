# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=aods3
_pkgver=0.4-1.1
pkgname=r-${_pkgname,,}
pkgver=0.4.1.1
pkgrel=1
pkgdesc='Analysis of Overdispersed Data using S3 Methods'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-lme4
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('3b9f089c8924b67b579761260513bcbac37411734653d9b802f54f5bda7fb5cd')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
