# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=fda
_pkgver=6.1.8
pkgname=r-${_pkgname,,}
pkgver=6.1.8
pkgrel=1
pkgdesc='Functional Data Analysis'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-desolve
  r-fds
)
optdepends=(
  r-knitr
  r-lattice
  r-rmarkdown
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('ef8d858a2879491aa2c441d171ba14462bf27852d16e8420fa49aab83f42c407')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
