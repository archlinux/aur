# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=CCP
_pkgver=1.2
pkgname=r-${_pkgname,,}
pkgver=1.2
pkgrel=3
pkgdesc='Significance Tests for Canonical Correlation Analysis (CCA)'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('7e3906abf51f4c7046730760800711b915f52855fbb2bfd33eca8fa75e70f618')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
