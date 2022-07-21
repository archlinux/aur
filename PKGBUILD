# Maintainer: sukanka <su975853527@gmail.com>
# Contributor: Robert Greener <me@r0bert.dev>

_pkgname=rcompanion
_pkgver=2.4.16
pkgname=r-${_pkgname,,}
pkgver=2.4.16
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
sha256sums=('f4d2f628e44c7c0b19105b5a5f97c78bd88c4fe579eb34dd6696ee6d69469227')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
