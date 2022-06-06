# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=optimr
_pkgver=2019-12.16
pkgname=r-${_pkgname,,}
pkgver=2019.12.16
pkgrel=4
pkgdesc="A Replacement and Extension of the 'optim' Function"
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-numderiv
  r-optextras
  r-rcgmin
  r-rvmmin
  r-setrng
)
optdepends=(
  r-knitr
  r-rmarkdown
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('73b1ed560ffd74599517e8baa4c5b293aa062e9c8d50219a3a24b63e72fa7c00')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
