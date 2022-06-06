# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=fda
_pkgver=6.0.3
pkgname=r-${_pkgname,,}
pkgver=6.0.3
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
  r-lattice
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('205814b9812664e8201221f99e0e8391aa49dba2ae287dc404c57c0c492477d3')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
