# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Rvmmin
_pkgver=2018-4.17.1
pkgname=r-${_pkgname,,}
pkgver=2018.4.17.1
pkgrel=4
pkgdesc='Variable Metric Nonlinear Function Minimization'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-optextras
)
optdepends=(
  r-knitr
  r-markdown
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('55000ac4ff57d42f172c46c7d6b0a603da3b65866d6440d6b32bac4d2b81814e')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
