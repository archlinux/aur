# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=pinfsc50
_pkgver=1.3.0
pkgname=r-${_pkgname,,}
pkgver=1.3.0
pkgrel=1
pkgdesc="Sequence, Annotation and Variants for 17 Samples of P. Infestans and 1 P. Mirabilis"
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('971627cf4567fdb34db26010f2db44cfac5ff07f327d3247e778638cc4e849bf')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
