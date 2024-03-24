# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=kinship2
_pkgver=1.9.6.1
pkgname=r-${_pkgname,,}
pkgver=1.9.6.1
pkgrel=1
pkgdesc='Pedigree Functions'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-knitr
  r-quadprog
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('695b73964fa1d9329bd5d57f2b44e0faf56fec8a10aff5d936dff7b1d061ef2d')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
