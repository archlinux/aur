# Maintainer: sukanka <su975853527@gmail.com>
# Contributor: Robert Greener <me@r0bert.dev>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_pkgname=rcompanion
_pkgver=2.4.36
pkgname=r-${_pkgname,,}
pkgver=2.4.36
pkgrel=1
pkgdesc='Functions to Support Extension Education Program Evaluation'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-coin
  r-desctools
  r-lmtest
  r-multcompview
  r-nortest
  r-plyr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('1b59a13fcd0547962165bd36ed876c794bfdba7577a8c68b4f9090eaf8bdd364')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
