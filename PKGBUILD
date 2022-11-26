# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=fda
_pkgver=6.0.5
pkgname=r-${_pkgname,,}
pkgver=6.0.5
pkgrel=4
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
sha256sums=('14445776fc65284cd6cae98e5b4dd14c2626d96db5f78c0fcc6aabce5419b8f1')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
